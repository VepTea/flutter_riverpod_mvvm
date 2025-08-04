// 이제 뷰모델을 만들어야함. 지금까지는, 뷰모델이 없었음. 뷰랑, 모델 레이어만 있었음.
//뷰모델이 없으면 뷰모델 관리자가 뷰모델을 제공해주지 못함.

import 'package:flutter_riverpod_mvvm/user.dart';
//너가 만든 User 모델 클래스를 import 한 거야.
//왜 필요함? HomeState 클래스에서 User? user를 선언하고 있지?
//그 User의 정의가 있는 .dart 파일이 user.dart에 있어서 가져온 거야.

import 'package:flutter_riverpod/flutter_riverpod.dart';
//Riverpod의 기본 상태 관리 기능들을 제공하는 핵심 패키지. Notifier를 쓰려면 반드시 필요해

import 'package:flutter_riverpod_mvvm/user_repository.dart';
//모델레이어에서 만든 레포지토리 클래스를 import 해야함.
//후에 레포지토리 객체 내부의 getUser 함수 사용할거임.

class HomeState {
  // 뷰모델 만들때 해야하는 것
  //1. 관리해야할 상태 클래스 만들기
  User? user; // 관리해야할 상태가 하나밖에 없음. 그래서 상태클래스 하나만 만들어줌.
  // 서버에서 아직 데이터를 가지고 않았을때, user는 null인상태여야겠지. 그래서 ?붙여서 널되게 함.
  HomeState(this.user); // 하나 밖에 없으니깐 생성자도 이렇게 간단히 만들음.
}

//2. 뷰모델 만들기. Notifier
class HomeViewModel extends Notifier<HomeState> {
  //노티파이어 기능 쓰기위해 리버팟 패키지 임포트해야함.
  //그리고 노티파이어에게 어떤 상태를 관리해야하는지 알려주기위해서 제네릭으로 알려줘야함.

  @override
  HomeState build() {
    return HomeState(null); // 뷰모델 생성할때 널로 초기화해줘야함.
  }

  //사용자가 버튼을 클릭했을때, 뷰모델에게 요청을 하면, 레포지토리에서 데이터를 가지고오고,
  //상태를 업데이트 해줘야함. 업데이트 해주는 함수 만들어야함.

  void getUser() async {
    UserRepository userRepository = UserRepository(); //유저레포지토리 객체 생성
    //레포지토리 객체 내부의 getUser 함수 실행해서 데이터 가지고옴.
    //그리고 그 데이터를 상태에 업데이트 해줘야함.
    await userRepository.getUser(); // 데이터 가지고오는 함수 실행.
    //이함수는 Future<User>객체를 반환함
    //근데, getUser return type이 Future<User>이라서, 비동기 코드로 작성해야함.
    User user = await userRepository.getUser(); //그럼 이 받아온User값을 변수에 담자.
    state = HomeState(user); // 상태 업데이트
    //만약에 여기서 state.user = user 이렇게 하면 안됨.
    //왜냐면, state는 뷰모델 클래스 내부에서 관리하는 상태 객체야.
    //그럼 이 상태 객체를 업데이트 해줘야함.
    //이렇게 하면 홈스테이트 클래스 자체가 바뀌지 않아서
    //이렇게 적으면면 뷰모델이 위젯으로 알려주지 않는다.
  }
}

// 뷰모델 관리자는 전역으로 선언되어야하기 때문에, 반드시 클래스 바깥에다 빼야함.
//(클래스안에 다 선언해놓으면 다른 위젯에서 뷰모델 관리자를 사용하려고 접근할 수 없음)
//3. 이제 뷰모델을 위젯에게 공급해줄 관리자 만들기.
//'=' 오른쪽에 얘 NotifierProvider 클래스를 사용해서 뷰모델 관리자를 만들어줘야함.
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  () {
    return HomeViewModel(); // 뷰모델 객체 생성해서 돌려줌.
  }, // NotifierProvider의 생성자 안에는 나중에 뷰가 이 뷰모델 달라고 요청할때,
  //뷰모델을 생성해서 돌려줄 함수를 같이 넘겨줘야함.
);
    // 노티파이어 프로바이더라는클래스는 리버팟 패키지의/notifier_provider.dart 파일에
    // NotifierProvider 클래스가 정의되어 있습니다!

    /*이 뷰(위젯)home_page.dart로 가서
    이 뷰모델에서 데이터 가져와서 출력하는 코드 작성하러가자자 */
    
