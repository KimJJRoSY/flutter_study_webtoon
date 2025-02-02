import 'package:flutter/material.dart';
import 'package:flutter_study_webtoon/services/api_service.dart';
import 'package:flutter_study_webtoon/models/webtoon_model.dart'; // WebtoonModel import 추가!

class HomeScreen extends StatelessWidget {
  // api 값을 받아오는 거라서 const가 될 수 없음
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
      // future builder은 future의 값을 기다리고, 데이터가 존재하는지 알려줌
      // await, isLoading 안 써도 ㄱㅊ
      body: FutureBuilder<List<WebtoonModel>>(
        future: ApiService.getTodaysToons(),
        builder: (context, snapshot) {
          // snapshot을 통해서 데이터가 들어왔는지 확인
          if (snapshot.hasData) {
            // 많은 양의 데이터를 연속적으로 보여주고 싶을 때 -> ListView 사용
            // return ListView(
            //   //기본적으로 스크롤 제공함 + ListView안에 있는 리스트를 수동으로 그리는 방식
            //   children: [
            //     for (var webtoon in snapshot.data!) Text(webtoon.title)
            //   ],
            // );

            // ListView.builder -> 사용자가 보고 있는 아이템만 build 함
            // return ListView.builder(
            //   scrollDirection: Axis.horizontal, // 수평으로 스크롤 생김
            //   itemCount: snapshot.data!.length,
            //   itemBuilder: (context, index) {
            //     var webtoon = snapshot.data![index];
            //     return Text(webtoon.title);
            //   },
            // );

            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                // makeList(snapshot)에 높이 안 정하면 에러남 왜냐면 레이아웃 시스템은 리스트뷰가 얼마나 큰 지 모르기 때문
                //Expanded는 화면의 남는 공간을 차지하는 위젯임
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return Center(
            // loading 애니메이션
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal, // 수평으로 스크롤 생김
      itemCount: snapshot.data!.length,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // itemBuilder는 ListView의 아이템을 만드는 역할을 함 => 만들어야하는 아이템의 위치(숫자)를 받음
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        // 그림자가 얼마나 멀리 드리울지 정함
                        blurRadius: 15,
                        // offset은 그림자의 위치를 정함
                        offset: Offset(10, 10),
                        color: Colors.black.withOpacity(0.5))
                  ]),
              child: Image.network(
                webtoon.thumb,
                headers: const {
                  'Referer': 'https://comic.naver.com',
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
      // separatorBuilder은 widget을 리턴해야 하는 함수 -> 리스트와 구분자를 렌더링함
      // 구분자는 뭐든 사용 가능 -> widget,  이모지, 텍스트 OK
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
