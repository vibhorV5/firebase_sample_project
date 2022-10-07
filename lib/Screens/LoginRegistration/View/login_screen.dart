import 'package:firebase_sample_project/Constant/TextStyles/text_styles.dart';
import 'package:firebase_sample_project/Routes/routes.dart';
import 'package:firebase_sample_project/Services/Firebase/Auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(
          'Registration/Log in Screen',
          style: kTextStyleTitle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: mediaQuery.height,
          width: mediaQuery.width,
          // color: Colors.black12,
          child: Column(
            children: [
              TextButton(
                onPressed: () async {
                  await AuthService().signInAnonymously();
                  debugPrint('Successfully logged in anonymously');
                  // Get.toNamed(home);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Colors.deepOrange,
                    ),
                  ),
                  child: const Text(
                    'Sign In Anonymously',
                    style: kTextStyleButtons,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
