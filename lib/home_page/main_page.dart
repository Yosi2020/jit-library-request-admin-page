import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_admin/widgets/book_request.dart';
import 'package:lib_admin/widgets/menu_drawer.dart';
import 'package:lib_admin/widgets/plagiarism.dart';
import 'package:lib_admin/widgets/research_request.dart';
import 'package:lib_admin/widgets/bottom_bar.dart';

class Main_Page extends StatefulWidget {
  const Main_Page({Key key}) : super(key: key);

  @override
  _Main_PageState createState() => _Main_PageState();
}

class _Main_PageState extends State<Main_Page> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width<800? Scaffold(
        extendBodyBehindAppBar: true,
        appBar:AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.5),
      title: Text(
        'JIT LIBRARY Admin Page',
        style: TextStyle(
          color: Color(0xFF077bd7),
          fontSize: 26,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w900,
          letterSpacing: 3,
        ),
      ),
      centerTitle: true,),
      drawer: MenuDrawer(),
      body: bookRequest(),): Scaffold(
        extendBodyBehindAppBar: true,
        appBar:AppBar(
        title: Text("JIT LIBRARY Admin Page"),
      centerTitle: true,
      backwardsCompatibility: false,),
      body: SingleChildScrollView(
        child: Column(
      children: [Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height,
              color: Colors.white38,
              child: bookRequest(),
            ),
            Divider(
              height: 50,
              thickness: 3,),
            Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height,
              color: Colors.white38,
              child: researchRequest(),
            ),
            Divider(
              height: 50,
              thickness: 3,),
            Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height,
              color: Colors.white38,
              child: PlagiarismPage(),
            ),
          ],
        ),
         BottomBar()
            ]
      ),
    ));
  }
}
