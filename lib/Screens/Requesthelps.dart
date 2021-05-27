import 'package:flutter/material.dart';
import 'package:helpinghand/Screens/MyHelps.dart';
import 'package:helpinghand/Services/httpcall.dart';

class RequestHelp extends StatefulWidget {

  @override
  _RequestHelpState createState() => _RequestHelpState();
}

class _RequestHelpState extends State<RequestHelp> {
      String _requestType = "Medicines";
      List requestType =["Blood","Oxygen","Medicines","Plasma","Consultation","Food","Job","Transport","Shelter","NGO Drive"];  
      String _priority = "High";
      List priority = ["High","Medium","Low"];
      String name="";
      String number="";
      String address="";
      String state ="";
      String district ="";
      String description ="";
      bool isSubmitting= false;

  request(){
    setState(() {
      isSubmitting = true;
    });
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

   var token = HttpService().requesthelp(requestData);
   if(token != null){
     print(token);
     
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHelps()));
                },
              ),
            ],
          );
        },
      );
      setState(() {
        isSubmitting = false;
      });
   }
   
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
                 SizedBox(width:width*0.5),
                TextButton(onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHelps()))
                }, child:Text("Your requests".toUpperCase(),style:TextStyle(color:Colors.black,fontFamily: 'Montserrat',fontWeight:FontWeight.w400),))
               ],
             ),
           ),
           Container(
            padding: EdgeInsets.fromLTRB(width*0.05, height*0.15, 0.0, 0.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Ask for',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w300
                )),
                Text('Help .',style: TextStyle(
                fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w500
                ),)
              ],
            )
          ),
         Container(
           margin: EdgeInsets.fromLTRB(5, height*0.3, 0.0, 0.0),

            child:ListView(
              children: [
                Text('Help Type :',
                style: TextStyle(
                  color: Colors.purple,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  )
                  ),
              DropdownButton(
                value: _requestType,
                isExpanded: true,
                items:requestType.map((e){
                  return DropdownMenuItem(child: Text(e,style: TextStyle(color: Colors.blue[600],fontFamily: 'Montserrat'),), value:e ,);
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
                            color: Colors.purple),
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
                            color: Colors.purple),
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
                            color: Colors.purple),
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
                            color: Colors.purple),
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
                            color: Colors.purple),
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
               Text('Priority:',
                style: TextStyle(
                  color: Colors.purple,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  )
                  ),
                  DropdownButton(
                    value: _priority,
                    isExpanded: true,
                    items:priority.map((e){
                      return DropdownMenuItem(child: Text(e,style: TextStyle(color: Colors.blue[600],fontFamily: 'Montserrat'),), value:e ,);
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
                            color: Colors.purple),
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
                      width: width*0.9,
                      margin: EdgeInsets.only(bottom: 30),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.purpleAccent,
                        color: Colors.purple[600],
                        elevation: 5.0,
                        child: !isSubmitting ? GestureDetector(
                          onTap: request,
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
         )
       ],
      )
    );
  }
}
