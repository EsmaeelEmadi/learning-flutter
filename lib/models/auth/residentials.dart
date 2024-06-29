class Date {
  int day;
  int hour;
  int minute;
  int month;
  int second;
  int year;

  Date({
    required this.day,
    required this.hour,
    required this.minute,
    required this.month,
    required this.second,
    required this.year,
  });
}

class Residential {
  int id;
  String address;
  int numberOfRoom;
  double rentPrice;
  bool hasBalcony;
  bool hasParking;
  String dateOfCreation;

  Residential({
    required this.id,
    required this.address,
    required this.numberOfRoom,
    required this.rentPrice,
    required this.hasBalcony,
    required this.hasParking,
    required this.dateOfCreation,
  });

  Residential.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        address = json['address'] as String,
        numberOfRoom = json['numberOfRooms'] as int,
        rentPrice = json['rentPrice'] as double,
        hasBalcony = json['hasBalcony'] as bool,
        hasParking = json['hasParking'] as bool,
        dateOfCreation = json['dateOfCreation'] as String;
}

class ResidentialList {
  List<Residential> items = [];

  ResidentialList();


  // id: 1014,
  // updatedBy: admin, 
  // createdBy: admin, 
  // numberOfRoom: 21, 
  // dateOfCreation: 2025-12-31T20:30:00.000+0000, 
  // hasBalcony: false, 
  // hasParking: true, 
  // rentPrice: 100000.0, 
  // address: nowhere to be found

  ResidentialList.fromJson(Map<String, dynamic> json) {
    for (var element in json['content']) {
      items.add(
        Residential(
          id: element['id'],
          address: element['address'],
          numberOfRoom: element['numberOfRoom'],
          rentPrice: element['rentPrice'],
          hasBalcony: element['hasBalcony'],
          hasParking: element['hasParking'],
          dateOfCreation: element['dateOfCreation'],
        ),
      );
    }
  }
}
