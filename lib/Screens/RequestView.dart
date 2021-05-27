import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helpinghand/Services/httpcall.dart';

class RequestView extends StatefulWidget {
  final String id;

  const RequestView({Key key, this.id}) : super(key: key);
  @override
  _RequestViewState createState() => _RequestViewState();
}

class _RequestViewState extends State<RequestView> {
  var name = "";
  var address = "";
  var priority = "";
  var requestType = "";
  var description = "";
  var number ="";
  List<dynamic> comments = [];
  int commentLength = 0;
  var district="";
  var state="";
  bool hasdata =false;
  var helpid = "";
  var commentText="";

  
  @override
  void initState() {
    super.initState();
   getHelp();
  }

  getHelp()async{
     var requestData =await HttpService().getPerticularRequest(widget.id);
     print(requestData);
    setState(() {
      name = requestData["name"];
      address = requestData["address"];
      priority = requestData["_priority"];
      requestType = requestData["request_type"];
      description = requestData["description"];
      number = requestData["number"];
      comments = requestData["comments"];
      district = requestData["district"];
      state = requestData["state"];
      commentLength = requestData["comments"].length;
      helpid = requestData["_id"];
      hasdata = true;
    });
  }

  sendComment()async{
    print('Adding comment');
  

    var op = await HttpService().sendComment(helpid,commentText);
      setState(() {
      comments.add(commentText);
      commentLength = commentLength + 1;
      commentText = '';
    });
    print(comments);
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
   
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(width*0.01, height*0.04, 0.0, 0.0),
             child: Row(
               children: <Widget>[
                 IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.purple,), onPressed: ()=>{Navigator.pop(context)}),
                 SizedBox(width:width*0.3),
                Text("Helping ",style: TextStyle(fontSize:height*0.04,fontWeight: FontWeight.w500),),
                Text("hand .",style: TextStyle(fontSize:height*0.04,color: Colors.green,fontWeight: FontWeight.w500))
               ],
             ),
           ),
           !hasdata ?   SpinKitSquareCircle(color: Colors.green, size: 50.0) :
           Container(
            margin: EdgeInsets.fromLTRB(width*0.01, height*0.2, 10, 0.0),
           child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                                  Row(
                                    children: [
                                      SizedBox(width:width*0.5),
                                  Text(requestType.toUpperCase(),style: TextStyle(fontFamily: "Montserrat",fontSize:height*0.023,fontWeight: FontWeight.w600),),
                                      
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width:width*0.5),
                                  Text(priority.toUpperCase(),style: TextStyle(fontFamily: "Montserrat",fontSize:height*0.023,fontWeight: FontWeight.w600,color:Colors.red),),
                                      
                                    ],
                                  ),
                                SizedBox(height:15,),
                                  Text(name,style: TextStyle(fontFamily: "Montserrat",fontSize:height*0.023,fontWeight: FontWeight.w600),),
                                Text(address,style: TextStyle(fontFamily: "Montserrat",fontSize:height*0.02,fontWeight: FontWeight.w400,color:Colors.grey[900]),),
                                SizedBox(height: 5,),
                                AddressText(district: district, height: height, width: width, state: state),
                                SizedBox(
                                  height: height*0.05,
                                ),
                               HelpDescription(width: width, description: description, height: height),
                               Row(
                                 children: <Widget>[
                               Container(
                                 height: height*0.005,
                                 width: width*0.7,
                                 margin: EdgeInsets.only(top:height*0.03),
                                 decoration: BoxDecoration(
                                   color: Colors.grey[300],
                                    borderRadius: BorderRadius.all(Radius.elliptical(20, 20),),
                                    ),
                               ),
                                   IconButton(
                                     icon: Icon(
                                       Icons.call,
                                      size: height*0.05,
                                      color: Colors.purple,
                                       ), 
                                       onPressed: (){})
                                 ],
                               ),
                               
                              SizedBox(height: height*0.02,),
                              Row(
                                children: [
                                  Text("Comments"),
                                  SizedBox(width:10),
                                  Text("$commentLength")
                                ],
                              ),
                              SizedBox(height: height*0.05,),
                              for ( var i in comments ) CommentText(height:height,width: width, description: i),

                              SizedBox(height: height*0.05,),

                               Row(
                                 children: [
                                   Container(
                                     width: width*0.75,
                                     child: TextFormField(
                                      
                              minLines: 2,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                                        decoration: InputDecoration(
                                            labelText: 'Your Comment',
                                            labelStyle: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.purple),
                                            // hintText: 'EMAIL',
                                            // hintStyle: ,
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(color: Colors.green))),
                                                onChanged:(value){
                                                  this.commentText = value;
                                                },
                                      ),
                                   ),
                                   IconButton(icon: Icon(Icons.send,size: height*0.04,color:Colors.purple), onPressed: sendComment)
                                 ],
                               ),
                              SizedBox(height: height*0.05,),

                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
      )
        ],
      ),
    );
  }
}

class HelpDescription extends StatelessWidget {
  const HelpDescription({
    Key key,
    @required this.width,
    @required this.description,
    @required this.height,
  }) : super(key: key);

  final double width;
  final String description;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: SizedBox(
             width: width*0.9,
           child: Text(
             description,
             maxLines: 200,
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
      ],
    );
  }
}

class AddressText extends StatelessWidget {
  const AddressText({
    Key key,
    @required this.district,
    @required this.height,
    @required this.width,
    @required this.state,
  }) : super(key: key);

  final String district;
  final double height;
  final double width;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
    Text(district,style: TextStyle(fontFamily: "Montserrat",fontSize:height*0.023,fontWeight: FontWeight.w400),),
    SizedBox(width:width*0.03),
    Text(state,style: TextStyle(fontFamily: "Montserrat",fontSize:height*0.023,fontWeight: FontWeight.w400,color:Colors.grey[900]),)
      ],
    );
  }
}

class CommentText extends StatelessWidget {
  const CommentText({
    Key key,
    @required this.width,
    @required this.description,
    @required this.height,
  }) : super(key: key);

  final double width;
  final String description;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
           child: SizedBox(
              width: width*0.9,
            child: Text(
              description,
              maxLines: 200,
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
           Container(
           height: height*0.005,
           width: width*0.7,
           margin: EdgeInsets.only(top:height*0.03),
           decoration: BoxDecoration(
             color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.elliptical(20, 20),),
              ),
         ),
      ],
    );
  }
}
