import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:helpinghand/Screens/Stores.dart';
import 'package:helpinghand/Services/httpcall.dart';

class Grocery extends StatefulWidget {
  final String state;
  
   Grocery({
    Key key,
    this.state,
  }) : super(key: key);
  
  @override
  _GroceryState createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {


  List districts = [];

  @override
  void initState() {
    super.initState();
    fetchDistricList();
  }

  fetchDistricList() async{
    // dynamic resultant = await DatabaseManager().getDistricts(widget.state);

    // if (resultant == null){
    //   print("Unable to retrieve the data");
    // }else{
    //   print(resultant);
    //   setState(() {
        
    //   districts = resultant;
    //   });
    // }

    dynamic resultant = await HttpService().getDictrict(widget.state);
     print(resultant);
      setState(() {
        districts = resultant;
      });
  }

 @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
          body: Stack(
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
                Text('Choose',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w300
                )),
                Text('your district',style: TextStyle(
                fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w500
                ),)
              ],
            ),
          ),
           districts.length ==0 ? SpinKitSquareCircle(color: Colors.green, size: 50.0): Container(
              margin: EdgeInsets.only(top: height*0.25),
              child: ListView.builder(
               shrinkWrap: true,
              itemCount: districts.length,
              itemBuilder: (context,index){
                return CardWidget(nameOne:districts[index]['name']);
              },
              ),
            )
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
    this.nameOne
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   double height = MediaQuery.of(context).size.height;
   Color color = Color(Random().nextInt(0xffCFF1)).withAlpha(0xFF);
    return Container(
      height: height*0.1,
      margin: EdgeInsets.only(top: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
         boxShadow:[ 
               BoxShadow(
                  color: color.withOpacity(0.5), //color of shadow
                  spreadRadius: 1, //spread radius
                  blurRadius: 1, // blur radius
                  offset: Offset(0, 0), // changes position of shadow
               ),
              ],
      ),
      child: GestureDetector(
        onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) => Store(district:nameOne,)))},
          child: Card(
          elevation: 1,
          child: Container( 
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 20),
                  child:Center(
                    child: Row(
                      children: [
                        Text(nameOne,style: TextStyle(fontSize: height*0.03,fontFamily: 'Montserrat',color: color),),
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
