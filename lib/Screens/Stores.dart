import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:helpinghand/Services/httpcall.dart';
import 'package:url_launcher/url_launcher.dart';

class Store extends StatefulWidget {
  final String district;

  const Store({Key key, this.district}) : super(key: key);
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {

  List stores=[];
  bool isLoading= false;
  @override
  void initState() {
    super.initState();
    fetchStores();
  }

  fetchStores()async{
    setState(() {
      isLoading = true;
    });
    dynamic resultant = await HttpService().getStores(widget.district);
    print(resultant);
    setState(() {
      stores = resultant;
      isLoading = false;
    });
  }

  filterStore(param)async{
    setState(() {
      isLoading = true;
    });
    print('Executing filter store');
    dynamic resultant = await HttpService().getStoreByFilter(widget.district, param);
    setState(() {
      stores = resultant;
      isLoading=false;
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
           padding: EdgeInsets.fromLTRB(0, height*0.05, 0.0, 0.0),
           child: Row(
             children: [
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
                              filterStore('Grocery');
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.medical_services_outlined,color: Colors.purple,),
                            title: new Text('Medicine Stores',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              filterStore('Medicine');
                              Navigator.pop(context);
                            },
                          ),

                          ListTile(
                            leading: new Icon(Icons.set_meal_outlined,color: Colors.purple,),
                            title: new Text('Meat & Fish',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              filterStore('Meat');
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.ac_unit_outlined,color: Colors.purple,),
                            title: new Text('Milk Stores',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              filterStore('Milk');
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.cake_outlined,color: Colors.purple,),
                            title: new Text('Cake Stores',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              filterStore('Cake');
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.electrical_services_outlined,color: Colors.purple,),
                            title: new Text('Electrical Services',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              filterStore('Electrical');
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.plumbing_outlined,color: Colors.purple,),
                            title: new Text('Plumbing Services',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              filterStore('Plumbing');
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.change_history,color: Colors.purple,),
                            title: new Text('Other Services',style:TextStyle(color:Colors.purple,fontSize: 18.0,fontFamily: 'Montserrat',fontWeight: FontWeight.w500),),
                            onTap: () {
                              filterStore('Others');
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
           padding: EdgeInsets.fromLTRB(width*0.1,height*0.11, 0.0, 0.0),
           child:Row(
             children: [
               Text(
                 widget.district,
                 style: TextStyle(
                   fontSize: height*0.04,
                   fontFamily: 'Montserrat',
                   fontWeight: FontWeight.w500
                 ),
               )
               ],
           )
         ),
         isLoading ? SpinKitSquareCircle(color: Colors.green, size: 50.0): 
         
         stores == null ? Container(
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
           )):
         Container(
           margin:EdgeInsets.only(top:100),
           child:ListView.builder(
             shrinkWrap: true,
             itemCount: stores.length,
             itemBuilder: (context,index){
             return CardWidget(
               nameOne: stores[index]["store_name"],
               location:stores[index]["store_location"],
               time:stores[index]["operation_time"], 
              //  homedelivery: stores[index]["homedelivery"],
              homedelivery: true,
               pickup:stores[index]["pickup"],
               area:stores[index]["store_area"],
               type:stores[index]["type"],
               number:stores[index]["contact_number"],
               verified:true ,);
           })
         )
       ],
     )
    );
  }
}


class CardWidget extends StatelessWidget {
  var nameOne;
  var location;
  var time;
  bool homedelivery;
  bool pickup;
  var area;
  var type;
  var number;
  bool verified;



  CardWidget({
    Key key,
    this.nameOne,
    this.location,
    this.time,
    this.homedelivery,
    this.pickup,
    this.area,
    this.type,
    this.number,
    this.verified,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      width: double.maxFinite,
      child: GestureDetector(
          child: Card(
          elevation: 2,
          child: Container( 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        Text(type,style: TextStyle(fontWeight: FontWeight.w600,fontSize: height*0.027,fontFamily:'Montserrat',color:Colors.blueGrey),),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                nameOne,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: height*0.04,
                                  fontFamily:'Montserrat'
                                  ),
                                ),
                              ),
                            !verified ?Icon(Icons.warning_rounded ,color: Colors.yellow[800],):Icon(Icons.verified_rounded,color:Colors.green[700])
                          ],
                        ),
                        Text("Purunagarh,Deogarh,Odisha",style: TextStyle(fontWeight: FontWeight.w600,fontSize: height*0.022,fontFamily:'Montserrat',color:Colors.orange[800])),
                        Row(
                          children: [
                            Text("Timing : ",style: TextStyle(fontWeight: FontWeight.w600,fontSize: height*0.022,fontFamily:'Montserrat',color:Colors.green[800])),
                            Text("Opens at 7.00 am",style: TextStyle(fontWeight: FontWeight.w600,fontSize: height*0.022,fontFamily:'Montserrat',color:Colors.blue[800]))
                          ],
                        ),
                      Row(
                        children: [
                          homedelivery? Text('Home Delivery' ,style: TextStyle(fontWeight: FontWeight.w700,fontSize: height*0.022,fontFamily:'Montserrat',color:Colors.green[700])):Text(''),
                          SizedBox(width: 10,),
                          homedelivery? Text('Pickup',style: TextStyle(fontWeight: FontWeight.w700,fontSize: height*0.022,fontFamily:'Montserrat',color:Colors.green[700])):Text(''),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width:width*0.7,),
                          IconButton(icon: Icon(Icons.phone,size: height*0.05,color: Colors.blue,), onPressed: ()=>{launch("tel:$number")},)
                        ],
                      )
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

