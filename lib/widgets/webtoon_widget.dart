import 'package:flutter/material.dart';
import 'package:flutter_study_webtoon/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector는 대부분의동작을 감지하도록 해줌
    return GestureDetector(
      // onTapDown : 손가락이 내려왔다는 것을 의미
      // onTapUp : 손가락을 들었다
      // onTap => 유저가 클릭했다
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // route는 StatelessWidget일 뿐인 DetailScreen을 렌더링함
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true, // 이미지가 위에서 부터 올라옴
          ),
        );
      },
      child: Column(
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
              thumb,
              headers: const {
                'Referer': 'https://comic.naver.com',
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
