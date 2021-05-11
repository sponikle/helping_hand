import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:helpinghand/Screens/Home.dart';

class Addinformation extends StatefulWidget {
  @override
  _AddinformationState createState() => _AddinformationState();
}

class _AddinformationState extends State<Addinformation> {

  List storetypes = ["Grocery","Milk","Cake","Meat","Services","Electrical","Plumbing"];
  String storetype = "Grocery";
  String storename="";
  String type="";
  String number ="";
  String area ="";
  String district="";
  String location ="";
  String time ="";
  bool homedelivery = true;
  bool pickup = true;

  submit(){
    Map<String,dynamic> requestData = {
      "store_name":storename,
      "storetype":storetype,
      "number":number,
      "area":area,
      "district":district,
      "location":location,
      "time":time,
      "homedelivery":homedelivery,
      "pickup":pickup
    };
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("addRequests");
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
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
      body:Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
            child: Row(
              children: [
              Text(
              "Add",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(width: 10,),
            Text(
              "Information",
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
            child: ListView(
              children: [
                DropdownButton(
                value: storetype,
                isExpanded: true,
                items:storetypes.map((e){
                  return DropdownMenuItem(child: Text(e,style: TextStyle(color: Colors.green),), value:e ,);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    this.storetype = value;
                  });
                },
                hint: Text(
                  "Store Type",
                ),
              ),
              SizedBox(
                height: 10,
              ),
                TextField(
                    decoration: InputDecoration(
                        labelText: 'Store Name',
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
                                this.storename = value;
                              });
                            },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'Store number',
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
                        labelText: 'Store Area',
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
                                this.area = value;
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
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Location',
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
                                this.location = value;
                              });
                            },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Service Time',
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
                                this.time = value;
                              });
                            },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Homedelivery Available:'),
                    ListTile(
                      leading: Radio(
                        value: true,
                        groupValue: homedelivery,
                        onChanged: (value) {
                          setState(() {
                            homedelivery = value;
                          });
                        },
                      ),
                      title: Text('Yes'),
                    ),
                    ListTile(
                      leading: Radio(
                        value: false,
                        groupValue: homedelivery,
                        onChanged: (value) {
                          setState(() {
                            homedelivery = value;
                          });
                        },
                      ),
                      title: Text('No'),
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
                          onTap: submit,
                          child: Center(
                            child: Text(
                              'Submit',
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
              ],
            ),
          )
        ],
      )
    );
  }
}