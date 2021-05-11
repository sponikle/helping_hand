import 'package:flutter/material.dart';
import 'package:helpinghand/Screens/Home.dart';

import 'Components/Button.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var icons1 = Icons.arrow_forward_ios;
  bool buttonPressed1 = false;
   void _letsPress1() {
    setState(() {
      buttonPressed1 = true;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    "Welcome To",
                    style: TextStyle(
                      fontSize: 60.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                  child: Text(
                    "Helping",
                    style: TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 230.0, 0.0, 0.0),
                  child: Text(
                    "Hand .",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              

               Container(
                  padding: EdgeInsets.fromLTRB(15.0, 600.0, 0.0, 0.0),
                  child: Center(
                    child:Row(
                      children: <Widget>[
                        Expanded(child: GestureDetector(
                           onTap: _letsPress1,
                        child: MyButton(
                                icon: icons1,
                              ))
                  ),
                      ]
                      )
                      )
                    )

              ],
            ),
          )
        ],
      ),
    );
  }
}