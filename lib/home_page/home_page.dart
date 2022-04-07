import 'package:flutter/material.dart';
import 'package:lib_admin/home_page/create_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lib_admin/home_page/main_page.dart';
import 'package:lib_admin/widgets/forget_password.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final formKey = GlobalKey<FormState>();

  TextEditingController controlEmail = TextEditingController();
  TextEditingController controlPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Form(
        key: formKey,
        child:MediaQuery.of(context).size.width<415?
      SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.only(top: 60, bottom: 60, left: 30.0,right: 30.0),
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
                            top: 45.0, right: 50.0,left: 50.0, bottom: 50.0),
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
                                  "It should only take a couple of second to create admin account",
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
                                            (context) => SignIn()));
                                  },
                                  child: Text(
                                    "Create Account",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey,),
                    Container(
                      padding: EdgeInsets.only(
                          top: 10.0, right: 50.0,
                          left: 50.0, bottom: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Merriweather"
                            ),),
                          const SizedBox(height: 21.0,),
                          buildTextField(
                              title: "Email",
                              controller: controlEmail,
                              autoHint: "test@gmail.com",
                              size: MediaQuery.of(context).size.width/2.5,
                              match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}'),
                          SizedBox(height: 20.0,),
                          buildTextFieldPassword(
                              title: "Password",
                              controller: controlPassword,
                              autoHint: "*******",
                              size: MediaQuery.of(context).size.width/2.5),
                          SizedBox(height: 20.0,),

                          Column(
                            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                  color: Colors.lightBlue,
                                  onPressed: (){
                                    final isValid = formKey.currentState.validate();

                                    if (isValid) {
                                      create();
                                    }
                                  },
                                  child: Text("LogIn",
                                    style: TextStyle(color: Colors.white),)),
                              SizedBox(height: 12.0,),
                              FlatButton(
                                  color: Colors.grey[200],
                                  onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Forget()));
                                  },
                                  child: Text("Forget Password")),

                            ],)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )): MediaQuery.of(context).size.width<870?
      SingleChildScrollView(
      child:Padding(
        padding: EdgeInsets.only(top: 60, bottom: 60, left: 30.0,right: 30.0),
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
                        top: 45.0, right: 50.0,left: 50.0, bottom: 50.0),
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
                              "It should only take a couple of second to create admin account",
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
                                        (context) => SignIn()));
                              },
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,),
                Container(
                  padding: EdgeInsets.only(
                      top: 10.0, right: 70.0,
                      left: 70.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Merriweather"
                        ),),
                      const SizedBox(height: 21.0,),
                      buildTextField(
                          title: "Email",
                          controller: controlEmail,
                          autoHint: "test@gmail.com",
                          size: MediaQuery.of(context).size.width/2.5,
                          match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}'),
                      SizedBox(height: 20.0,),
                      buildTextFieldPassword(
                          title: "Password",
                          controller: controlPassword,
                          autoHint: "*******",
                          size: MediaQuery.of(context).size.width/2.5),
                      SizedBox(height: 20.0,),

                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                              color: Colors.grey[200],
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Forget()));
                              },
                              child: Text("Forget Password")),
                          SizedBox(width: 5.0,),
                          FlatButton(
                              color: Colors.lightBlue,
                              onPressed: (){
                                final isValid = formKey.currentState.validate();

                                if (isValid) {
                                  create();
                                }
                              },
                              child: Text("LogIn",
                                style: TextStyle(color: Colors.white),)),
                        ],)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )):Padding(
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
                              "It should only take a couple of second to create admin account",
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
                                        (context) => SignIn()));
                              },
                              child: Text(
                                "Create Account",
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
                      top: 140.0, right: 70.0,
                      left: 70.0, bottom: 5.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Merriweather"
                        ),),
                      const SizedBox(height: 21.0,),
                      buildTextField(
                          title: "Email",
                          controller: controlEmail,
                          autoHint: "test@gmail.com",
                          size: MediaQuery.of(context).size.width/4,
                          match: r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}'),
                      SizedBox(height: 20.0,),
                      buildTextFieldPassword(
                          title: "Password",
                          controller: controlPassword,
                          autoHint: "*******",
                          size: MediaQuery.of(context).size.width/4),
                      SizedBox(height: 20.0,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                              color: Colors.grey[200],
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Forget()));
                              },
                              child: Text("Forget Password")),
                          SizedBox(width: 20.0,),
                          FlatButton(
                              color: Colors.lightBlue,
                              onPressed: (){
                                final isValid = formKey.currentState.validate();

                                if (isValid) {
                                  create();
                              }
                                },
                              child: Text("LogIn",
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
    ));
  }

  Widget buildTextField({
    @required title,
    @required TextEditingController controller,
    int maxLines=1,
    @required String autoHint,
    @required size,
    @required match,
  }) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size, child: TextFormField(
              controller: controller,
              maxLines: maxLines,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: autoHint,
                prefixIcon: Icon(Icons.email),
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
    String Email = controlEmail.text;
    String Password = controlPassword.text;
    login(Email, Password);
  }
  final CollectionReference collectionRef =
  FirebaseFirestore.instance.collection("Create_Account");


  Future<void> login(String Email, Password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: Email, password: Password)
        .then((value) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>Main_Page())
    ))
        .catchError((error) =>
        _showAlertDialog("JIT Library Request",
            "Problem on sending Your request, please try again."));
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
