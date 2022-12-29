class FavoriteModel {
  FavoriteModel({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.userId, 
      this.productsId, 
      this.product,});

  FavoriteModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    productsId = json['productsId'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? productsId;
  Product? product;

  static List<FavoriteModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => FavoriteModel.fromJson(value)).toList();
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['userId'] = userId;
    map['productsId'] = productsId;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

}

class Product {
  Product({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.name, 
      this.price, 
      this.description, 
      this.stock, 
      this.unit, 
      this.subId, 
      this.shopId, 
      this.brandsId, 
      this.status, 
      this.rating, 
      this.discountId, 
      this.images,});

  Product.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    stock = json['stock'];
    unit = json['unit'];
    subId = json['subId'];
    shopId = json['shopId'];
    brandsId = json['brandsId'];
    status = json['status'];
    rating = json['rating'];
    discountId = json['discountId'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? price;
  String? description;
  int? stock;
  String? unit;
  String? subId;
  String? shopId;
  String? brandsId;
  String? status;
  int? rating;
  String? discountId;
  List<Images>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    map['price'] = price;
    map['description'] = description;
    map['stock'] = stock;
    map['unit'] = unit;
    map['subId'] = subId;
    map['shopId'] = shopId;
    map['brandsId'] = brandsId;
    map['status'] = status;
    map['rating'] = rating;
    map['discountId'] = discountId;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Images {
  Images({
      this.url,});

  Images.fromJson(dynamic json) {
    url = json['url'];
  }
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = url;
    return map;
  }

}