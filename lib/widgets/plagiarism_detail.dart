import 'package:flutter/material.dart';
import 'package:lib_admin/home_page/main_page.dart';
import 'package:lib_admin/widgets/bottom_bar.dart';
import 'package:lib_admin/widgets/plagiarism.dart';
import 'package:url_launcher/url_launcher.dart';

class Plagiarism_Detail extends StatefulWidget {
  final Map plagiarism;
  const Plagiarism_Detail(@required this.plagiarism,{Key key}) : super(key: key);

  @override
  _Plagiarism_DetailState createState() => _Plagiarism_DetailState(plagiarism);
}

class _Plagiarism_DetailState extends State<Plagiarism_Detail> {

  final Map plagiarism;
  _Plagiarism_DetailState(@required this.plagiarism);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plagiarism Detail"),
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
    SizedBox(height: 12,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("First Name : "+ plagiarism["First Name"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Last Name : "+plagiarism["Last Name"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Email : ",
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                TextButton(
                    onPressed: (){
                      launchurlEmail() async{
                        final url = 'mailto:${plagiarism["Email"].toString()}';
                        if(await canLaunch(url)){
                          await launch(url);
                        }
                        else{
                          throw "Could not launch the url";
                        }
                      }
                      launchurlEmail();
                    },
                    child: Text("${plagiarism["Email"]}", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
                SizedBox(height: 16,),
                Text("University : "+plagiarism["University"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Department : "+plagiarism["Department"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                Text("Date Time : "+ plagiarism["DateTime"].toString(),
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                SizedBox(height: 16,),
                TextButton(
                    onPressed: (){
                       launchurlPdf() async{
                          final url = '${plagiarism["fileUrl"].toString()}';
                          if(await canLaunch(url)){
                          await launch(url);
                          }
                          else{
                          throw "Could not launch the url";
                          }
                    }
                       launchurlPdf();
                    },
                    child: Text("Download this PDF", style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal))),
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
    BottomBar()
          ],
        ),
      ),
    ));
  }
}
