import 'package:http/http.dart' as http;
// import 하고 나서 namespace를 http로 지정해줌

class ApiService {
  final String baseUrl = 'https://webtoon-crawler.nomadcoders.workers.dev';
  final String today = "today"; // 엔드 포인트

  void getTodaysToons() async {
    //Uri 타입으로 줘야됨 url 아님
    final url = Uri.parse('$baseUrl/$today');
    // 서버에 api 요청을 보냄
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}

//Future -> 미래에 받을 값의 타입 => 바로 처리된게 아님 
//Future<Response>  -> 해당함수가 미래에 response를 반환함 
