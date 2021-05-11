import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helpinghand/Screens/BrowseHelps.dart';

class RequestHelp extends StatefulWidget {

  @override
  _RequestHelpState createState() => _RequestHelpState();
}

class _RequestHelpState extends State<RequestHelp> {
      String _requestType = "Medicines";
      List requestType =["Blood","Oxygen Tank","Medicines","Plasma","Consultation","Food","Job","Transportation","Shelter","NGO Drive","Feed The Animals"];  
      String _priority = "High";
      List priority = ["High","Medium","Low"];
      String name="";
      String number="";
      String address="";
      String state ="";
      String district ="";
      String description ="";

  request(){
    Map<String,dynamic> requestData = {
      "requestType":_requestType,
      "_priority":_priority,
      "name":name,
      "number":number,
      "address":address,
      "state":state,
      "district":district,
      "description":description
    };

    CollectionReference collectionReference = FirebaseFirestore.instance.collection("helpRequests");
    collectionReference.add(requestData);
   showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: new Text("Success",style: TextStyle(color:Colors.green),),
      content: new Text("Request Received",style: TextStyle(color:Colors.green[800],fontSize: 25.0),),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseHelps()));
          },
        ),
      ],
    );
  },
);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       children: [
           Container(
            padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
            child: Row(
              children: [
              Text(
              "Request",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(width: 10,),
            Text(
              "Help",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color:Colors.green
              ),
            ),
              ],
            )
          ),
         Container(
           padding: EdgeInsets.fromLTRB(15.0, 170.0, 0.0, 0.0),

            child:ListView(
              children: [
              DropdownButton(
                value: _requestType,
                isExpanded: true,
                items:requestType.map((e){
                  return DropdownMenuItem(child: Text(e,style: TextStyle(color: Colors.green),), value:e ,);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    this._requestType = value;
                  });
                },
                hint: Text(
                  "Request Type",
                ),
              ),
              SizedBox(
                height: 10,
              ),
               TextField(
                    decoration: InputDecoration(
                        labelText: 'Your Name',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                            onChanged: (value){
                              setState(() {
                                this.name = value;
                              });
                            },
                  ),
              SizedBox(
                height: 10,
              ),
                 TextField(
                   keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'Your Number',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                            onChanged: (value){
                              setState(() {
                                this.number = value;
                              });
                            },
                  ),

              SizedBox(
                height: 10,
              ),
                   TextField(
                    decoration: InputDecoration(
                        labelText: 'Your Address',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                            onChanged: (value){
                              setState(() {
                                this.address = value;
                              });
                            },
                  ),

              SizedBox(
                height: 10,
              ),
                   TextField(
                    decoration: InputDecoration(
                        labelText: 'State',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                            onChanged: (value){
                              setState(() {
                                this.state = value;
                              });
                            },
                  ),

              SizedBox(
                height: 10,
              ),
                   TextField(
                    decoration: InputDecoration(
                        labelText: 'District',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                            onChanged: (value){
                              setState(() {
                                this.district = value;
                              });
                            },
                  ),

              SizedBox(
                height: 10,
              ),
                  DropdownButton(
                    value: _priority,
                    isExpanded: true,
                    items:priority.map((e){
                      return DropdownMenuItem(child: Text(e,style: TextStyle(color: Colors.green),), value:e ,);
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        this._priority = value;
                      });
                    },
                    hint: Text(
                      "Request Type",
                    ),
              ),

              SizedBox(
                height: 10,
              ),
              TextFormField(
                minLines: 6,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                            onChanged:(value){
                              setState(() {
                                this.description = value;
                              });
                            },
                  ),

              SizedBox(
                height: 40,
              ),
                Container(
                      height: 60.0,
                      margin: EdgeInsets.only(bottom: 30),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.greenAccent,
                        color: Colors.green,
                        elevation: 5.0,
                        child: GestureDetector(
                          onTap: request,
                          child: Center(
                            child: Text(
                              'Request',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
              ],
            )
         )
       ],
      )
    );
  }
}
