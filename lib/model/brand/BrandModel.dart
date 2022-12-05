class BrandModel {
  BrandModel({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.name, 
      this.image,});
  static List<BrandModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => BrandModel.fromJson(value)).toList();
  }

  BrandModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  Image? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    return map;
  }

}

class Image {
  Image({
      this.url,});

  Image.fromJson(dynamic json) {
    url = json['url'];
  }
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    return map;
  }

}