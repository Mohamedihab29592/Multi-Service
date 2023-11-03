
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:multi_serivce/features/home/data/dataSource/localDataSource.dart';
import 'package:multi_serivce/features/home/data/dataSource/remoteDataSource.dart';
import 'package:multi_serivce/features/home/data/repository/users_repository.dart';
import 'package:multi_serivce/features/home/domain/repository/baseRepositoy.dart';
import 'package:multi_serivce/features/home/domain/useCases/users_UseCases.dart';
import 'package:multi_serivce/features/home/presenation/controllers/users_bloc/users_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../error/internetCheck.dart';

final sl = GetIt.instance;

Future<void> init() async
{
  ///bloc
  sl.registerFactory(() => UsersBloc(getUsersUseCase: sl()));


  ///Use case
  sl.registerLazySingleton(() => GetUsersUseCase( baseUserDataRepository: sl(),));

  ///Repositary
  sl.registerLazySingleton<BaseUserDataRepository>(() => UsersRepository(networkInfo: sl(), usersRemoteDateSource: sl(), usersLocalDataSource: sl()));

  ///Data source
  sl.registerLazySingleton<UsersRemoteDateSource>(() => UserRemoteDataSourceImp());
  sl.registerLazySingleton<UsersLocalDataSource>(() => UsersLocalDataSourceImp(sharedPreferences: sl()));

  ///core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));

  ///External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);


  sl.registerLazySingleton(() => InternetConnectionChecker());





}