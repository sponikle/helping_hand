import 'package:flutter/material.dart';

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
       double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String firstpara = "Building 'Helping Hand' was not easy , our only goal is to help people . But cloud services are not cheap these days . We need your support to help you uninterruptibly .\n If you appreciate our hard work ,Cheers mate buy us a coffee ☕. Pay to the UPI below to support us.";
    String upi = "biswas.thependev@okhdfcbank";
    String biswas = "The culprit behind the bugs in codes . Single handedly able to become the culprit, victim and investigator behind the screens (Developer & Debugger). Loves to cook more than code . \n Coffee with code is the best thing to do in life for him . Software Engineer & Cyber Security Consultant by profession , Poet by passion.";
    String ankita = "Made the call about the idea of helping people in pandemic,";
        return Scaffold(
          body: Stack(
            children: <Widget>[
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
               SingleChildScrollView(
                child: Column(
                   children: [
                     Container(
                        padding: EdgeInsets.fromLTRB(width*0.01, height*0.2, 0.0, 0.0),
                       child: Column(
                         children: [
                           Text("Support Us",style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: height*0.05,
                            fontWeight: FontWeight.w600
                          )),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(firstpara,style:TextStyle(color:Colors.black,fontSize: height*0.03,fontFamily: 'Montserrat',fontWeight:FontWeight.w400,fontStyle: FontStyle.normal),),
                          ),
                          Container(
                              margin: EdgeInsets.fromLTRB(width*0.01, height*0.07, 0.0, 0.0),
                              height: height*0.1,
                              width: width*0.97,
                            decoration: BoxDecoration(
                            border: Border.all(width: 2.0,color:Colors.blueGrey[400]),
                        borderRadius: BorderRadius.all(Radius.elliptical(20, 20))
                            ),
                            child: Center(child: Text(upi,style:TextStyle(color:Colors.black,fontSize: height*0.03,fontFamily: 'Montserrat',fontWeight:FontWeight.w400,fontStyle: FontStyle.normal),)),
                          ),
                         Container(
                        margin: EdgeInsets.fromLTRB(width*0.01, height*0.1, 0.0, 0.0),
                           child: Text("Meet Us",style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: height*0.05,
                              fontWeight: FontWeight.w600
                            )),
                         ),
    
                         Container(
                        margin: EdgeInsets.fromLTRB(width*0.01, height*0.1, 0.0, 0.0),
                           child: Text("Biswas Sampad",style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: height*0.04,
                              fontWeight: FontWeight.w600
                            )),
                         ),
                          Container(
                        margin: EdgeInsets.fromLTRB(width*0.01, height*0.01, 0.0, 0.0),
                           child: Text(biswas,style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: height*0.03,
                          fontWeight: FontWeight.w400
                        )),
                     ),

                      Container(
                        margin: EdgeInsets.fromLTRB(width*0.01, height*0.1, 0.0, 0.0),
                           child: Text("Ankita Pati",style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: height*0.04,
                              fontWeight: FontWeight.w600
                            )),
                         ),
                          Container(
                        margin: EdgeInsets.fromLTRB(width*0.01, height*0.01, 0.0, 0.0),
                           child: Text(ankita,style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: height*0.03,
                          fontWeight: FontWeight.w400
                        )),
                     ),
                     SizedBox(height: height*0.1,)
                     ],
                   ),
                 ),
               ],
             ),
           ),
          
        ],
      ),
    );
  }
}