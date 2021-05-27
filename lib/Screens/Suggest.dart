import 'package:flutter/material.dart';
import 'package:helpinghand/Screens/Home.dart';
import 'package:helpinghand/Services/httpcall.dart';

class Suggest extends StatefulWidget {
  
  @override
  _SuggestState createState() => _SuggestState();
}

class _SuggestState extends State<Suggest> {

  String name = "";
  String email = "";
  String suggestion= "";
  bool isSubmitting = false;


  addSuggestion()async{
      setState(() {
        isSubmitting = true;
      });
      Map<String,dynamic> requestData = {
      "name":name,
      "email":email,
      "suggestion":suggestion
    };
    HttpService().addSuggestions(requestData);
     showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Success",style: TextStyle(color:Colors.green),),
            content: new Text("Suggestion Received",style: TextStyle(color:Colors.green[800],fontSize: 25.0),),
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
                Text('Suggest',style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: height*0.05,
                  fontWeight: FontWeight.w300
                )),
                Text('us .',style: TextStyle(
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
               TextField(
                    decoration: InputDecoration(
                        labelText: 'Your Name',
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
                                this.name = value;
                              });
                            },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Your email',
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
                                this.email = value;
                              });
                            },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                   TextFormField(
                minLines: 6,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                    decoration: InputDecoration(
                        labelText: 'Suggestion',
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
                                this.suggestion = value;
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
                          onTap: addSuggestion,
                          child: Center(
                            child: Text(
                              'Suggest',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ):Center(
                            child: Text(
                              'Suggesting...',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                      )),
              ]
              )
          )
        ],

      )
    );
  }
}