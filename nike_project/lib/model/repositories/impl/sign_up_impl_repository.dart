import 'package:flutter/cupertino.dart';
import 'package:nike_project/model/repositories/sign_up_repository.dart';
import 'package:nike_project/model/request/user_signup_request.dart';
import 'package:nike_project/model/response/user_signup_response.dart';
import 'package:nike_project/model/service/impl/sign_up_impl_service.dart';
import 'package:nike_project/model/service/sign_up_service.dart';

class SignUpImplRepository extends SignUpRepository{
  @override
  Future<UserSignUpResponse?> signUpRepositories(UserSignUpRequest req) {   
    return SignUpImplService().postSignUp(req); 
  }
}