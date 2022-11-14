import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class IntoductionWidget extends StatelessWidget {
  IntoductionWidget({super.key});
  
  final _urlLaunchWithStringButton = UrlLaunchWithStringButton();


  Future _openAlertDialog1(BuildContext context) async {
    var ret = await showDialog(
        context: context,
         barrierDismissible: true,
        builder: (context) => AlertDialog(
          title: Text("活動の詳細について",textAlign: TextAlign.center,),
          content: Text('活動の詳細を確認できるページを追加予定です。実装までしばらくお待ちください'),
          // actions: [
          //   TextButton(onPressed: () => {
          //     Navigator.pop(context,false)
          //   },
          //       child: Text("閉じる")
          //   ),
          // ],
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    final List<String> titles = ["町屋海岸", "学内観望会", "曽爾高原","曽爾高原", "花火大会", "青山高原",'教育ボランティア', "皆既月食",'皆既月食' ];

    final List<String> urls = [
      'https://spiky-possum-bbc.notion.site/5-16-00de8e95f574405e93c8c7c0bda9437f',//フラワームーン5/13
      
    ];
    //上のリストにNotionもしくはインスタのURlを載せる

    final List<Widget> images = [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/0516焚き火マシュマロ.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/0527学内観望会.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/0629曽爾高原.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/0629曽爾高原集合写真.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/0810花火大会.heic'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/0814青山高原.heic'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/0820教育ボランティア.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/1108皆既月食.heic'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/皆既月食.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('活動記録'),
        backgroundColor:  Colors.blueAccent.withOpacity(0.5),
        elevation: 1,
         actions: [
          IconButton(
            icon: Icon(Icons.tips_and_updates, color:Colors.amber,),
            onPressed: () => {_openAlertDialog1(context)},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  titles: titles,  // required
                  images: images,  // required
                  textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 10), // optional
                  onPageChanged: (page) { 
                  },
                  onSelectedItem: (index) {
                    //タップした時の処理
                     print(titles[index]);
                     //_urlLaunchWithStringButton.launchUriWithString(context,urls[index],);
                  },
                  initialPage: 5, // リストの一番下のものを最初に表示する
                  align : ALIGN.CENTER 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//URl遷移の記述-参考(https://qiita.com/KKoichi51/items/0f6c2649640b7ff5f3b0)
class UrlLaunchWithStringButton {
  final alertSnackBar = SnackBar(
    content: const Text('このURLは開けませんでした'),
    action: SnackBarAction(
      label: '戻る',
      onPressed: () {},
    ),
  );

  Future launchUriWithString(BuildContext context, String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      alertSnackBar;
      ScaffoldMessenger.of(context).showSnackBar(alertSnackBar);
    }
  }
}