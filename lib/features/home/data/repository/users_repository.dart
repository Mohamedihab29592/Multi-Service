import 'package:dartz/dartz.dart';
import 'package:multi_serivce/core/error/faliure.dart';
import 'package:multi_serivce/features/home/data/dataSource/localDataSource.dart';
import 'package:multi_serivce/features/home/data/dataSource/remoteDataSource.dart';
import 'package:multi_serivce/features/home/domain/entities/users_entity.dart';
import 'package:multi_serivce/features/home/domain/repository/baseRepositoy.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/internetCheck.dart';

class UsersRepository extends BaseUserDataRepository{

  final UsersRemoteDateSource usersRemoteDateSource;
  final UsersLocalDataSource usersLocalDataSource;
  final NetworkInfo networkInfo;
  UsersRepository({required this.usersLocalDataSource,required this.usersRemoteDateSource,required this.networkInfo});
  @override
  Future<Either<Failure, List<UserEntity>>> userList() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await usersRemoteDateSource.getUsers();
        await usersLocalDataSource.cachedUsers(userModel: result);
        return Right(result);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localDataHome = await usersLocalDataSource.getCachedUsers();
        return Right(localDataHome);
      } on LocalExceptions {
        return Left(EmptyCacheFailure());
      }
    }
  }
}