import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helpinghand/Screens/RequestView.dart';
import 'package:path_provider/path_provider.dart';

import 'package:helpinghand/Services/httpcall.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHelps extends StatefulWidget {

  @override
  _MyHelpsState createState() => _MyHelpsState();
}

class _MyHelpsState extends State<MyHelps> {

  List myrequests=[];
  bool isLoading = false;
  @override
  
  void initState() {
    super.initState();
    getTokenList();
    setState(() {
      isLoading = true;
    });
  }

  getTokenList()async{
    try{
      final directory = await getApplicationDocumentsDirectory();
     final file = await File('${directory.path}/tokens.txt');
      String text = await file.readAsString();
      List list =  await getMyhelpRequests(text);
      print(">>>>>>>>>>>>>>>>");
      print(list);

        setState(() {
        myrequests = list;
        isLoading = false;
      });
      
      print(myrequests);
    }catch(e){
      setState(() {
        myrequests = [];
        isLoading = false;
      });
    }
  }

  getMyhelpRequests(tokens)async{
    var requestList = await HttpService().getMyRequests(tokens);
   if(requestList== null){
     return [];
   }
   return requestList;
  }

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
                 IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.purple,), onPressed: ()=>{Navigator.pop(context)}),
                 SizedBox(width:width*0.6),
                TextButton(onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHelps()))
                }, child:Text("Add New".toUpperCase(),style:TextStyle(color:Colors.purple,fontFamily: 'Montserrat',fontWeight:FontWeight.w600),))
               ],
             ),
           ),
            Container(
            padding: EdgeInsets.fromLTRB(width*0.05, height*0.15, 0.0, 0.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Your',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w300
                )),
                Text('Requests .',style: TextStyle(
                fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w500
                ),)
              ],
            )
          ),
          isLoading ? SpinKitSquareCircle(color: Colors.green, size: 50.0) : myrequests.isEmpty?
          Container(
            child: Center(
              child: Container(
                height: height*0.2,
                width:height*0.2,
                child: Column(
                  children: <Widget>[
                    Icon(Icons.note_outlined,size:height*0.12),
                    Text("Oopppssss!!!",style: TextStyle(fontSize: 25),),
                    Text("No Requests Found")
                  ],
                ),
              ),
            ),
          ):Container(
             margin: EdgeInsets.fromLTRB(0,height*0.3, 0.0, 5),
             child: ListView.builder( shrinkWrap: true,
             itemCount: myrequests.length,
             itemBuilder: (context,index){
             return CardWidget(
               name:myrequests[index]["name"],
               priority: myrequests[index]["_priority"],
               requestType: myrequests[index]["request_type"],
               number:myrequests[index]["number"],
               address: myrequests[index]["address"],
               state:myrequests[index]["state"],
               district:myrequests[index]["district"],
              description: myrequests[index]["description"] ,
              comments :myrequests[index]["comments"].length,
              requestid:myrequests[index]["_id"]
             );
           }),
           )
        ],
      )
    );
  }
}



class CardWidget extends StatelessWidget {
      String requestType;
      String priority;
      String name;
      String number;
      String address;
      String state;
      String district;
      String description;
      int comments;
      String requestid;

  CardWidget({
    Key key,
    this.requestType,
    this.priority,
    this.name,
    this.number,
    this.address,
    this.state,
    this.district,
    this.description,
    this.comments,
    this.requestid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      height: height*0.3,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0,15.0,5.0,10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: TextStyle(fontFamily: "Montserrat",fontSize:height*0.023,fontWeight: FontWeight.w600),),

                Text(address,style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w500,color:Colors.grey[600])),
                Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Priority : ",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w500,fontSize: 16 )),
                    Text(priority,style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w500,fontSize: 16,color:Colors.red)),
                    SizedBox(width: width*0.3,),
                    Text(requestType.toUpperCase(),style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w500,color:Colors.purple))
                  ],
                ),
                SizedBox(
                  height: height*0.05,
                ),
                Container(
                  constraints: BoxConstraints( 
                      minHeight: height*0.06,
                  ),
                  child: SizedBox(
                    height: height*0.06,
                  child: Text(
                    description,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: height*0.02,
                      fontFamily:'Montserrat'
                      ),
                    ),
                  ),
                ),
                Row(
                children: [
                Text('Comments : ',style:TextStyle(
                  fontFamily: "Montserrat",fontSize:height*0.02,fontWeight: FontWeight.w400
                )),
                Text('$comments',style:TextStyle(
                  fontFamily: "Montserrat",fontSize:height*0.02,fontWeight: FontWeight.w400
                )),
                SizedBox(width: width*0.3,),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RequestView(id:requestid)));
                }, child: Text('Details')),
                Container(
                  child: IconButton(icon: Icon(Icons.call,size: height*0.04,color: Colors.purple,), onPressed: (){launch("tel:$number");})
                  )
                ],)
              ],
            ),
          ),
        ),
      );
  }
}
