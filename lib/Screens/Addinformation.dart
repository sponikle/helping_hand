import 'package:flutter/material.dart';
import 'package:helpinghand/Screens/InformationType.dart';
import 'package:helpinghand/Services/httpcall.dart';

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
  String state="";
  String time ="";
  bool homedelivery = true;
  bool pickup = true;
  bool isSubmitting= false;

  submit(){
    setState(() {
      isSubmitting = true;
    });
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
    HttpService().addStore(requestData);
    showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: new Text("Success",style: TextStyle(color:Colors.green,fontFamily:'Montserrat'),),
      content: new Text("Request Received",style: TextStyle(color:Colors.green[800],fontSize: 25.0,fontFamily:'Montserrat'),),
      actions: <Widget>[
        new ElevatedButton(
          child: new Text("OK",style:TextStyle(fontFamily:'Montserrat')),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => InformationCenter()));
          },
        ),
      ],
    );
  },
);
setState(() {
  isSubmitting= false;
});
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
                Text('Add new',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w300
                )),
                Text('stores .',style: TextStyle(
                fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w500
                ),)
              ],
            )
          ),
          Container(
           padding: EdgeInsets.fromLTRB(5, height*0.3, 0.0, 0.0),
            child: ListView(
              children: [
                Text('Store Type :',
                style: TextStyle(
                  color: Colors.purple,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  )
                  ),
                DropdownButton(
                value: storetype,
                isExpanded: true,
                items:storetypes.map((e){
                      return DropdownMenuItem(child: Text(e,style: TextStyle(color: Colors.blue[600],fontWeight: FontWeight.bold),), value:e ,);
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
                            color: Colors.purple,),
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
                            color: Colors.purple,),
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
                            color: Colors.purple,),
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
                            color: Colors.purple,),
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
                        labelText: 'State',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,),
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
                            color: Colors.purple,),
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
                            color: Colors.purple,),
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
                    Text('Homedelivery Available:',style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,),),
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
                      title: Text('Yes',style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,),),
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
                      title: Text('No',style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,),),
                    ),
                    SizedBox(
                height: 40,
              ),
                Container(
                      height: 60.0,
                      width: width*0.9,
                      margin: EdgeInsets.only(bottom: 30,left: 15),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.purpleAccent,
                        color: Colors.purple[600],
                        elevation: 5.0,
                        child: !isSubmitting ? GestureDetector(
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
                        ):Center(
                            child: Text(
                              'Processing...',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
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