import 'package:citizen_app/screens/main_screens/home_screen.dart';
import 'package:citizen_app/screens/ui/InputDeco_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
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
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/app_logo.webp"),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),

                        TextFormField(
                          autocorrect: true,
                          style: TextStyle(fontSize: 18.0),
                          keyboardType: TextInputType.text,
                          maxLength: 15,
                          textInputAction: TextInputAction.next,
                          // controller: _mobile,
                          decoration: buildInputDecoration(
                              Icons.person, "Enter Full Name", "Name"),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please Enter Full Name ';
                            }
                            if (value.length == 3)
                              return 'Mobile Number must be of 10 digit';
                            else
                              return null;
                          },
                          onSaved: (String value) {
                            // _mobileNumber = value;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        TextFormField(
                          autocorrect: true,
                          style: TextStyle(fontSize: 18.0),
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          //controller: _mobile,
                          decoration: buildInputDecoration(Icons.phone,
                              "Enter Mobile Number", "Mobile Number"),
                          validator: (String value) {
                            String pattern =
                                r'(^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$)';
                            RegExp regExp = new RegExp(pattern);
                            if (value.isEmpty) {
                              return 'Please enter phone no ';
                            }
                            if (value.length != 10)
                              return 'Mobile Number must be of 10 digit';
                            else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid mobile number';
                            } else
                              return null;
                          },
                          onSaved: (String value) {
                            // _mobileNumber = value;
                          },
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          autocorrect: true,
                          style: TextStyle(fontSize: 18.0),
                          keyboardType: TextInputType.emailAddress,
                          maxLength: 30,
                          textInputAction: TextInputAction.done,
                          //controller: _mobile,
                          decoration: buildInputDecoration(
                              Icons.mail, "Enter Email Address", "Email"),
                          validator: (String value) {
                            String pattern =
                                r'(^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$)';
                            RegExp regExp = new RegExp(pattern);
                            if (value.isEmpty) {
                              return 'Please enter phone no ';
                            }
                            if (value.length != 10)
                              return 'Mobile Number must be of 10 digit';
                            else if (!regExp.hasMatch(value)) {
                              return 'Please enter valid mobile number';
                            } else
                              return null;
                          },
                          onSaved: (String value) {
                            // _mobileNumber = value;
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
                              Navigator.push(context,  PageTransition(child: HomeScreen(), type: PageTransitionType.bottomToTop));
                             /* if(_formKey.currentState.validate())
                              {
                                _formKey.currentState.save();
                                toastMessage("Username: $_mobileNumber");
                                print("Successfull");
                                Navigator.push(context,  PageTransition(child: RegisterScreen(), type: PageTransitionType.bottomToTop));

                              }else{
                                print("UnSuccessfull");
                              }*/
                              // _formKey.currentState.save();

                            },
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                            padding: EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color: Colors.blue)),
                          ),
                        ),
                        // nameWiget(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
