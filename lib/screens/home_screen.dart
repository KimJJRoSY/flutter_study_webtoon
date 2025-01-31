import 'package:flutter/material.dart';
import 'package:flutter_study_webtoon/models/webtoon_model.dart';
import 'package:flutter_study_webtoon/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons(); // WebtoonModel의 리스트가 됨
    isLoading = false;
    // 화면 새로고침
    setState(() {});
  }

// useEffect 처럼 먼저 로딩  + 초기화
  @override
  void initState() {
    super.initState();
    waitForWebToons();
  }

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
