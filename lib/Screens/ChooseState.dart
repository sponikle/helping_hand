import 'package:flutter/material.dart';
import 'package:helpinghand/Screens/Grocery.dart';
import 'package:helpinghand/Services/DatabaseManager.dart';


class States extends StatefulWidget {
  States({Key key}) : super(key: key);

  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  List states =[];
  
  @override
  void initState() {
    super.initState();
    fetchStates();
  }
  fetchStates()async{
    dynamic resultant = await DatabaseManager().getStates();
     if (resultant == null){
      print("Unable to retrieve the states");
    }else{
      print(resultant);
      setState(() {
        
      states = resultant;
      });
    }
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
                "Select",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(width: 5,),
              Text(
                " State",
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
              itemCount: states.length,
              itemBuilder: (context,index){
                return CardWidget(nameOne:states[index]['name']);
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
    this.nameOne
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      height: 150,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context) => Grocery(state:this.nameOne)))},
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
