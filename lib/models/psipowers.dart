// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class PsiPowers {
  String description = '';
  String img = '';
  String sId = '';
  String name = '';

  PsiPowers(
      {required this.description,
      required this.img,
      required this.sId,
      required this.name});

  PsiPowers.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    img = json['img'];
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['img'] = this.img;
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
