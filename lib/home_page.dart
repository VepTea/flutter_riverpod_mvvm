import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /*
{
	"name": "jiwon",
	"age": 20
}
TODO: 버튼을 누르면 위와같은 Json 데이터를 가져오고 화면에 표시하기
*/

  //1. 요기 위치치에 컨슈머위젯을 생성해주고, 매개변수로 builder 속성안에 자동완성으로 완성함.

  //2.그리고 뷰모델에서 상태 가져와서 뿌려줘야할 부분 Column 그대로 복사해서
  //consumer내에 builder 속성안에, return안에 붙여넣기 해주고

  //3.그대로 Consumer 위젯을 복사해서 아래 body 속성안에 붙여넣기 해주고
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          //4. 여기서 ref를 사용해서 뷰모델에접근할 수있음.
          // 접근할때는 read나 watch 함수를 사용해서 접근할 수 있음.
          final homeState = ref.watch(homeViewModelProvider);
          // 뷰모델 관리자 객체를 가지고옴.
          //왓치 메서드는 리턴타입이 HomeState 클래스 객체를 반환하므로 final을 써주고
          //homeState변수에 담아줌.

          //5.이제 받아온 상태값을 위젯 안에 그대로 뿌려주기.
          return Column(
            children: [
              Text('name: ${homeState.user?.name}'), //따옴표를 자세히 봐라 ${}안하면 안됨
              Text('age: ${homeState.user?.age}'), //null일 수 있으니 안전하게 ? 처리
              //6. 마지막으로 이 엘리베이티드 버튼 클릭 시 뷰모에서 데이터를 가져와야함.
              //그러려면 버튼 눌렸을때, 뷰모델에게 데이터 가져오라고 요청해야함.
              ElevatedButton(
                onPressed: () {
                  final viewModel = ref.read(homeViewModelProvider.notifier);

                  //이 뷰모델 공급자에게 니가 관리하는 뷰모델을 다오 요청.
                  //그리고 그걸 변수에 담는다. 근데 왜 파이널임? 그거 질문해야함.

                  //이제 뷰모델 가져왔으니까, 뷰모델 내부에 있는 함수 실행해서 데이터 가져오기.
                  viewModel.getUser(); //이제 끝임. 다했음.
                  //main.dart에 home: HomePage() 이렇게 써주고 애뮬레이터 실행하면됨.
                },
                child: Text('데이터 가져오기'),
              ),
            ],
          );
        },
      ),
    );
  }
} // 이렇게 해서 view는 완성
 // 이제 서버에서 데이터를 가지고 오는 역할을 하는 모델레이어를 만들어야함
 // 모델클래스랑, 레포지토리를 만들것임. lib 폴더에다가.
