class CatogeryModel {
  CatogeryModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.image,
    this.subCategories,
  });

  CatogeryModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    description = json['description'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    if (json['subCategories'] != null) {
      subCategories = [];
      json['subCategories'].forEach((v) {
        subCategories?.add(SubCategories.fromJson(v));
      });
    }
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  Image? image;
  List<SubCategories>? subCategories;

  static List<CatogeryModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => CatogeryModel.fromJson(value)).toList();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    map['description'] = description;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    if (subCategories != null) {
      map['subCategories'] = subCategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class SubCategories {
  SubCategories({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.catId,
    this.image,
  });

  SubCategories.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    description = json['description'];
    catId = json['catId'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? description;
  String? catId;
  Image? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    map['description'] = description;
    map['catId'] = catId;
    if (image != null) {
      map['image'] = image?.toJson();
    }
    return map;
  }
}

class Image {
  Image({
    this.url,
  });

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

class Image1 {
  Image1({
    this.url,
  });

  Image1.fromJson(dynamic json) {
    url = json['url'];
  }
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    return map;
  }
}
