import 'package:flutter/material.dart';
import 'package:lib_admin/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final formKey = GlobalKey<FormState>();

  TextEditingController controlFname = TextEditingController();
  TextEditingController controlLname = TextEditingController();
  TextEditingController controlEmail = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  TextEditingController controlConfPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Form(
        key: formKey,
        child: MediaQuery.of(context).size.width<285?
      SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 60, bottom: 70,
                left: 5.0,right: 5),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
              elevation: 5.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      height: MediaQuery.of(context).size.height/1.2,
                      color: Colors.lightBlue[600],
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 45.0, right: 25.0,left: 25.0, bottom: 60),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 60.0,),
                              Container(padding: EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0),
                                child: Text(
                                  "Welcome to JIT Library Admin-page",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27.0,
                                      fontWeight: FontWeight.w900
                                  ),
                                ),),
                              SizedBox(height: 5.0,),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0
                                ),
                                child: Text(
                                  "It should only take a couple of minute to create admin account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 50,),
                              FlatButton(
                                  color: Colors.grey[600],
                                  onPressed: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder:
                                            (context) =>HomePage()));
                                  },
                                  child: Text(
                                    "LogIn",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 15.0, right: 70.0,
                          left: 70.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Merriweather"
                            ),),
                          const SizedBox(height: 21.0,),
                          buildTextField(
                              title: "FirstName",
                              controller: controlFname,
                              autoHint: "First Name",
                              size: MediaQuery.of(context).size.width/3,
                              match: r'^[a-z, A-Z]+$',
                              Eicon: Icon(Icons.person)
                          ),
                          SizedBox(height: 10.0,),
                          buildTextField(
                              title: "LastName",
                              controller: controlLname,
                              autoHint: "Last Name",
                              size: MediaQuery.of(context).size.width/3,
                              match: r'^[a-z, A-Z]+$',
                              Eicon: Icon(Icons.person)),
                          SizedBox(height: 10.0,),
                          buildTextField(
                              title: "Email",
                              controller: controlEmail,
                              autoHint: "test@gmail.com",
                              size: MediaQuery.of(context).size.width/3,
                              match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                              Eicon: Icon(Icons.email)),
                          SizedBox(height: 10.0,),
                          buildTextFieldPassword(
                              title: "Password",
                              controller: controlPassword,
                              autoHint: "*******",
                              size: MediaQuery.of(context).size.width/3),
                          SizedBox(height: 10.0,),
                          buildTextFieldConfPassword(
                              title: "Conform password",
                              controller: controlConfPassword,
                              autoHint: "*******",
                              size: MediaQuery.of(context).size.width/3),

                          SizedBox(height: 20.0,),

                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              //SizedBox(width: 140,),
                              FlatButton(
                                  color: Colors.lightBlue,
                                  onPressed: (){
                                    final isValid = formKey.currentState.validate();

                                    if (isValid) {
                                      create();
                                    }
                                  },
                                  child: Text("Create Account",
                                    style: TextStyle(color: Colors.white),)),
                              SizedBox(height: 12.0,),
                              FlatButton(
                                  color: Colors.grey[200],
                                  onPressed: (){
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AdminPage()))
                                  },
                                  child: Text("Cancel")),

                            ],)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ) ): MediaQuery.of(context).size.width<412?
      SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 60, bottom: 60,
                left: 30.0,right: 30),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
              elevation: 5.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.5,
                      height: MediaQuery.of(context).size.height/1.2,
                      color: Colors.lightBlue[600],
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 45.0, right: 50.0,left: 50.0, bottom: 50),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 60.0,),
                              Container(padding: EdgeInsets.only(
                                  top: 5.0,
                                  bottom: 5.0),
                                child: Text(
                                  "Welcome to JIT Library Admin-page",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27.0,
                                      fontWeight: FontWeight.w900
                                  ),
                                ),),
                              SizedBox(height: 5.0,),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 5.0,
                                    bottom: 5.0
                                ),
                                child: Text(
                                  "It should only take a couple of minute to create admin account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 50,),
                              FlatButton(
                                  color: Colors.grey[600],
                                  onPressed: (){
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                            HomePage()));
                                  },
                                  child: Text(
                                    "LogIn",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 15.0, right: 50.0,
                          left: 50.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Merriweather"
                            ),),
                          const SizedBox(height: 21.0,),
                          buildTextField(
                              title: "FirstName",
                              controller: controlFname,
                              autoHint: "First Name",
                              size: MediaQuery.of(context).size.width/2.5,
                              match: r'^[a-z, A-Z]+$',
                              Eicon: Icon(Icons.person)
                          ),
                          SizedBox(height: 10.0,),
                          buildTextField(
                              title: "LastName",
                              controller: controlLname,
                              autoHint: "Last Name",
                              size: MediaQuery.of(context).size.width/2.5,
                              match: r'^[a-z, A-Z]+$',
                              Eicon: Icon(Icons.person)),
                          SizedBox(height: 10.0,),
                          buildTextField(
                              title: "Email",
                              controller: controlEmail,
                              autoHint: "test@gmail.com",
                              size: MediaQuery.of(context).size.width/2.5,
                              match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                              Eicon: Icon(Icons.email)),
                          SizedBox(height: 10.0,),
                          buildTextFieldPassword(
                              title: "Password",
                              controller: controlPassword,
                              autoHint: "*******",
                              size: MediaQuery.of(context).size.width/2.5),
                          SizedBox(height: 10.0,),
                          buildTextFieldConfPassword(
                              title: "Conform password",
                              controller: controlConfPassword,
                              autoHint: "*******",
                              size: MediaQuery.of(context).size.width/2.5),

                          SizedBox(height: 20.0,),

                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              //SizedBox(width: 140,),
                              FlatButton(
                                  color: Colors.lightBlue,
                                  onPressed: (){
                                    final isValid = formKey.currentState.validate();

                                    if (isValid) {
                                      create();
                                    }
                                  },
                                  child: Text("Create Account",
                                    style: TextStyle(color: Colors.white),)),
                              SizedBox(height: 12.0,),
                              FlatButton(
                                  color: Colors.grey[200],
                                  onPressed: (){
                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AdminPage()))
                                  },
                                  child: Text("Cancel")),

                            ],)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ) ): MediaQuery.of(context).size.width<870?
      SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 60, bottom: 60,
            left: 15.0,right: 15),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width/1.5,
                  height: MediaQuery.of(context).size.height/1.5,
                  color: Colors.lightBlue[600],
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 45.0, right: 50.0,left: 50.0, bottom: 50),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60.0,),
                          Container(padding: EdgeInsets.only(
                              top: 5.0,
                              bottom: 5.0),
                            child: Text(
                              "Welcome to JIT Library Admin-page",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27.0,
                                  fontWeight: FontWeight.w900
                              ),
                            ),),
                          SizedBox(height: 5.0,),
                          Container(
                            padding: EdgeInsets.only(
                                top: 5.0,
                                bottom: 5.0
                            ),
                            child: Text(
                              "It should only take a couple of minute to create admin account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 50,),
                          FlatButton(
                              color: Colors.grey[600],
                              onPressed: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder:
                                        (context) =>HomePage()));
                              },
                              child: Text(
                                "LogIn",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 15.0, right: 70.0,
                      left: 70.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Merriweather"
                        ),),
                      const SizedBox(height: 21.0,),
                      buildTextField(
                          title: "FirstName",
                          controller: controlFname,
                          autoHint: "First Name",
                          size: MediaQuery.of(context).size.width/2.0,
                          match: r'^[a-z, A-Z]+$',
                          Eicon: Icon(Icons.person)
                      ),
                      SizedBox(height: 10.0,),
                      buildTextField(
                          title: "LastName",
                          controller: controlLname,
                          autoHint: "Last Name",
                          size: MediaQuery.of(context).size.width/2.0,
                          match: r'^[a-z, A-Z]+$',
                          Eicon: Icon(Icons.person)),
                      SizedBox(height: 10.0,),
                      buildTextField(
                          title: "Email",
                          controller: controlEmail,
                          autoHint: "test@gmail.com",
                          size: MediaQuery.of(context).size.width/2.0,
                          match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                          Eicon: Icon(Icons.email)),
                      SizedBox(height: 10.0,),
                      buildTextFieldPassword(
                          title: "Password",
                          controller: controlPassword,
                          autoHint: "*******",
                          size: MediaQuery.of(context).size.width/2.0),
                      SizedBox(height: 10.0,),
                      buildTextFieldConfPassword(
                          title: "Conform password",
                          controller: controlConfPassword,
                          autoHint: "*******",
                          size: MediaQuery.of(context).size.width/2.0),

                      SizedBox(height: 20.0,),

                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          //SizedBox(width: 140,),
                          FlatButton(
                              color: Colors.grey[200],
                              onPressed: (){
                                //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AdminPage()))
                              },
                              child: Text("Cancel")),
                          SizedBox(width: 20.0,),
                          FlatButton(
                              color: Colors.lightBlue,
                              onPressed: (){
                                final isValid = formKey.currentState.validate();

                                if (isValid) {
                                  create();
                                }
                              },
                              child: Text("Create Account",
                                style: TextStyle(color: Colors.white),)),
                        ],)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ) ):
        SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.only(top: 60, bottom: 60, left: 120.0,right: 120),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          elevation: 5.0,
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width/3.3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.lightBlue[600],
                  child: Padding(
                    padding: EdgeInsets.only(top: 85.0, right: 50.0,left: 50.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60.0,),
                          Container(padding: EdgeInsets.only(
                              top: 5.0,
                              bottom: 5.0),
                            child: Text(
                              "Welcome to JIT Library Admin-page",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 27.0,
                                  fontWeight: FontWeight.w900
                              ),
                            ),),
                          SizedBox(height: 5.0,),
                          Container(
                            padding: EdgeInsets.only(
                                top: 5.0,
                                bottom: 5.0
                            ),
                            child: Text(
                              "It should only take a couple of minute to create admin account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 50,),
                          FlatButton(
                              color: Colors.grey[600],
                              onPressed: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder:
                                        (context) =>HomePage()));
                              },
                              child: Text(
                                "LogIn",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 15.0, right: 70.0,
                      left: 70.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Merriweather"
                        ),),
                      const SizedBox(height: 21.0,),
                      buildTextField(
                          title: "FirstName",
                          controller: controlFname,
                          autoHint: "First Name",
                          size: MediaQuery.of(context).size.width/4,
                          match: r'^[a-z, A-Z]+$',
                        Eicon: Icon(Icons.person)
                      ),
                      SizedBox(height: 10.0,),
                      buildTextField(
                          title: "LastName",
                          controller: controlLname,
                          autoHint: "Last Name",
                          size: MediaQuery.of(context).size.width/4,
                          match: r'^[a-z, A-Z]+$',
                          Eicon: Icon(Icons.person)),
                      SizedBox(height: 10.0,),
                      buildTextField(
                          title: "Email",
                          controller: controlEmail,
                          autoHint: "test@gmail.com",
                          size: MediaQuery.of(context).size.width/4,
                          match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                          Eicon: Icon(Icons.email)),
                      SizedBox(height: 10.0,),
                      buildTextFieldPassword(
                          title: "Password",
                          controller: controlPassword,
                          autoHint: "*******",
                          size: MediaQuery.of(context).size.width/4),
                      SizedBox(height: 10.0,),
                      buildTextFieldConfPassword(
                          title: "Conform password",
                          controller: controlConfPassword,
                          autoHint: "*******",
                          size: MediaQuery.of(context).size.width/4),

                      SizedBox(height: 20.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                              color: Colors.grey[200],
                              onPressed: (){
                                //Navigator.of(context).push(MaterialPageRoute(builder: (context) =>AdminPage()))
                              },
                              child: Text("Cancel")),
                          SizedBox(width: 20.0,),
                          FlatButton(
                              color: Colors.lightBlue,
                              onPressed: (){
                                final isValid = formKey.currentState.validate();

                                if (isValid) {
                                  create();
                                }},
                              child: Text("Create Account",
                                style: TextStyle(color: Colors.white),)),
                        ],)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
    )
    );
  }

  Widget buildTextField({
    @required title,
    @required TextEditingController controller,
    int maxLines=1,
    @required String autoHint,
    @required size,
    @required match,
    @required Eicon,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size,
            child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: autoHint,
                prefixIcon: Eicon,
              ),
              validator: (value) {
                if (value.isEmpty || !RegExp(match).hasMatch(value))
                  return "Enter a correct " + title;
                else
                  return null;
              }
          ),
          )

        ],
      );
  bool isHiddenPassword = true;

  Widget buildTextFieldPassword({
    @required title,
    @required TextEditingController controller,
    int maxLines =1,
    @required String autoHint,
    @required size,
    @required match
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size, child: TextFormField(
              obscureText: isHiddenPassword,
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: autoHint,
                prefixIcon: Icon(Icons.security),
                suffixIcon: InkWell(
                  onTap: _togglePassword,
                  child:isHiddenPassword ? Icon(
                    Icons.visibility,
                  ): Icon(Icons.visibility_off),
                ),),
              validator: (value) {
                if (value.length <= 7)
                  return "Your password must be >= 7 digit";
                else
                  return null;
              }
          ),
          )

        ],
      );

  Widget buildTextFieldConfPassword({
    @required title,
    @required TextEditingController controller,
    int maxLines =1,
    @required String autoHint,
    @required size,
    @required match
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size, child: TextFormField(
              obscureText: isHiddenPassword,
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: autoHint,
                prefixIcon: Icon(Icons.security),
                suffixIcon: InkWell(
                  onTap: _togglePassword,
                  child:isHiddenPassword ? Icon(
                    Icons.visibility,
                  ): Icon(Icons.visibility_off),
                ),),
              validator: (value) {
                if (value.length <= 7 && value == controlPassword.text)
                  return "Your password didn't match together";
                else
                  return null;
              }
          ),
          )

        ],
      );

  void _togglePassword(){
    if(isHiddenPassword == true){
      isHiddenPassword = false;
    }
    else isHiddenPassword = true;
    setState(() {
      isHiddenPassword = isHiddenPassword;
    });
  }

  void create() {
    String FirstName = controlFname.text;
    String LastName = controlLname.text;
    String Email = controlEmail.text;
    String Password = controlPassword.text;
    register(FirstName, LastName, Email, Password);
  }
    final CollectionReference collectionRef =
    FirebaseFirestore.instance.collection("Create_Account");

    Future<void> register(String FirstName, LastName, Email, Password) async {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: Email, password: Password)
          .then((value) => {
        postDetialToFirebase(FirstName, LastName, Email, Password)})
          .catchError((error) =>
          _showAlertDialog("JIT Library Request",
              "Problem on sending Your request, please try again."));
    }

    postDetialToFirebase(FirstName, LastName, Email, Password) async{
      await printDocID();
      return collectionRef.add(
        {'First Name': FirstName,
          "Last Name": LastName,
          "Email": Email,
          "Password": Password,},
      ).then((eyu) =>  _showAlertDialog("JIT Library Admin Page",
          "Your request send Successfully. You can login"))
          .catchError((error) =>
          _showAlertDialog("JIT Library Request",
              "Problem on sending Your request, please try again."));
    }

    printDocID() async {
      var querySnapshots = await collectionRef.get();
      for (var snapshot in querySnapshots.docs) {
        var documentID = snapshot.id;
        debugPrint(documentID);
      }
    }

    void _showAlertDialog(String title, String message){
      AlertDialog alertDialog = AlertDialog(
          title: Text(title),
          content: Text(message),
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
          actions: <Widget>[
            new FlatButton(
              child: Text('Exit'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => HomePage())
                );
              },
            ),
          ]
      );
      showDialog(
          context: context,
          builder: (_) => alertDialog);
    }

}
