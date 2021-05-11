import 'package:flutter/material.dart';
import 'package:helpinghand/Screens/Addinformation.dart';
import 'package:helpinghand/Screens/BrowseHelps.dart';
import 'package:helpinghand/Screens/ChooseState.dart';
import 'package:helpinghand/Screens/Requesthelps.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
            child: Row(
              children: [
              Text(
              "Helping",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(width: 10,),
            Text(
              "hand",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color:Colors.green
              ),
            ),
              ],
            )
          ),
          CardWidget(nameOne: "Grocery",nametwo: "Essentials",action:States()),
          CardWidget(nameOne: "Help",nametwo: "Someone",action:BrowseHelps()),
          CardWidget(nameOne: "Request",nametwo: "Help",action:RequestHelp()),
          CardWidget(nameOne: "Add", nametwo: "Information",action:Addinformation()),
          Text('Made with 🧡 By Biswas')
        ],
      ),
    );  
  }
}

class CardWidget extends StatelessWidget {
  var nameOne;
  var nametwo;
  var action;

  CardWidget({
    Key key,
    this.nameOne,
    this.nametwo,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 150,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) => action))},
          child: Card(
          elevation: 6,
          child: Container( 
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 35,left: 20),
                  child:Center(
                    child: Row(
                      children: [
                        Text(nameOne,style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        Text(nametwo,style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold,color: Colors.green),)
                      ],
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
