import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomBarColumn extends StatefulWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;
  final int id;

  BottomBarColumn({
    @required this.heading,
    @required this.s1,
    @required this.s2,
    @required this.s3,
    @required this.id
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BottomBarColumnState(heading, s1, s2, s3,id);
  }
}
class BottomBarColumnState extends State<BottomBarColumn>{

  final String heading;
  final String s1;
  final String s2;
  final String s3;
  final int id;

  BottomBarColumnState(
      @required this.heading,
      @required this.s1,
      @required this.s2,
      @required this.s3,
      @required this.id);

  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  launchurl1() async{
    final url = "http://deboengineering.com/";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not launch the url";
    }
  }

  launchurl2() async{
    final url = "https://elearning.ju.edu.et/";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not launch the url";
    }
  }
  launchurl3() async{
    final url = "https://ju.edu.et/library/";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not launch the url";
    }
  }
  launchurl4() async{
    final url = "https://facebook.com/";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not launch the url";
    }
  }
  launchurl5() async{
    final url = "https://twitter.com/";
    if(await canLaunch(url)){
      await launch(url);
    }
    else{
      throw "Could not launch the url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                value
                    ? _isHovering[0] = true
                    : _isHovering[0] = false;
              });
            },
            onTap: (){s1 == "Contact Us" ? launchurl3()
                :s1 =="E-Learning"?launchurl2():launchurl5();},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  s1,
                  style: TextStyle(
                      color: _isHovering[0]
                          ? Colors.white
                          : Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),
                ),
                SizedBox(height: 5),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering[0],
                  child: Container(
                    height: 2,
                    width: 20,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
          InkWell(
            onHover: (value) {
              setState(() {
                value
                    ? _isHovering[1] = true
                    : _isHovering[1] = false;
              });
            },
            onTap: () => s2 == "About Us"?launchurl1(): s2 =="Jimma University Library"?launchurl3():launchurl4(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  s2,
                  style: TextStyle(
                      color: _isHovering[1]
                          ? Colors.white
                          : Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),
                ),
                SizedBox(height: 5),
                Visibility(
                  maintainAnimation: true,
                  maintainState: true,
                  maintainSize: true,
                  visible: _isHovering[1],
                  child: Container(
                    height: 2,
                    width: 20,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
