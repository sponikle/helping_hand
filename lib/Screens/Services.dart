import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

import 'package:helpinghand/Services/httpcall.dart';
import 'package:url_launcher/url_launcher.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

  List allServices=[];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchAllServices();
  }

  fetchAllServices() async{
    setState((){
      isLoading = true;
    });
    dynamic resultant = await HttpService().getAllServices();
    print(resultant);
    setState(() {
      allServices = resultant;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
      double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(width*0.01, height*0.04, 0, 0),
            child: Row(
              children: <Widget>[
                 IconButton(icon: Icon(Icons.arrow_back_ios_rounded), onPressed: ()=>{Navigator.pop(context)},color: Colors.purple,),
               SizedBox(width:width*0.7),
              IconButton(icon: Icon(Icons.filter_alt), onPressed: (){
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ListView(
                        children: <Widget>[
                          ListTile(
                            leading: new Icon(Icons.local_grocery_store_outlined,color: Colors.purple,),
                            title: new Text('Grocery Stores',style: TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.medical_services_outlined,color: Colors.purple,),
                            title: new Text('Medicine Stores',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),

                          ListTile(
                            leading: new Icon(Icons.set_meal_outlined,color: Colors.purple,),
                            title: new Text('Meat & Fish',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.ac_unit_outlined,color: Colors.purple,),
                            title: new Text('Milk Stores',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.cake_outlined,color: Colors.purple,),
                            title: new Text('Cake Stores',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.electrical_services_outlined,color: Colors.purple,),
                            title: new Text('Electrical Services',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.plumbing_outlined,color: Colors.purple,),
                            title: new Text('Plumbing Services',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.change_history,color: Colors.purple,),
                            title: new Text('Other Services',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          
                        ],
                      );
                    });
              },color:Colors.purple)
              ],
              ),
          ),
          Container(
           padding: EdgeInsets.fromLTRB(width*0.1,height*0.13, 0.0, 0.0),
           child:Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text(
                 'Services',
                 style: TextStyle(
                   fontSize: height*0.04,
                   fontFamily: 'Montserrat',
                   fontWeight: FontWeight.w500
                 ),
               ),
               Text(
                 'around you',
                 style: TextStyle(
                   fontSize: height*0.04,
                   fontFamily: 'Montserrat',
                   fontWeight: FontWeight.w600
                 ),
               )
               ],
           )
         ),
         isLoading ? SpinKitSquareCircle(color: Colors.green, size: 50.0) : allServices == null ? Container(
           child: Column(
              children: [
                Container(
                  margin:EdgeInsets.fromLTRB(0,height*0.25, 0.0, 0.0),
                  child: Image.asset("assets/images/oops.png")),
                Container(
                  child: Text("Bammm.. No Stores Available !!",style: TextStyle(height: height*0.02,fontFamily: 'Montserrat',color:Colors.orange[900],fontWeight: FontWeight.w800),
                  ),
                )
              ],
           )):Container(
             margin: EdgeInsets.fromLTRB(0,height*0.25, 0.0, 0.0),
             child: ListView.builder( shrinkWrap: true,
             itemCount: allServices.length,
             itemBuilder: (context,index){
             return CardWidget(
               name:allServices[index]['offered_by'],
               type:allServices[index]['type'],
               address:allServices[index]['offered_location'],
               cost : allServices[index]['chargable'],
               time:allServices[index]['operation_time'],
               number:allServices[index]['contact_number'],
               contactperson: allServices[index]['contact_person'],
             );
           }),
           )
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {

  var name;
  var type;
  var address;
  bool cost;
  var time;
  var number;
  var contactperson;
  
  CardWidget({
    Key key,
     this.name,
     this.type,
     this.address,
     this.cost,
     this.time,
     this.number,
     this.contactperson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
      double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.33,
      margin: EdgeInsets.only(top:5),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0,color:Colors.blueGrey[400]),
        borderRadius: BorderRadius.all(Radius.elliptical(20, 20))
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                height: 60,
                width:60,
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF383A7E)
                ),
               child: Icon(Icons.add_moderator,size: height*0.035,color: Colors.white,)
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: new EdgeInsets.only(right: 10.0),
                      child: Text(
                        name,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 23,
                          fontWeight: FontWeight.w600
                          ),
                        )
                      ),
                    Text(type.toUpperCase(),style:TextStyle(fontFamily: 'Montserrat',fontSize: 18,fontWeight: FontWeight.w800,color:Colors.orange))
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700
                ),),
              ],
            )
          ),
           Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(contactperson,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w800
                ),),
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.timer_sharp,size:height*0.04),
                Text(' : ',style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                Text(time,
                style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(width:width*0.09),
                Icon(Icons.money_off_rounded,size:height*0.04),
                Text(' : '),
                !cost ? Text('Free',style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),):Text('Paid',style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(width:width*0.2),
                Container(
                   height: 60,
                width:60,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF383A7E)
                ),
                  child: IconButton(
                    icon: Icon(Icons.call,size: 30,color: Colors.white,),
                    onPressed: (){launch("tel:$number");})
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
