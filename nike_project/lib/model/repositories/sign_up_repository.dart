import 'package:nike_project/model/request/user_signup_request.dart';
import 'package:nike_project/model/response/user_signup_response.dart';

abstract class SignUpRepository {
  Future<UserSignUpResponse?> signUpRepositories(UserSignUpRequest req);
}