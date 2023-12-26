import 'package:dio/dio.dart';
import 'package:login_app/model/user_list_model.dart';

class GetUserService {
  Future<dynamic> getUsers() async {
    try {
      Response response =
          await Dio().get('http://api.firebase.uz:3300/users'); // get users url
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => UsersListModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioException catch (e) {
      return e.message.toString();
    }
  }
}
