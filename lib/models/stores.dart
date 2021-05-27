import 'dart:convert';


class Store {
  String type;
  String store_name;
  String store_location;
  String store_area;
  String store_district;
  String store_link;
  bool pickup;
  String operation_time;
  bool homedelivery;
  String contact_number;
  String store_state;
  bool verified;

  Store(
    this.type,
    this.store_name,
    this.store_location,
    this.store_area,
    this.store_district,
    this.store_link,
    this.pickup,
    this.operation_time,
    this.homedelivery,
    this.contact_number,
    this.store_state,
    this.verified,
  );

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'store_name': store_name,
      'store_location': store_location,
      'store_area': store_area,
      'store_district': store_district,
      'store_link': store_link,
      'pickup': pickup,
      'operation_time': operation_time,
      'homedelivery': homedelivery,
      'contact_number': contact_number,
      'store_state': store_state,
      'verified': verified,
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      map['type'],
      map['store_name'],
      map['store_location'],
      map['store_area'],
      map['store_district'],
      map['store_link'],
      map['pickup'],
      map['operation_time'],
      map['homedelivery'],
      map['contact_number'],
      map['store_state'],
      map['verified'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) => Store.fromMap(json.decode(source));
}
