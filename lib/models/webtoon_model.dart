class WebtoonModel {
  final String title, thumb, id;

// map은 object처럼 dart가 지원하는 키-값 구조임
  WebtoonModel.fromJson(Map<String, dynamic> json)
      // named consrtuctor => 이름이 있는 클래스 생성자
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
