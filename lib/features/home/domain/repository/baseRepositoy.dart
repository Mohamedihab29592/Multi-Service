import 'package:dartz/dartz.dart';
import 'package:multi_serivce/features/home/domain/entities/users_entity.dart';

import '../../../../core/error/faliure.dart';


abstract class BaseUserDataRepository{
  Future<Either<Failure,List<UserEntity>>> userList();

}