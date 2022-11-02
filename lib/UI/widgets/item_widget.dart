import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sola/UI/moon_page.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
     this.routing,
     this.image,
     this.title,
  });

  final routing; //例えば　'Moon'とすればmoonpageに遷移するようにmain.dartにMap形式で書く
  final image;
  final title;


  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var  _width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
              Navigator.pushNamed(context, '$routing');//routingに遷移先のページをビルドするルート名を書く
            print('Routing to $title ページ');
          },
          child: Container(
            // color: Colors.blue,
            // height: _height/20,
            // width: _width/10,
            child: Image.asset(
              '$image',
              fit: BoxFit.cover,
              height: _height / 20,
              
            ),
          )),
        SizedBox(
          height: 10,
        ),
        Flexible(
          child: Text(
            "$title",
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }
}