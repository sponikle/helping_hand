import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helpinghand/Screens/RequestView.dart';
import 'package:helpinghand/Services/httpcall.dart';
import 'package:url_launcher/url_launcher.dart';


class BrowseHelps extends StatefulWidget {
  @override
  _BrowseHelpsState createState() => _BrowseHelpsState();
}

class _BrowseHelpsState extends State<BrowseHelps> {

  List helps =[];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    fetchHelps();
    
  }

  fetchHelps()async{
    var resultant = await HttpService().fetchHelps();
    print(resultant);
    setState(() {
      helps = resultant;
      isLoading = false;
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
                 IconButton(icon: Icon(Icons.arrow_back_ios_rounded,color: Colors.purple,), onPressed: ()=>{Navigator.pop(context)}),
                 SizedBox(width:width*0.6),
                TextButton(onPressed: ()=>{
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MyHelps()))
                },
                child:Text("Report".toUpperCase(),style:TextStyle(color:Colors.purple,fontFamily: 'Montserrat',fontWeight:FontWeight.w600),))
               ],
             ),
           ),
            Container(
            padding: EdgeInsets.fromLTRB(width*0.05, height*0.15, 0.0, 0.0),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Help',style: TextStyle(
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
          isLoading? SpinKitSquareCircle(color: Colors.green, size: 50.0) : helps.isEmpty?
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
             itemCount: helps.length,
             itemBuilder: (context,index){
             return CardWidget(
               name:helps[index]["name"],
               priority: helps[index]["_priority"],
               requestType: helps[index]["request_type"],
               number:helps[index]["number"],
               address: helps[index]["address"],
               state:helps[index]["state"],
               district:helps[index]["district"],
              description: helps[index]["description"] ,
              comments :helps[index]["comments"].length,
              requestid:helps[index]["_id"]
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
