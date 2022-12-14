import 'package:firebase_sample_project/Services/Firebase/Auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();

  // bool loginStatus = false;
  // bool registrationStatus = false;

  late TextEditingController loginEmailController;
  late TextEditingController loginPasswordController;

  late TextEditingController registrationEmailController;
  late TextEditingController registrationPasswordController;

  var registerEmail = '';
  var registerPassword = '';

  var loginEmail = '';
  var loginPassword = '';

  @override
  void onInit() {
    super.onInit();
    loginEmailController = TextEditingController();
    loginPasswordController = TextEditingController();
    registrationEmailController = TextEditingController();
    registrationPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registrationEmailController.dispose();
    registrationPasswordController.dispose();

    // registerEmail = '';
    // registerPassword = '';
    // loginStatus = false;
    // registrationStatus = false;
  }

  String? emailValidate(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email id';
    } else {
      return null;
    }
  }

  String? passwordValidate(String value) {
    if (value.length < 8) {
      return 'Password length should be at least 8 characters';
    } else {
      return null;
    }
  }

  void checkLogin() async {
    // final isLoginValid = loginFormKey.currentState!.validate();
    // if (!isLoginValid) {
    //   // loginStatus = false;
    //   return;
    // } else {
    //   loginFormKey.currentState!.save();
    // loginStatus = true;
    if (loginFormKey.currentState!.validate()) {
      dynamic result = await AuthService().signIn(
        email: loginEmailController,
        password: loginPasswordController,
      );
      Get.find<LoginController>().loginEmailController.clear();
      Get.find<LoginController>().loginPasswordController.clear();
    }
  }

  //  FocusScope.of(context).unfocus();
  // if (_formKey.currentState!.validate()) {
  //   dynamic result = await AuthService().registerUser(
  //     email: emailController,
  //     password: passwordController,
  //   );
  //                         if (result == null) {
  //                           setState(
  //                             () {
  //                               error = 'Enter a valid Email ID';
  //                             },
  //                           );
  //                           ScaffoldMessenger.of(context)
  //                               .showSnackBar(invalidEmailSnackBar);
  //                         }

  //                         debugPrint(emailController.text);
  //                         debugPrint(passwordController.text);
  //                       }
  //                     },

  void checkRegistration() async {
    if (registrationFormKey.currentState!.validate()) {
      dynamic result = await AuthService().registerUser(
        email: registrationEmailController,
        password: registrationPasswordController,
      );
      Get.find<LoginController>().registrationEmailController.clear();
      Get.find<LoginController>().registrationPasswordController.clear();

      // registerEmail = '';
      // registerPassword = '';

      // final isValid = registrationFormKey.currentState!.validate();
      // if (!isValid) {
      //   // loginStatus = false;
      //   return;
      // } else {
      //   registrationFormKey.currentState!.save();
      //   // loginStatus = true;
      // }
    }
  }
}
