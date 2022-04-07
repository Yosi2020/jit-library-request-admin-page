import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_admin/widgets/plagiarism_detail.dart';


class PlagiarismPage extends StatefulWidget {
  const PlagiarismPage({Key key}) : super(key: key);

  @override
  _PlagiarismPageState createState() => _PlagiarismPageState();
}

class _PlagiarismPageState extends State<PlagiarismPage> {

  List plagiarism = [];

  void initState(){
    getData();
    buildItems(plagiarism);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : AppBar(
        title : Text("Plagiarism Check"),
    backgroundColor: Colors.red,
    centerTitle: true,
    ),
    body: Padding(
      padding: EdgeInsets.only(
          top: 10, bottom: 10, left: 5, right: 5
      ),
      child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5,
          child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    "Something went wrong",
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  plagiarism = snapshot.data as List;
                  //print(dataList);
                  return buildItems(plagiarism);
                }
                return const Center(child: CircularProgressIndicator());
              })),
    ));
  }

  Widget buildItems(plagiarism) => ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: plagiarism.length,
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
      TextStyle titleStyle = Theme.of(context).textTheme.subhead;
        return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person),
            ),
            title : Text("${plagiarism[index]["First Name"]} ${plagiarism[index]["Last Name"]}", style: titleStyle,),
            subtitle: Text(plagiarism[index]["DateTime"]),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>Plagiarism_Detail(plagiarism[index])));
            }
        );
      },);


  int count =0;

  List libraryList =[];

  final CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection("Plagiarism_check");

  Future getData() async{
    try{
      await _collectionRef.get().then((querySnapshot){
        for (var result in querySnapshot.docs){
          libraryList.add(result.data());
        }
      });
      return libraryList;
    } catch (e){
      debugPrint("Error -$e");
      return null;
    }
  }
}
