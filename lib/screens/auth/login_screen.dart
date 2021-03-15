import 'package:citizen_app/dataclasses/Constants.dart';
import 'package:citizen_app/screens/auth/register_screen.dart';
import 'package:citizen_app/screens/ui/InputDeco_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {

    _getData();
  }

  String _mobileNumber = "";
  TextEditingController _mobile = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.webp"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Form(
              key: _formKey,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset("assets/app_logo.webp"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Sign in / Sign up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    autocorrect: true,
                    style: TextStyle(fontSize: 18.0),
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    textInputAction: TextInputAction.done,
                    controller: _mobile,
                    decoration:
                    buildInputDecoration(Icons.phone, "Enter Mobile Number","Mobile Number"),
                    validator: (String value) {
                      String pattern = r'(^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$)';
                      RegExp regExp = new RegExp(pattern);
                      if (value.isEmpty) {
                        return 'Please enter phone no ';
                      }
                      if (value.length != 10)
                        return 'Mobile Number must be of 10 digit';
                      else if (!regExp.hasMatch(value)) {
                        return 'Please enter valid mobile number';
                      }
                      else
                        return null;
                    },
                    onSaved: (String value) {
                      _mobileNumber = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    width: 200,
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate())
                        {
                          _formKey.currentState.save();
                          toastMessage("Username: $_mobileNumber");
                          print("Successfull");
                          Navigator.push(context,  PageTransition(child: RegisterScreen(), type: PageTransitionType.bottomToTop));

                        }else{
                          print("UnSuccessfull");
                        }
                       // _formKey.currentState.save();

                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.blue),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue, width: 2.0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void toastMessage(String message) {
    //print("$message");
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Future<void> _getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    print(sharedPreferences.getString(Constants.MunicipalityUlbID));
  }
}
