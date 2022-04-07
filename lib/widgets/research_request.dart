import 'package:flutter/material.dart';
import 'package:lib_admin/widgets/research_request_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class researchRequest extends StatefulWidget {
  const researchRequest({Key key}) : super(key: key);

  @override
  _researchRequestState createState() => _researchRequestState();
}

class _researchRequestState extends State<researchRequest> {
  @override

  void initState(){
    getData();
    buildItems(researchList);
  }

  List researchList =[];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title : Text("Research Request"),
          backgroundColor: Colors.yellow,
          centerTitle: true,
        ),
        body:Padding(
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
                  researchList = snapshot.data as List;
                  return buildItems(researchList);
                }
                return const Center(child: CircularProgressIndicator());
              })),
    ));
  }

  Widget buildItems(researchList) => ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: researchList.length,
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
      TextStyle titleStyle = Theme.of(context).textTheme.subhead;
        return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person),
            ),
            title : Text("${researchList[index]["First Name"]} ${researchList[index]["Last Name"]}", style: titleStyle,),
            subtitle: Text(researchList[index]["DateTime"]),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=>researchDetail(researchList[index])));
            }
        );
      },);


  int count =0;

  List libraryResearchList =[];

  final CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection("Research_Request");

  Future getData() async{
    try{
      await _collectionRef.get().then((querySnapshot){
        for (var result in querySnapshot.docs){
          libraryResearchList.add(result.data());
        }
      });
      return libraryResearchList;
    } catch (e){
      debugPrint("Error -$e");
      return null;
    }
  }
}
