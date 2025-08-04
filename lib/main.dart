import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
  //리버팟 사용할때 뷰모델 관리자가 뷰모델을 제공해 줄수있게 프로바이더 스코프로 감싸줘야함
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
