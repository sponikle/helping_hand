import 'package:flutter/material.dart';

import 'package:helpinghand/Screens/Stores.dart';
import 'package:helpinghand/Services/DatabaseManager.dart';

class Grocery extends StatefulWidget {
  final String state;
  
   Grocery({
    Key key,
    this.state,
  }) : super(key: key);
  
  @override
  _GroceryState createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {


  List districts = [];

  @override
  void initState() {
    super.initState();
    fetchDistricList();
  }

  fetchDistricList() async{
    dynamic resultant = await DatabaseManager().getDistricts(widget.state);

    if (resultant == null){
      print("Unable to retrieve the data");
    }else{
      print(resultant);
      setState(() {
        
      districts = resultant;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
        return new Scaffold(
          body: Stack(
            children: [
              Container(
            padding: EdgeInsets.fromLTRB(15.0, 80.0, 0.0, 0.0),
            child: Row(
              children: [
              Text(
              "Select",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(width: 5,),
            Text(
              " District",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color:Colors.green
              ),
            ),
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ListView.builder(
             shrinkWrap: true,
            itemCount: districts.length,
            itemBuilder: (context,index){
              return CardWidget(nameOne:districts[index]['name']);
            },
            ),
          )
            ],
          ),
      );  
  }
}


class CardWidget extends StatelessWidget {
  var nameOne;
  var nametwo;
  var action;

  CardWidget({
    Key key,
    this.nameOne,
    this.nametwo,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 150,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) => Store(district:this.nameOne)))},
          child: Card(
          elevation: 6,
          child: Container( 
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 20),
                  child:Center(
                    child: Row(
                      children: [
                        Text(nameOne,style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold),),
                       ],
                    ),
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
