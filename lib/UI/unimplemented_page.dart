import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class UnimplementedPage extends StatelessWidget {
  const UnimplementedPage({super.key});

  @override
  Widget build(BuildContext context) {
    //毎回ページで変数定義してるから受け渡しできるように書き換える必要あり
    var _height = MediaQuery.of(context).size.height;
    var  _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blueAccent.withOpacity(0.5),
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('この機能は只今実装準備中です',style: TextStyle(color:Colors.blue,fontSize: 17,)),
            SizedBox(height:_height/3, child:  Lottie.asset('assets/animation/loading.json')),
          ],
        ),
      ),
    );
  }
}