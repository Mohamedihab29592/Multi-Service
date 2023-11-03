import 'dart:convert';

import 'package:multi_serivce/core/utilis/contans.dart';
import 'package:multi_serivce/features/home/data/models/userModels.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart';


abstract class UsersRemoteDateSource {
  Future<List<UserModel>> getUsers();

}

class UserRemoteDataSourceImp implements UsersRemoteDateSource {
  @override
  Future<List<UserModel>> getUsers() async {
    final response = await http.get(Uri.parse(ApiConstants.aPiBase));
    final List<UserModel> data = [];

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);

      for (var item in jsonData) {
        final userModel = UserModel.fromJson(item);
        data.add(userModel);
      }
      return data;
    }else {
      throw ServerExceptions();

    }


  }
}
