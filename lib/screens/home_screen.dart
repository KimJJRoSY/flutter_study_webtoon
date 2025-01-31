import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // scaffold는 스크린을 위한 기본적인 레이아웃과 설정을 제공함
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
