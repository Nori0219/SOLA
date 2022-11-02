import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sola/UI/moon_page.dart';
import 'package:sola/UI/widgets/item_widget.dart';
import 'package:sola/UI/widgets/maincustomcard.dart';
import 'package:sola/model/category.dart';
import 'package:sola/model/topic.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isExpanded = false;
  late List<Category> categoryItems;
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
    //   Topic(
    //       "02 Apr 2019",
    //       "流星群観測",
    //       "ペルセウス座流星群の観測を行いました！",
    //       "町屋海岸",
    //       "天体観測",
    //       "",
    //       true),
    //   Topic(
    //       "02 Apr 2019",
    //       "流星群観測",
    //       "ペルセウス座流星群の観測を行いました！",
    //       "町屋海岸",
    //       "天体観測",
    //       "",
    //       true),
    // ];
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
                            isExpanded ? "close" : "show",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                ),
                          )),
                      IconButton(icon: isExpanded? Icon(Icons.arrow_drop_up, color: Colors.orange[200],) : Icon(Icons.arrow_drop_down, color: Colors.orange[200],), onPressed: _expand)
                    ],
                  ),
                ),
                function_Widget(isExpanded: isExpanded),
                //Divider(),
                // Container(
                //   child: ListView.builder(
                //     padding: EdgeInsets.all(5),
                //     shrinkWrap: true,
                //     itemCount: topicListItems.length,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (BuildContext context, index) {
                //       //return CustomCard();
                //     },
                //   ),
                // )
              ],
              )
            ),
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
            IconWidget(routing: '/moon',image: 'assets/icons/info.png',title: 'SOLA',),
            IconWidget(routing: '/moon',image: 'assets/icons/moon.png',title: '月の様子',),
            IconWidget(routing: '/moon',image: 'assets/icons/note.png',title: '活動記録',),
            IconWidget(routing: '/moon',image: 'assets/icons/calendar.png',title: 'カレンダー',),
            //IconWidget(routing: '/moon',image: 'assets/icons/setting.png',title: '設定',),
          ],
        ),
        secondChild: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: [
            IconWidget(routing: '/moon',image: 'assets/icons/info.png',title: 'SOLA',),
            IconWidget(routing: '/moon',image: 'assets/icons/moon.png',title: '月の様子',),
            IconWidget(routing: '/moon',image: 'assets/icons/note.png',title: '活動記録',),
            IconWidget(routing: '/moon',image: 'assets/icons/calendar.png',title: 'カレンダー',),
            IconWidget(routing: '/moon',image: 'assets/icons/setting.png',title: '設定',),
            IconWidget(routing: '/moon',image: 'assets/icons/fortune.png',title: 'スタンプ',),
            IconWidget(routing: '/moon',image: 'assets/icons/ranking.png',title: 'ランキング',),
            IconWidget(routing: '/moon',image: 'assets/icons/sign.png',title: '星座',),
            IconWidget(routing: '/moon',image: 'assets/icons/weather.png',title: '天気',),
            IconWidget(routing: '/moon',image: 'assets/icons/padlock.png',title: '管理者',),
            
            
          // IconWidget(routing: '/moon',image: 'assets/images/gadget.png',title: '明日の月齢',),
          // IconWidget(routing: '/moon',image: 'assets/images/gadget.png',title: '明日の月齢',),
          // IconWidget(routing: '/moon',image: 'assets/images/gadget.png',title: '明日の月齢',),
          // ],
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
          margin: EdgeInsets.only(left: 40, right: 40, top: _height/4),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            elevation: 8,
            child: Container(
              child: TextFormField(
                cursorColor: Colors.orange[200],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  prefixIcon:
                  Icon(Icons.search, color: Colors.orange[200], size: 30),
                  hintText: "What're you looking for?",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none),
                ),
              ),
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
              Opacity(
                opacity: 0.5,
                child: GestureDetector(
                  onTap: (){},
                    child: Icon(Icons.notifications, color: Colors.black,size: 30,)),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
