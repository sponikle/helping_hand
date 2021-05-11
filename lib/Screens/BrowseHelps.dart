import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:helpinghand/Services/DatabaseManager.dart';

class BrowseHelps extends StatefulWidget {
  @override
  _BrowseHelpsState createState() => _BrowseHelpsState();
}

class _BrowseHelpsState extends State<BrowseHelps> {

  List helps =[];
  @override
  void initState() {
    super.initState();
    fetchHelps();
  }

  fetchHelps()async{
    dynamic resultant = await DatabaseManager().getHelps();
      if(resultant == null){
      print("Unable to get helps");
    }else{
      print(resultant);
      setState(() {
        helps = resultant;
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
                "Help",
                 style: TextStyle(
                   fontSize: 30.0,
                   fontWeight:FontWeight.bold,
                 ),
               ),
               SizedBox(width: 7,),
               Text(
                "Requests",
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
           margin:EdgeInsets.only(top:130),
           child:ListView.builder(
             shrinkWrap: true,
             itemCount: helps.length,
             itemBuilder: (context,index){
             return CardWidget(
               priority: helps[index]["_priority"],
               address:helps[index]["address"],
               description:helps[index]["description"], 
               district: helps[index]["district"],
               name:helps[index]["name"],
               reuqestType:helps[index]["requestType"],
               state:helps[index]["state"],
               number:helps[index]["number"] ,);
           })
         )
       ],
     )
    );
  }
}


class CardWidget extends StatelessWidget {
  var priority = "";
  var address = "";
  var description = "";
  var district = "";
  var name= "";
  var number = "";
  var reuqestType = "";
  var state ="";
  
  
  CardWidget({
    Key key,
     this.priority,
     this.address,
     this.description,
     this.district,
     this.name,
    this.number,
    this.reuqestType,
    this.state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: double.maxFinite,
      child: GestureDetector(
          child: Card(
          elevation: 6,
          child: Container( 
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 20,bottom: 20,right:20),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green[700]),),
                       Text(reuqestType,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                        Text(address,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.green[400]),),
                         Row(
                        children: [
                           Text(district,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                           Text(state,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                        ],
                      ),
                      Row(
                        children: [
                           Text('Priority :',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                           Text(priority,style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.green[900]),),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Column(
                        children: [
                          Text(description,style: TextStyle(fontSize: 16.0,),)
                        ],
                      ),
                      SizedBox(height: 7.0,),
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
                      ),
                      
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
