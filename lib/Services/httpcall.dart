import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService{
  final String baseurl = "https://anamika.helpinghand.ind.in/v1/";
  
  Future getStates() async{
    List states =[];
    try{
      String endpoint = "/getStates";
      var uri = baseurl + endpoint;

      final response = await http.post(uri,
        headers: <String,String>{'Content-Type':'application/json;charset=UTF-8'},
      );
      if(response.statusCode == 200){
        print('response');
        print(jsonDecode(response.body));
        var data = jsonDecode(response.body);
        states = data['message'];
        return states; 
      }
    }catch(e){
      return null;
    }
  }

  Future getDictrict(state) async{
    List districts = [];
    try{
      String endpoint = "/getDistricts";
      var uri = baseurl + endpoint;
      final body = {'state':'Odisha'};

    }catch(e){

    } 
  }
}