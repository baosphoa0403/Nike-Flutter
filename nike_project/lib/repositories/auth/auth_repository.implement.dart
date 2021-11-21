import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:nike_project/api/app_exception.dart';
import 'package:nike_project/model/modelUserRequestLogin/user_login_request.dart';
import 'package:nike_project/model/modelUserResponse/info_user.dart';
import 'auth_repository.abstract.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImplement extends AuthRepository {
  @override
  Future<UserInfor> postLogin(String url, UserLoginRequest payload) async {
    UserInfor? responseJson;
    print(json.encode(payload));
    try {
      Response response = await Dio().post(url, data: payload.toJson());
      responseJson = returnResponse(response);
    } catch (e) {
      print(e);
    }
    print(responseJson);
    return responseJson!;
  }

  UserInfor returnResponse(Response response) {
    switch (response.statusCode) {
      case 201:
        // UserInfor responseJson = jsonDecode(response.data);
        return UserInfor.fromJson(jsonEncode(response.data));
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
