import 'package:dartz/dartz.dart';
import 'package:multi_serivce/features/home/domain/entities/users_entity.dart';

import '../../../../core/error/faliure.dart';
import '../repository/baseRepositoy.dart';

class GetUsersUseCase  {
  final BaseUserDataRepository baseUserDataRepository;

  GetUsersUseCase({required this.baseUserDataRepository});

  Future<Either<Failure, List<UserEntity>>> call() async{

    return await baseUserDataRepository.userList();
  }
}