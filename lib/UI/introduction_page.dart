import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // ここでIntroductionScreenのライブラリーを呼び出している
        child: IntroductionScreen(
          scrollPhysics: const BouncingScrollPhysics(),
          pages: [
            
            PageViewModel(
              title: '天文サークルSOLA\n公式アプリへようこそ！',
              body:
                  '三重大学天文サークルSOLAの公式アプリ',
              image: Lottie.asset('assets/animation/floating-welcome.json'),
            ),
            PageViewModel(
              title: '今だからできる新しい試み',
              body:
                  '場所に縛られずいつでもどこでも\n制限されない活動を\n\n本アプリはコロナ禍の新たな\nサークルの形として開発されました',
            
              image: Lottie.asset('assets/animation/student-transparent.json'),
            ),
            PageViewModel(
              title: 'ここにも広がる新しいSOLA',
              body:
                  'SOLAアプリでできること\n月齢チェック・天体カレンダー\n活動記録・スタンプラリラリーなど\n\nその他の機能も追加予定！',
              image: Lottie.asset('assets/animation/mobile-marketing.json'),
            ),
            PageViewModel(
              title: '仲間と広がる可能性',
              body: '本アプリは三重大学天文サークル\nSOLAのメンバーによって開発されました\n\nプログラミングやデザインに\n興味があるメンバーも募集しています！\n',
              image: Lottie.asset('assets/animation/modification-of-programming.json'),
            ),
          ],
          onDone: () async => Navigator.pop(context),
          showBackButton: true,
          next: const Icon(Icons.arrow_forward_ios),
          back: const Icon(Icons.arrow_back_ios),
          done: const Text(
            'OK!',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            // ここの大きさを変更することで
            // 現在の位置を表しているマーカーのUIが変更するよ!
            activeSize: const Size(40, 10.0),
            activeColor: Colors.blue,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}