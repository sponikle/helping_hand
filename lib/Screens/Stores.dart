import 'package:flutter/material.dart';

import 'package:helpinghand/Services/DatabaseManager.dart';
import 'package:url_launcher/url_launcher.dart';

class Store extends StatefulWidget {
  final String district;

  const Store({Key key, this.district}) : super(key: key);
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {

  List stores=[];
  @override
  void initState() {
    super.initState();
    fetchStores();
  }

  fetchStores()async{
    dynamic resultant = await DatabaseManager().getStores(widget.district);
    if(resultant == null){
      print("Unable to get stores");
    }else{
      print(resultant);
      setState(() {
        stores = resultant;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:Stack(
       children: [
         Container(
           padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
           child:Row(
             children: [
               Text(
                 widget.district,
                 style: TextStyle(
                   fontSize: 30.0,
                   fontWeight:FontWeight.bold,
                   color:Colors.green
                 ),
               )
             ],
           )
         ),
         Container(
           margin:EdgeInsets.only(top:100),
           child:ListView.builder(
             shrinkWrap: true,
             itemCount: stores.length,
             itemBuilder: (context,index){
             return CardWidget(
               nameOne: stores[index]["store_name"],
               location:stores[index]["store_location"],
               time:stores[index]["operation_time"], 
               homedelivery: stores[index]["homedelivery"],
               pickup:stores[index]["pickup"],
               area:stores[index]["store_area"],
               type:stores[index]["type"],
               number:stores[index]["contact_number"] ,);
           })
         )
       ],
     )
    );
  }
}


class CardWidget extends StatelessWidget {
  var nameOne;
  var location;
  var time;
  bool homedelivery;
  bool pickup;
  var area;
  var type;
  var number;

  CardWidget({
    Key key,
    this.nameOne,
    this.location,
    this.time,
    this.homedelivery,
    this.pickup,
    this.area,
    this.type,
    this.number,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 250,
      width: double.maxFinite,
      child: GestureDetector(
          child: Card(
          elevation: 6,
          child: Container( 
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 20),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(type,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                       Text(nameOne,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                        Text(location,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.green[400]),),
                      Row(
                        children: [
                           Text('Time :',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                           Text(time,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                        ],
                      ),
                      SizedBox(height: 7.0,),
                      Row(
                        children: [
                      Text("Home Delivery :",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)),
                      homedelivery? Text("Available",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.green),):Text("Not Available",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.red),),
                        ],
                      ),  
                      Row(
                        children: [
                          Center(
                            child: ElevatedButton(
                              onPressed: ()=>{launch("tel:$number")}, 
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent[400])
                              ),
                              child:Text('Contact')),
                          )
                        ],
                      )
                    ],
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
