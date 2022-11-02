import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sola/UI/moon_page.dart';
import 'package:sola/model/category.dart';
import 'package:sola/model/topicModel.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool isExpanded = false;
  late List<Category> categoryItems;
  late List<Topic> topicListItems;


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
       final double deviceHeight = MediaQuery.of(context).size.height;
      //SizeConfig().init(context);
      // var _screenSize = MediaQuery.of(context).size;
       double _height = MediaQuery.of(context).size.height;
       double _width = MediaQuery.of(context).size.width;


    return Scaffold(
        body: (
          Column(
            children: <Widget>[
 
                TopBar_Widget(),
            ],
          )
        ),
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
                  Colors.red.withOpacity(0.5),
                  Colors.blue.withOpacity(0.7),
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
          margin: EdgeInsets.only(left: 20, right: 20, top: 50),//上のやつ高さ
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

