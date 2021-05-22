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
      final body = jsonEncode(
        <String, String>{'state':state});
      final response = await  http.post(uri,body: body,headers: <String, String>{'Content-Type':'application/json;charset=UTF-8'},);
      if(response.statusCode == 200){
        print('response districts');
        print(jsonDecode(response.body));
        var data = jsonDecode(response.body);
        districts = data['message'];
        return districts;
      }
   }catch(e){
     return null;
   }
  }

  Future getStores(district) async{
    List stores =[];
    print('Fetching data'); 
    try{
      String endpoint = "/getStores";
      var uri = baseurl + endpoint;
      final body = jsonEncode(<String,String>{
        'district':district
      });
      final response = await http.post(uri,body:body,headers: <String,String>{'Content-Type':'application/json;charset=UTF-8'},);
      if(response.statusCode == 200){
        print('response stores');
        print(jsonDecode(response.body));
        var data = jsonDecode(response.body);
        stores = data['stores'];
        print('stores>>>>>>>>>>>>>');
        print(stores);
        return stores;
      }
    }catch(e){
      return null;
    }
  }

  Future getStoreByFilter(district,param) async{
    List stores = [];
    print('Fetching filtered data');
    try{
      String endpoint = "/getStores";
      var uri = baseurl + endpoint ;
      final body = jsonEncode(<String,String>{
        'district':district,
        'param':param
      });
      final response = await http.post(uri,body:body,headers:<String,String>{'Content-Type':'application/json;charset=UTF-8'});

      if(response.statusCode == 200){
        print('response stores filtered');
        print(jsonDecode(response.body));
        var data = jsonDecode(response.body);
        stores = data['stores'];
        print('stores>>>>>>>>>>>>>');
        print(stores);
        return stores;
      }
    }catch(e){
        print(e);
        return null;
    }
  }

  Future getAllServices() async{
    List services = [];
    print("Fetching all services");
    try{
      String endpoint = "/fetchService";
      var uri = baseurl + endpoint ;
      final body = jsonEncode(<String,String>{
        'param':'All'
      });
      final response = await http.post(uri,body:body,headers: <String,String>{'Content-Type':'application/json;charset=UTF-8'});
      if(response.statusCode == 200){
        print('response services');
        print(jsonDecode(response.body));
        var data = jsonDecode(response.body);
        services = data['message'];
        return services;
      }
    }catch(e){
      return null;
    }
  }

  Future addService(obj) async{
    print('Adding a service');
    try{
      String endpoint = "/addInformation";
      var uri = baseurl + endpoint ;
      final body = jsonEncode(<String,dynamic>{
        "infoType":"Service",
        "serviceType":obj['type'],
      "offerredBy":obj['offered_by'],
      "offeredLocation":obj['offered_location'],
      "offeredDistrict":obj['offered_district'],
      "offeredState":obj['offered_state'],
      "offeredLink":obj['offered_link'],
      "offeredArea":obj['offered_area'],
      "chargable":obj['chargable'],
      "serviceTime":obj['operation_time'],
      "contactPerson":obj['contact_person'],
      "contactNumber":obj['contact_number']
      });
      print(body);
      final response = await http.post(uri,body:body,headers:<String,String>{'Content-Type':'application/json;charset=UTF-8'});
      print(jsonDecode(response.body));
      if(response.statusCode == 200){
       print('response service added');
       return jsonDecode(response.body); 
      }
    }catch(e){
      print(e);
      return null;
    }
  }


  Future addStore(obj) async{
    print('Adding a store');
    try{
      String endpoint = '/addInformation';
      var uri = baseurl + endpoint;
      final body = jsonEncode(<String,dynamic>{
        "infoType":"Store",
            "storeName":obj["store_name"],
            "storeType":obj["storetype"],
            "storeNumber":obj["number"],
            "storeArea":obj["area"],
            "storeDistrict":obj["district"],
            "storeLocation":obj["location"],
            "storeTime":obj["time"],
            "homedelivery":obj["homedelivery"],
            "pickup":obj["pickup"],
      });
      print(body);
      final response = await http.post(uri,body:body,headers:<String,String>{'Content-Type':'application/json;charset=UTF-8'});
      print(jsonDecode(response.body));
       print(jsonDecode(response.body));
      if(response.statusCode == 200){
       print('response service added');
       return jsonDecode(response.body); 
      }
    }catch(e){
      print(e);
      return null;
    }
  }
}