import 'package:dio/dio.dart';
import 'package:login_app/core/network/links.dart';
import 'package:login_app/model/register_model.dart';

class AuthService {
  Future<dynamic> registerUser({
    String? fName,
    String? lName,
    required String login,
    required String password,
  }) async {
    
    try {
      Response response = await Dio().post(
        LoginAppLinks.register,
        data: {
          "email": login,
          "password": password,
          "f_name": fName,
          "l_name": lName,
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        return RegisterModel.fromJson(response.data);
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
