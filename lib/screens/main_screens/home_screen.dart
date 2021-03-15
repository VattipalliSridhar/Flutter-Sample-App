import 'package:citizen_app/dataclasses/Constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _munici_name = "";

  final titles = [
    'bike',
    'boat',
    'bus',
    'car',
    'railway',
    'run',
    'subway',
    'transit',
    'walk',
    'bike',
    'boat',
    'boat',
    'bike',
    'boat',
    'boat'
  ];

  final colorsData = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.amberAccent,
    Colors.deepPurple,
    Colors.teal,
    Colors.redAccent,
    Colors.brown,
    Colors.lightGreen,
    Colors.purple.shade100,
    Colors.orangeAccent,
    Colors.red,
    Colors.purple.shade100,
    Colors.orangeAccent,
    Colors.red
  ];

  final icons = [
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.directions_railway,
    Icons.directions_run,
    Icons.directions_subway,
    Icons.directions_transit,
    Icons.directions_walk,
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_boat,
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_boat
  ];

  var width = 200;
  var height = 200;

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _munici_name,
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Drawer(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 100,
                  child: _createHeader(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: titles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: ListTile(
                          leading: Icon(icons[index]),
                          title: Text(titles[index]),
                          onTap: () {
                            //                                  <-- onTap
                            setState(() {
                              print(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          /* child: ListView.builder(

            */ /*children: <Widget>[
              _createHeader(),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                onTap: () {},
              ),
              ListTile(
                title: Text("Sign In"),
                leading: Icon(Icons.access_time),
                onTap: () {},
              ),
              ListTile(
                title: Text("Sign Out"),
                leading: Icon(Icons.local_activity),
                onTap: () {},
              ),
            ],*/ /*

            itemCount: titles.length,
            itemBuilder: (context,index){

              return Card(
                child: ListTile(
                  leading: Icon(icons[index]),
                  title: Text(titles[index]),
                  onTap: () { //                                  <-- onTap
                    setState(() {
                      print(index);
                    });
                  },
                ),
              );
            },
          ),*/
        ),
        body: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
              childAspectRatio: 0.90,
            ),
            itemCount: titles.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                 // color: colorsData[index],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: colorsData[index],

              );
            },
          ),
        ));
  }

  Future<void> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      _munici_name = sharedPreferences.getString(Constants.MunicipalityName);
    });
    print(_munici_name);
  }

  _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.blue),
        /* decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/bg.webp'),
        )),*/
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(_munici_name,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}
