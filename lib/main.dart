import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:lib_admin/home_page/home_page.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({Key key}):super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Library Admin Page",
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done){
            return HomePage();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}