import 'dart:convert';

import 'package:flutter_riverpod_mvvm/user.dart';

class UserRepository {
  Future<User> getUser() async {
    //5. async 함수는, 반드시 반환타입이 Future여야한다.
    //그래서 반환타입을 Future<User>로 감싸 줘야함.
    //3. 반환타입을 User로 변경
    // 데이터를 가지고오는 함수를 먼저 만들자.

    // 4. 이제 서버에서 데이터를 가지고 오는 상황을 가졍하고 코딩.
    //가져올 때는 항상 비동기 코드로 작성해야함.
    await Future.delayed(Duration(seconds: 1), () {});

    // 서버에서 받은 데이터라고 가정한 JSON 문자열
    String dummyJson = """
{
	"name": "이지원",
	"age": 20
}
""";

    //1. json데이터를 파싱해서 써먹을려면 jsonDecode 함수 사용해서 Map으로 변환
    Map<String, dynamic> map = jsonDecode(dummyJson);

    //2. Map을 => 객체로 변환
    User user = User.fromJson(map);
    // 2.1 이 getUser 함수를 실행해서 User라는 객체가 반환되게 만들거니까 return 해줘야함
    //2.2 그리고 반환타입을 User로 변경해줘야함
    return user;
  }
}
