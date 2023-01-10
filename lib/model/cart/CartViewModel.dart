class CartViewModel {
  CartViewModel({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.totalPrice, 
      this.userId, 
      this.cartProducts,});

  CartViewModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    totalPrice = json['totalPrice'];
    userId = json['userId'];
    if (json['CartProducts'] != null) {
      cartProducts = [];
      json['CartProducts'].forEach((v) {
        cartProducts?.add(CartProducts.fromJson(v));
      });
    }
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? totalPrice;
  String? userId;
  List<CartProducts>? cartProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['totalPrice'] = totalPrice;
    map['userId'] = userId;
    if (cartProducts != null) {
      map['CartProducts'] = cartProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CartProducts {
  CartProducts({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.productsId, 
      this.cartId, 
      this.price, 
      this.quantity, 
      this.product,});

  CartProducts.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productsId = json['productsId'];
    cartId = json['cartId'];
    price = json['price'];
    quantity = json['quantity'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? productsId;
  String? cartId;
  String? price;
  int? quantity;
  Product? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['productsId'] = productsId;
    map['cartId'] = cartId;
    map['price'] = price;
    map['quantity'] = quantity;
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
      this.images, 
      this.dicountAmount, 
      this.discPercent,});

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
    dicountAmount = json['dicountAmount'];
    discPercent = json['discPercent'];
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
  String? dicountAmount;
  String? discPercent;

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
    map['dicountAmount'] = dicountAmount;
    map['discPercent'] = discPercent;
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