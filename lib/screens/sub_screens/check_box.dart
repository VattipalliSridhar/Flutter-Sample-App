import 'package:flutter/material.dart';

class MyPopItem {
  String title;
  IconData icon;

  MyPopItem({this.title, this.icon});
}

List<MyPopItem> itemChoice = <MyPopItem>[
  MyPopItem(title: 'Acount', icon: Icons.account_balance),
  MyPopItem(title: 'Person', icon: Icons.account_balance),
  MyPopItem(title: 'Email', icon: Icons.account_balance),
  MyPopItem(title: 'Acount', icon: Icons.account_balance),
  MyPopItem(title: 'Acount', icon: Icons.account_balance),
];

class CheckBoxSample extends StatefulWidget {
  @override
  _CheckBoxSampleState createState() => _CheckBoxSampleState();
}

class _CheckBoxSampleState extends State<CheckBoxSample> {
  bool orangeVal = false;
  bool lemonVal = false;
  bool appleVal = false;
  bool _isSwitch = false;
  String _buttonState = "Button Enable";

  void _myButtonFunc() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox"),
        centerTitle: false,
        actions: [
          PopupMenuButton<MyPopItem>(
              elevation: 3.2,
              //initialValue: itemChoice[1],
              onCanceled: () {},
              onSelected: _doSomething,
              itemBuilder: (BuildContext context) {
                return itemChoice.map((MyPopItem choice) {
                  return PopupMenuItem<MyPopItem>(
                    value: choice,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          choice.icon,
                          color: Colors.black87,
                        ),
                        Text(choice.title)
                      ],
                    ),
                  );
                }).toList();
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Orange"),
                    Checkbox(
                      value: orangeVal,
                      onChanged: (bool val) {
                        setState(() {
                          orangeVal = val;
                        });
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Lemon"),
                    Checkbox(
                      value: lemonVal,
                      onChanged: (bool val) {
                        setState(() {
                          lemonVal = val;
                        });
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Apple"),
                    Checkbox(
                      value: appleVal,
                      onChanged: (bool val) {
                        setState(() {
                          appleVal = val;
                        });
                      },
                    )
                  ],
                )

                /*  Text("Orange"),
                Checkbox(
                  value: orangeVal,
                  onChanged: (bool val) {
                    setState(() {
                      orangeVal = val;
                    });
                  },
                )*/
              ],
            ),
            Text("Orange: $orangeVal \n Lemon: $lemonVal \n Apple: $appleVal"),
            SizedBox(
              height: 15,
            ),
            LinearProgressIndicator(),
            SizedBox(
              height: 15,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 15,
            ),
            Switch(
                value: _isSwitch,
                onChanged: (newValue) {
                  setState(() {
                    _isSwitch = newValue;
                    if (_isSwitch) {
                      _buttonState = "Button Enable";
                    } else {
                      _buttonState = "Button Disable";
                    }
                  });
                }),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
                color: Colors.amberAccent,
                disabledColor: Colors.grey,
                textColor: _isSwitch ? Colors.white : Colors.black87,
                child: Text('$_buttonState'),
                onPressed: _isSwitch ? _myButtonFunc : null)
          ],
        ),
      ),
    );
  }

  void _doSomething(MyPopItem value) {
    print('Click menu -> ${value.title}');
  }
}
