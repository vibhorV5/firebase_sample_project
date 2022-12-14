import 'package:firebase_sample_project/Screens/Home/View/home_screen.dart';
import 'package:firebase_sample_project/Screens/LoginRegistration/View/login_screen.dart';
import 'package:firebase_sample_project/Services/Firebase/Auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CustomCircular();
        } else if (snapshot.hasError) {
          return const ErrorW();
        } else if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LogInScreen();
        }
      },
    );
  }
}

class CustomCircular extends StatelessWidget {
  const CustomCircular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}

class ErrorW extends StatelessWidget {
  const ErrorW({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Error'),
    );
  }
}
