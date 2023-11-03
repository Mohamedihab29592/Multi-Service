import 'package:multi_serivce/features/home/domain/entities/users_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.id,
      required super.name,

      });

  factory UserModel.fromJson(Map<String, dynamic> json) {

    return UserModel(
      id: json['id'],
      name: json['name'],

    );
  }
  Map<String ,dynamic>toJson(){
    return {'id':id ,   'name':name, };
  }
}


