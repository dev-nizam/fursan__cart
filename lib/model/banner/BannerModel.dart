class BannerModel {
  BannerModel({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.bannerTitle, 
      this.categoryId, 
      this.tagsId, 
      this.subCategoryId, 
      this.banner, 
      this.tag, 
      this.category, 
      this.subCategory,});
  static List<BannerModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => BannerModel.fromJson(value)).toList();
  }
  BannerModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bannerTitle = json['bannerTitle'];
    categoryId = json['categoryId'];
    tagsId = json['tagsId'];
    subCategoryId = json['subCategoryId'];
    if (json['banner'] != null) {
      banner = [];
      json['banner'].forEach((v) {
        banner?.add(Banner.fromJson(v));
      });
    }
    tag = json['tag'] != null ? Tag.fromJson(json['tag']) : null;
    category = json['Category'] != null ? Category.fromJson(json['Category']) : null;
    subCategory = json['subCategory'] != null ? SubCategory.fromJson(json['subCategory']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? bannerTitle;
  String? categoryId;
  String? tagsId;
  String? subCategoryId;
  List<Banner>? banner;
  Tag? tag;
  Category? category;
  SubCategory? subCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['bannerTitle'] = bannerTitle;
    map['categoryId'] = categoryId;
    map['tagsId'] = tagsId;
    map['subCategoryId'] = subCategoryId;
    if (banner != null) {
      map['banner'] = banner?.map((v) => v.toJson()).toList();
    }
    if (tag != null) {
      map['tag'] = tag?.toJson();
    }
    if (category != null) {
      map['Category'] = category?.toJson();
    }
    if (subCategory != null) {
      map['subCategory'] = subCategory?.toJson();
    }
    return map;
  }

}

class SubCategory {
  SubCategory({
      this.id,});

  SubCategory.fromJson(dynamic json) {
    id = json['id'];
  }
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }

}

class Category {
  Category({
      this.id,});

  Category.fromJson(dynamic json) {
    id = json['id'];
  }
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }

}

class Tag {
  Tag({
      this.name,});

  Tag.fromJson(dynamic json) {
    name = json['name'];
  }
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

}

class Banner {
  Banner({
      this.url,});

  Banner.fromJson(dynamic json) {
    url = json['url'];
  }
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    return map;
  }

}