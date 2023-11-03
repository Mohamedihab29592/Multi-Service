
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_serivce/features/home/presenation/controllers/users_bloc/users_events.dart';
import 'package:multi_serivce/features/home/presenation/controllers/users_bloc/users_states.dart';

import '../../../../../core/error/faliure.dart';
import '../../../../../core/utilis/appStrings.dart';
import '../../../domain/entities/users_entity.dart';
import '../../../domain/useCases/users_UseCases.dart';





class UsersBloc extends Bloc<UsersEvent, UsersState> {
  static UsersBloc get(context) => BlocProvider.of(context);

  final GetUsersUseCase getUsersUseCase;

  UsersBloc({required this.getUsersUseCase}) : super( UsersInitial())

  {
    on<UsersEvent>((event, emit) async {
      emit(UsersLoading());
      if (event is GetUsersEvent) {
        final failureOrUsers = await getUsersUseCase();
        emit(_mapFailureOrUsers(failureOrUsers));
      }
    });
  }

  UsersState _mapFailureOrUsers(Either<Failure, List<UserEntity>> either) {
    return either.fold((l) => UsersError(message: _mapFailureToMsg(l)), (r) =>
        UsersLoaded(userdata: r));
  }


  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppStrings.serverFailure;
      case EmptyCacheFailure:
        return AppStrings.cacheFailure;
      case OfflineFailure:
        return AppStrings.offline;
      default:
        return AppStrings.unExpectedError;
    }
  }







}