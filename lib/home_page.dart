import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /*
{
	"name": "jiwon",
	"age": 20
}
버튼을 누르면 위와같은 Json 데이터를 가져오고 화면에 표시하기
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('name: '),
          Text('age: '),
          ElevatedButton(onPressed: () {}, child: Text('데이터 가져오기')),
        ],
      ),
    );
  }
}
 // 이렇게 해서 view는 완성
 // 이제 서버에서 데이터를 가지고 오는 역할을 하는 모델레이어를 만들어야함
 // 모델클래스랑, 레포지토리를 만들것임. lib 폴더에다가.