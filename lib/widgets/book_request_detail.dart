import 'package:flutter/material.dart';
import 'package:lib_admin/home_page/main_page.dart';
import 'package:lib_admin/widgets/book_request.dart';
import 'package:lib_admin/widgets/bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class bookRequestDetial extends StatefulWidget {
  final Map dataList;
  const bookRequestDetial(@required this.dataList, {Key key}) : super(key: key);

  @override
  _bookRequestDetialState createState() => _bookRequestDetialState(dataList);
}

class _bookRequestDetialState extends State<bookRequestDetial> {

  final Map dataList;
  _bookRequestDetialState(@required this.dataList);

  @override
  Widget build(BuildContext context) {
    print(dataList);
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(height: 12,),
            Center(child:CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 250,
                color: Colors.deepOrange,),
              radius: 150,
            ),),
            SizedBox(height: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text("Name : ${dataList["First Name"].toString()} ${dataList["Last Name"].toString()}",
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                  SizedBox(width: 16,),
                  Text("Email : ",
                    style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                  TextButton(
                      onPressed: (){
                        launchurlEmail() async{
                          final url = 'mailto:${dataList["Email"].toString()}';
                          if(await canLaunch(url)){
                            await launch(url);
                          }
                          else{
                            throw "Could not launch the url";
                          }
                        }
                        launchurlEmail();
                      },
                      child: Text("${dataList["Email"]}", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
                SizedBox(height: 16,),
                Text("Request : "+dataList["Request"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Message : "+dataList["Messgae"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Date Time : "+ dataList["DateTime"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                ElevatedButton(
                  child: Text(
                    "Back to previous page",
                  ),
                  onPressed: (){Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return Main_Page();
                      }
                  ));},
                ),
                SizedBox(height: 16,),
              ],
            ),
            BottomBar(),
          ],
        ),
      )
    ));
  }
}
