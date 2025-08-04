/*{
	"name": "jiwon",
	"age": 20
}*/

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
  // 1. 네임드 생성자 (fromJson) 만들고
  User.fromJson(Map<String, dynamic> map)
    : name = map['name'],
      age = map['age'];

  // 2. toJson 만들기 (직렬화할때 씀씀)
  Map<String, dynamic> toJson() => {'name': name, 'age': age};
}

//모델 클래스 정의가 완료되었으니까, 데이터를 가지고오는 역할을 하는 레포지토리를 만들어야함.
