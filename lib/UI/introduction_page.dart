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
                  '',
              image: Lottie.asset('assets/animation/floating-welcome.json'),
            ),
            PageViewModel(
              title: '\n逆手に',
              body:
                  '活動の予定・記録、スタンプ機能',
              image: Lottie.asset('assets/animation/student-transparent.json'),
            ),
            PageViewModel(
              title: 'オンラインだからこそ\n新しい価値を',
              body:
                  '活動の予定・記録、スタンプ機能',
              image: Lottie.asset('assets/animation/student-transparent.json'),
            ),
            PageViewModel(
              title: '紹介ページを設けることで\n簡単にアプリをリッチにできるよ!',
              body: '3ページ目だよ!',
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