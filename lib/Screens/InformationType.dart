import 'package:flutter/material.dart';
import 'package:helpinghand/Screens/AddServices.dart';
import 'package:helpinghand/Screens/Addinformation.dart';

class InformationCenter extends StatelessWidget {
  const InformationCenter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
  
    return Scaffold(
      body:Stack(
        children: [
           Container(
            padding: EdgeInsets.fromLTRB(width*0.01, height*0.04, 0.0, 0.0),
             child: Row(
               children: <Widget>[
                 IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: ()=>{Navigator.pop(context)}),
                 SizedBox(width:width*0.6),
                TextButton(onPressed: ()=>{}, child:Text("Report",style:TextStyle(color:Colors.black,fontFamily: 'Montserrat',fontWeight:FontWeight.w400),))
               ],
             ),
           ),
           Container(
            padding: EdgeInsets.fromLTRB(width*0.05, height*0.15, 0.0, 0.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('You want',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w300
                )),
                Text('to add',style: TextStyle(
                fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(width*0.01, height*0.35, 0.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AddService()));},
                    child: Container(
                      height: height*0.2,
                      width:width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                        color: Color(0xFFCFF1E3)
                        ),
                      child: Icon(Icons.food_bank,size:50,color: Colors.green[900],),
                    ),
                  ),
                ),
                SizedBox(height:10),
                Text('SERVICES',style:TextStyle(color:Colors.grey,fontSize:height*0.02,fontFamily: 'Montserrat',fontWeight:FontWeight.w600)),
                SizedBox(height:20),
                Center(
                  child: GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Addinformation()));},
                    child: Container(
                        height: height*0.2,
                      width:width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                        color:Color(0xFFFFF5DD)
                        ),
                      child:Icon(Icons.store,size:50,color: Colors.grey,),                  
                    ),
                  ),
                ),
                 SizedBox(height:10),
                Text('STORES',style:TextStyle(color:Colors.grey,fontSize:height*0.02,fontFamily: 'Montserrat',fontWeight:FontWeight.w600)),
              ],
            ),
          )
        ],
      )
    );
  }
}