import 'package:firebase_database/firebase_database.dart';


class User
{
  int? id;
  String? firstname;
  String? lastname;
  String? sex;
  String? address;
  String? areaname;
  String? contact;
  String? pincode;

  userMap(){
    var mapping=<String,dynamic>{};
    mapping['id']=id;
    mapping['firstname']=firstname!;
    mapping['lastname']=lastname!;
    mapping['sex']=sex!;
    mapping['address']=address!;
    mapping['areaname']=areaname!;
    mapping['contact']=contact!;
    mapping['pincode']=pincode!;
    return mapping;

  }

}
