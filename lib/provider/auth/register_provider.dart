import 'package:flutter/material.dart';
import 'package:login_app/db/auth.dart';
import 'package:login_app/model/register_model.dart';
import 'package:login_app/service/auth_service.dart';

class RegisterProvider extends ChangeNotifier {
  AuthService service = AuthService();
  AuthDb db = AuthDb();
  bool isLoading = false;
  String errorMessage = '';

  // input fields
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> register(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    dynamic response = await service.registerUser(
      login: loginController.text,
      password: passwordController.text,
      fName: fNameController.text,
      lName: lNameController.text,
    );
    if (response is RegisterModel) {
      isLoading = false;
      await db.writeToDb(response.token.toString());
      notifyListeners();
    } else {
      isLoading = false;
      errorMessage = response;
      notifyListeners();
    }
  }
}
