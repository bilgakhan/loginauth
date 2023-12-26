import 'package:dio/dio.dart';
import 'package:login_app/core/network/links.dart';

class AuthUser {
  Future<dynamic> registerUser() async {
    try {
      Response response =
          await Dio().post(LoginAppLinks.register);
      if (response.statusCode == 201 || response.statusCode == 200) {
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> loginUser() async {
    try {} on DioException catch (e) {
      return e.message.toString();
    }
  }
}
