import 'package:flutter/material.dart';
import 'package:flutter_study_webtoon/services/api_service.dart';
import 'package:flutter_study_webtoon/models/webtoon_model.dart'; // WebtoonModel import 추가!

class HomeScreen extends StatelessWidget {
  // api 값을 받아오는 거라서 const가 될 수 없음
  HomeScreen({super.key});

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
      body: FutureBuilder<List<WebtoonModel>>(
        future: ApiService.getTodaysToons(),
        builder: (context, snapshot) {
          // snapshot을 통해서 데이터가 들어왔는지 확인
          if (snapshot.hasData) {
            return const Text('There is data!');
          }
          return const Text('Loading...');
        },
      ),
    );
  }
}
