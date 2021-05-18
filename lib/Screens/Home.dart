import 'package:flutter/material.dart';

import 'package:helpinghand/Screens/Addinformation.dart';
import 'package:helpinghand/Screens/BrowseHelps.dart';
import 'package:helpinghand/Screens/ChooseState.dart';
import 'package:helpinghand/Screens/Donate.dart';
import 'package:helpinghand/Screens/Requesthelps.dart';
import 'package:helpinghand/Screens/Services.dart';
import 'package:helpinghand/Screens/Suggest.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: Stack(
        children: [
        Container(
        padding: EdgeInsets.fromLTRB(width*0.05, height*0.07, 0.0, 0.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width:width*0.7
              ),
              TextButton(onPressed: ()=>{}, child:Text("About Us",style:TextStyle(color:Colors.black,fontFamily: 'Montserrat',fontWeight:FontWeight.w300),))
            ],
          ),
        ),
          Container(
            padding: EdgeInsets.fromLTRB(width*0.05, height*0.15, 0.0, 0.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Choose',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w300
                )),
                Text('your category',style: TextStyle(
                fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, height*0.3, 0.0, 0.0),
            child: ListView(
              children: [
                          CardWidget(name:"Grocery & Essentials",action:States(),color:0xFFCFF1E3,image:"assets/images/chicken.png",size:EdgeInsets.fromLTRB(width*0.6, 5, 0, 0)),
                          CardWidget(name:"Services Offered",action:Services(),color:0xFFFFF5DD,image: "assets/images/ambulance.png",size:EdgeInsets.fromLTRB(width*0.6, 10, 0, 0)),
                          CardWidget(name:"Help Someone",action:BrowseHelps(),color: 0xFFFFEEDD,image:"assets/images/hand.png",size:EdgeInsets.fromLTRB(width*0.6, 10, 0, 0)),
                          CardWidget(name:"Request Help",action:RequestHelp(),color:0xFFFFF1F4,image:"assets/images/floating-ring.png",size:EdgeInsets.fromLTRB(width*0.7, 10, 0, 0)),
                          CardWidget(name:"Add Information",action:Addinformation(),color:0xFFFEFEDE,image:"assets/images/add.png",size:EdgeInsets.fromLTRB(width*0.7, 10, 0, 0)),
                          CardWidget(name:"Suggest Us",action:Suggest(),color: 0xFFF6F4FF,image:"assets/images/idea.png",size:EdgeInsets.fromLTRB(width*0.6, 10, 0, 0)),
                          CardWidget(name:"Donate Us",action:Donate(),color:0xFFFCFD9F,image:"assets/images/money.png",size:EdgeInsets.fromLTRB(width*0.75, 10, 0, 0)),
                ],
            ),
          )
        ],
      )
    );  
  }
}



class CardWidget extends StatelessWidget {
 var name;
  var action;
  var color;
  var image;
  var size;
  var dimension;

  CardWidget({
    Key key,
    this.size,
    this.name,
    this.action,
    this.color,
    this.image,
    this.dimension
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      height: height*0.18,
      width: width*0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(height*0.1))
      ),
      child: GestureDetector(
        onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) => action))},
          child: Card(
            color: new Color(color),
          margin: EdgeInsets.all(10),
          elevation: 1,
          child:Container(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(width*0.08, height*0.05, 0, 0),
                child: Text(name,style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize:height*0.028,
                  fontWeight: FontWeight.w400
                ),),
              ),
              Container(
                margin: size,
                child: Image.asset(image,height: height*0.22,),
              )
            ],
          )
          )
        ),
      ),
    );
  }
}
