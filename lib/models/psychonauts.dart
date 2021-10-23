// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

// import 'package:william_serna_4_2021_2_p1/models/psipowers.dart';

class Psychonauts {
  String gender = '';
  String img = '';
  String sId = '';
  String name = '';
  int iV = 0;

  Psychonauts(
      {required this.gender,
      required this.img,
      required this.sId,
      required this.name,
      required this.iV});

  Psychonauts.fromJson(Map<String, dynamic> json) {
    gender = json['gender'];
    img = json['img'];
    sId = json['_id'];
    name = json['name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gender'] = this.gender;
    data['img'] = this.img;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['__v'] = this.iV;
    return data;
  }
}
