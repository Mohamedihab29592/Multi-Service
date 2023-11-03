
import 'package:equatable/equatable.dart';
import 'package:multi_serivce/features/home/domain/entities/users_entity.dart';


class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];

}
class UsersInitial extends UsersState{}
class UsersLoading extends UsersState{}
class UsersLoaded extends UsersState{
  final List<UserEntity> userdata;

  const UsersLoaded({required this.userdata});
  @override
  List<Object?> get props => [userdata];
}
class UsersError extends UsersState{
  final String message;

  const UsersError({required this.message});
  @override
  List<Object?> get props => [message];
}