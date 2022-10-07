import 'package:firebase_sample_project/Constant/TextStyles/text_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: const Text(
          'Firebase Sample Project',
          style: kTextStyleTitle,
        ),
        centerTitle: true,
      ),
    );
  }
}
