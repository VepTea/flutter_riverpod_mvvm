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
