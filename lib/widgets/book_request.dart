import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lib_admin/widgets/book_request_detail.dart';

class bookRequest extends StatefulWidget {
  const bookRequest({Key key}) : super(key: key);

  @override
  _bookRequestState createState() => _bookRequestState();
}

class _bookRequestState extends State<bookRequest> {

  List dataList = [];

  void initState(){
    getData();
    buildItems(dataList);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title : Text("Book Request"),
          backgroundColor: Colors.green,
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
                dataList = snapshot.data as List;
                //print(dataList);
                return buildItems(dataList);
              }
              return const Center(child: CircularProgressIndicator());
            })),
    ));
  }

  Widget buildItems(dataList) => ListView.separated(
      padding: const EdgeInsets.all(8),
        itemCount: dataList.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
        TextStyle titleStyle = Theme.of(context).textTheme.subhead;
          return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person),
              ),
              title : Text("${dataList[index]["First Name"]} ${dataList[index]["Last Name"]}", style: titleStyle,),
              subtitle: Text(dataList[index]["DateTime"]),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
              onTap:(){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>bookRequestDetial(dataList[index])));
              }
          );
        });


  int count =0;

  List libraryList =[];
  
  final CollectionReference _collectionRef = 
  FirebaseFirestore.instance.collection("Requests");
  
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
