import 'dart:convert';
import 'package:flutter_study_webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;
// import 하고 나서 namespace를 http로 지정해줌

// api 연동 코드
class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today"; // 엔드 포인트

// await 함수가 Future이라서 타입 명시해야됨
  Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    //Uri 타입으로 줘야됨 url 아님
    final url = Uri.parse('$baseUrl/$today');
    // 서버에 api 요청을 보냄
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // print(response.body); 응답 바디는 원래 string임 =>  Json으로 변경해야됨
      // response.body가 리스트에 담겨져 있는 형태이기 때문에 타입 명시 -> 데이터마다 다름
      // List<dynamic>부분 없어도 ㄱㅊ 걍 잊어버리지 않기 위해서 작성한것임
      final List<dynamic> webtoons = jsonDecode(response.body);

      // webtoons이 리스트 형태라서 for문 사용 가능
      for (var webtoon in webtoons) {
        // final toon = WebtoonModel.fromJson(webtoon); json화된 데이터를 불러옴
        // print(toon.title);
        // json으로 웹툰을 만들 때마다 webtoonInstances리스트에 추가됨
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}

//Future -> 미래에 받을 값의 타입 => 바로 처리된게 아님 
//Future<Response>  -> 해당함수가 미래에 response를 반환함 
