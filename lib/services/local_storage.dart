import 'package:assignment/feature/profile/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  static Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('phone', phoneController.text);
  }

  static Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameController.text = prefs.getString('name') ?? '';
    emailController.text = prefs.getString('email') ?? '';
    phoneController.text = prefs.getString('phone') ?? '';
  }

}