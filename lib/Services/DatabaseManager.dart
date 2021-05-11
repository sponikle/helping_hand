import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager{
  final CollectionReference districtList = FirebaseFirestore.instance.collection('Districts');
  final CollectionReference storeList = FirebaseFirestore.instance.collection('GroceryStores');
  final CollectionReference helpList = FirebaseFirestore.instance.collection('helpRequests');
  final CollectionReference stateList = FirebaseFirestore.instance.collection('States');

  Future getDistricts(state) async{
    List districts=[]; 

    try{      
      await districtList.where('state',isEqualTo: state).get().then((snapshots){
         snapshots.docs.forEach((element) { 

           districts.add(element.data());
           print('Distrcits');
           print(element.data);
         }); 
      });
      return districts;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future getStores(district) async{
    List stores =[];
    try{
      await storeList.where('store_district',isEqualTo: district).get().then((snapshots){
        snapshots.docs.forEach((element) {
          stores.add(element.data());
          print('stores');
        });
      });
      return stores;
    }catch(e){
      return null;
    }
  }

  Future getHelps() async{
    List helps =[];
    try{
      await helpList.get().then((snapshots) {
        snapshots.docs.forEach((element) { 
          helps.add(element.data());
        });
      });
      return helps;
    }catch(e){
      return null;
    }
  }

  Future getStates() async{
    List states =[];
    try{
      await stateList.get().then((snapshots) {
        snapshots.docs.forEach((element) { 
          states.add(element.data());
        });
      });
      return states;
    }catch(e){
      return null;
    }
  }
}