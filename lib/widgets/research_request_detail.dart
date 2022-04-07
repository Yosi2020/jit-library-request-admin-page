import 'package:flutter/material.dart';
import 'package:lib_admin/home_page/main_page.dart';
import 'package:lib_admin/widgets/bottom_bar.dart';
import 'package:lib_admin/widgets/research_request.dart';
import 'package:url_launcher/url_launcher.dart';

class researchDetail extends StatefulWidget {
  final Map researchList;
  const researchDetail(@required this.researchList, {Key key}) : super(key: key);

  @override
  _researchDetailState createState() => _researchDetailState(researchList);
}

class _researchDetailState extends State<researchDetail> {
  final Map researchList;
  _researchDetailState(@required this.researchList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request Detail"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 250,
                  color: Colors.deepOrange,),
                radius: 150,
              ),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("First Name : "+ researchList["First Name"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Last Name : "+researchList["Last Name"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Email : ",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                TextButton(
                    onPressed: (){
                      launchurlEmail() async{
                        final url = 'mailto:${researchList["Email"].toString()}';
                        if(await canLaunch(url)){
                          await launch(url);
                        }
                        else{
                          throw "Could not launch the url";
                        }
                      }
                      launchurlEmail();
                    },
                    child: Text('${researchList["Email"].toString()}', style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
                SizedBox(height: 16,),
                Text("Request : "+researchList["Request"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Message : "+researchList["Messgae"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Date Time : "+ researchList["DateTime"].toString(),
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
    )
              ],
            ),
            BottomBar(),
          ],
        ),
      ),
    ));
  }
}
