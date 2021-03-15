import 'package:citizen_app/api/api_service.dart';
import 'package:citizen_app/api/controllers.dart';
import 'package:citizen_app/model/ulb_model.dart';
import 'package:citizen_app/screens/auth/login_screen.dart';
import 'package:citizen_app/screens/sub_screens/check_box.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    ApiService _apiService = new ApiService();
    ControllersData  _controllersData = new ControllersData();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllersData.doLogin("056");
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          PageTransition(child: CheckBoxSample(), type: PageTransitionType.fade));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/state_splash.webp"),
            fit: BoxFit.cover,
          )),
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    // height: MediaQuery.of(context).size.width * 0.02,
                    //child: Lottie.asset('assets/lloading.json'),
                    child: CircularProgressIndicatorApp(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Loading",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),

        /*child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              new Image.asset("assets/state_splash.webp")
            ]
        ),*/
      ),
    );
  }
}

class CircularProgressIndicatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.blue,
      valueColor: AlwaysStoppedAnimation(Colors.white),
      strokeWidth: 5,
    );
  }
}
