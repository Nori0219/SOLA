import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sola/UI/moon_page.dart';
import 'package:sola/UI/widgets/icon_widget.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final Uri _url_official1 = Uri.parse('https://www.instagram.com/mieu_sola_/?hl=ja');
Future<void> _launchUrlInstagram() async {
  if (!await launchUrl(_url_official1,mode: LaunchMode.externalApplication,)) {
    
    throw 'アクセスできませんでした $_url_official1';
  }
}

final Uri _url_official2 = Uri.parse('https://twitter.com/mieu_sola');
Future<void> _launchTwitter() async {
  if (!await launchUrl(_url_official2,mode: LaunchMode.externalApplication,)) {
    
    throw 'アクセスできませんでした $_url_official1';
  }
}


class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isExpanded = false;

  //late List<Category> categoryItems;
  //late List<Topic> topicListItems;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // topicListItems = [
    //   Topic(
    //       "02 Apr 2019",
    //       "流星群観測",
    //       "ペルセウス座流星群の観測を行いました！",
    //       "町屋海岸",
    //       "天体観測",
    //       "",
    //       true),

  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }
  
  @override
    Widget build(BuildContext context) {
       double _height = MediaQuery.of(context).size.height;
       double _width = MediaQuery.of(context).size.width;


    return Scaffold(
      
        body: Container(
          height: _height,
          width: _width,
          child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  TopBar_Widget(),
                  Container(
                  //color:Colors.blue, 
                  margin: EdgeInsets.only(left: _width/15, right: _width/15, top: _height/40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('機能一覧',
                          style: TextStyle(
                              fontSize: 16)),
                      GestureDetector(
                          onTap: _expand,
                          child: Text(
                            isExpanded ? "閉じる" : "もっとみる",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                ),
                          )),
                     // IconButton(icon: isExpanded? Icon(Icons.arrow_drop_up, color: Colors.orange[200],) : Icon(Icons.arrow_drop_down, color: Colors.orange[200],), onPressed: _expand)
                    ],
                  ),
                ),
                function_Widget(isExpanded: isExpanded),
                Divider(),
                scrol_Widget(height: _height),
                Divider(),
                Container(
                  child: Image.asset('assets/displey_images/SOLA勧誘画像.png'),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2,
                  ),
                  ),
                ),
              ],
              )
            ),
          ),
      );
    }
}




class scrol_Widget extends StatelessWidget {
  const scrol_Widget({
    Key? key,
    required double height,
  }) : _height = height, super(key: key);

  final double _height;
  
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        GestureDetector(
            onTap: (){
              _launchTwitter() ;
              print('twitterへ遷移');
            },//遷移の記述を書く
            child: Card(
              child:  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/displey_images/Twitterバナー.png'), //Twitter
                    //fit: BoxFit.fill,
                  ),
                ),
              ),
            )
        ),
        GestureDetector(
            onTap: (){
              _launchUrlInstagram() ;
              print('Instagramへ遷移');
            },//遷移の記述を書く
            child: Card(
              child:  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/displey_images/Instagramバナー.png'), //休講情報
                    //fit: BoxFit.fill,
                  ),
                ),
              ),
            )
        ),
        GestureDetector(
          onTap: () {
            print('LINEがタップされました');
          },
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/displey_images/LINEバナー.png'),
                  fit:BoxFit.fill
                )
              ),
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        height: _height * 0.22,
        initialPage: 0, //最初のページ
        //aspectRatio: 1/20,
        enableInfiniteScroll: true, //無限スクロール
        autoPlay: true, //自動スクロール
        autoPlayInterval: Duration(seconds: 7), //スクロールのインターバル
        autoPlayAnimationDuration: Duration(milliseconds: 800), //スクロールの時間
        autoPlayCurve: Curves.fastOutSlowIn, //スクロールの仕方
        // enlargeCenterPage:false, //真ん中を拡大表示
      ),
    );
  }
}

class function_Widget extends StatelessWidget {
  const function_Widget({
    Key? key,
    required this.isExpanded,
  }) : super(key: key);

  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: AnimatedCrossFade(
        firstChild: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: [
            IconWidget(routing: '/whatSOLA',image: 'assets/icons/info.png',title: 'SOLA',),
            IconWidget(routing: '/moon',image: 'assets/icons/moon.png',title: '月の様子',),
            IconWidget(routing: '/introducton',image: 'assets/icons/note.png',title: '活動記録',),
            IconWidget(routing: '/calendar',image: 'assets/icons/calendar.png',title: 'カレンダー',),
            //IconWidget(routing: '/moon',image: 'assets/icons/setting.png',title: '設定',),
          ],
        ),
        secondChild: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: [
            IconWidget(routing: '/whatSOLA',image: 'assets/icons/info.png',title: 'SOLA',),
            IconWidget(routing: '/moon',image: 'assets/icons/moon.png',title: '月の様子',),
            IconWidget(routing: '/introducton',image: 'assets/icons/note.png',title: '活動記録',),
            IconWidget(routing: '/calendar',image: 'assets/icons/calendar.png',title: 'カレンダー',),
            IconWidget(routing: '/unimplement',image: 'assets/icons/fortune.png',title: 'スタンプ',),
            //IconWidget(routing: '/unimplement',image: 'assets/icons/ranking.png',title: 'ランキング',),
            IconWidget(routing: '/unimplement',image: 'assets/icons/sign.png',title: '星座',),
            //IconWidget(routing: '/unimplement',image: 'assets/icons/weather.png',title: '天気',),
            IconWidget(routing: '/unimplement',image: 'assets/icons/padlock.png',title: '管理者',),
            IconWidget(routing: '/config',image: 'assets/icons/setting.png',title: '設定',),
        
      ]),
        crossFadeState:
        isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: kThemeAnimationDuration,
      )
    );
  }
}

class TopBar_Widget extends StatelessWidget {
  const TopBar_Widget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var  _width = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Container(
          child: Center(
          child: Container(
            width:  double.infinity,
            height: _height / 3.5 ,
            decoration: BoxDecoration(


              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  Colors.blueAccent.withOpacity(0.3),
                  Color.fromARGB(255, 31, 128, 208).withOpacity(0.7),
                ],
              ),
            ),
          ),
          
          ),
        ),
        //Moon_widget(),
        Container(
          width: _width/2, 
          margin: EdgeInsets.only(left: _width/4,  top: _height/40),
          child: Container( child: Image.asset('assets/icons/SOLA_black_透過.png',height: _height/4))),
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, top: _height/4),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            elevation: 8,
            child: Container(
              padding: EdgeInsets.all(10),
              width: _width/1.2,
              decoration: BoxDecoration(
                //border: Border.all(color: Colors.blue), //縁の色
                borderRadius: BorderRadius.circular(30.0),
              ),
              child:  const Text('三重大学天文サークル公式アプリ',textAlign: TextAlign.center,style: TextStyle(),)
              // child: TextFormField(
              //   cursorColor: Colors.orange[200],
              //   keyboardType: TextInputType.text,
              //   decoration: InputDecoration(
              //     contentPadding: EdgeInsets.all(10),
              //     prefixIcon:
              //     Icon(Icons.star, color: Colors.orange[200], size: 20),
              //     hintText: "三重大学天文サークル公式アプリ",
              //     border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(30.0),
              //         borderSide: BorderSide.none),
              //   ),
              // ),
            ),
          ),
        ),
        Container(//上の横並びのところ
        //color: Colors.blue,
          margin: EdgeInsets.only(left: 20, right: 20, top: _height/20),//上のやつ高さ
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //右上のベルマーク
              // Opacity(
              //   opacity: 0.5,
              //   child: GestureDetector(
              //     onTap: (){},
              //       child: Icon(Icons.notifications, color: Colors.black,size: 30,)),
              // ),
            ],
          ),
        ),

      ],
    );
  }
}

