import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:multi_serivce/features/home/data/models/userModels.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/faliure.dart';

abstract class UsersLocalDataSource {
  Future<List<UserModel>> getCachedUsers();

  Future<Unit> cachedUsers({required List<UserModel> userModel});
}

class UsersLocalDataSourceImp implements UsersLocalDataSource {
  final SharedPreferences sharedPreferences;

  UsersLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cachedUsers({required List<UserModel> userModel}) {
    List userModelToJson = userModel
        .map<Map<String, dynamic>>((userModel) => userModel.toJson())
        .toList();

    sharedPreferences.setString("Cached_user", json.encode(userModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<UserModel>> getCachedUsers() {
    final jsonString = sharedPreferences.getString("Cached_user");
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<UserModel> jsonToUserModel = decodeJsonData
          .map<UserModel>(
              (jsonToUserModel) => UserModel.fromJson(jsonToUserModel))
          .toList();
      return Future.value(jsonToUserModel);
    } else {
      throw EmptyCacheFailure();
    }
  }
}
