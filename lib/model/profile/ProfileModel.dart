class ProfileModel {
  ProfileModel({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.username, 
      this.email, 
      this.phone, 
      this.role, 
      this.blocked, 
      this.refreshToken, 
      this.referralCode, 
      this.user,});

  ProfileModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    role = json['role'];
    blocked = json['blocked'];
    refreshToken = json['refreshToken'];
    referralCode = json['referralCode'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? username;
  String? email;
  String? phone;
  int? role;
  bool? blocked;
  dynamic refreshToken;
  String? referralCode;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['username'] = username;
    map['email'] = email;
    map['phone'] = phone;
    map['role'] = role;
    map['blocked'] = blocked;
    map['refreshToken'] = refreshToken;
    map['referralCode'] = referralCode;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.name, 
      this.phone, 
      this.email, 
      this.authId, 
      this.referalCode, 
      this.addresses, 
      this.cart, 
      this.orders, 
      this.profilePic, 
      this.referals, 
      this.referredBy,});

  User.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    authId = json['authId'];
    referalCode = json['referalCode'];
    if (json['addresses'] != null) {
      addresses = [];
      json['addresses'].forEach((v) {
        addresses?.add(Addresses.fromJson(v));
      });
    }
    cart = json['Cart'] != null ? Cart.fromJson(json['Cart']) : null;
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
    profilePic = json['profile_pic'];
    // if (json['Referals'] != null) {
    //   referals = [];
    //   json['Referals'].forEach((v) {
    //     referals?.add(String.fromJson(v));
    //   });
    // }
    referredBy = json['ReferredBy'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? name;
  String? phone;
  String? email;
  String? authId;
  dynamic referalCode;
  List<Addresses>? addresses;
  Cart? cart;
  List<Orders>? orders;
  dynamic profilePic;
  List<dynamic>? referals;
  dynamic referredBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['authId'] = authId;
    map['referalCode'] = referalCode;
    if (addresses != null) {
      map['addresses'] = addresses?.map((v) => v.toJson()).toList();
    }
    if (cart != null) {
      map['Cart'] = cart?.toJson();
    }
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    map['profile_pic'] = profilePic;
    if (referals != null) {
      map['Referals'] = referals?.map((v) => v.toJson()).toList();
    }
    map['ReferredBy'] = referredBy;
    return map;
  }

}

class Orders {
  Orders({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.totalAmount, 
      this.customerMobNo, 
      this.custId, 
      this.status,});

  Orders.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    totalAmount = json['totalAmount'];
    customerMobNo = json['customerMobNo'];
    custId = json['custId'];
    status = json['status'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? totalAmount;
  dynamic customerMobNo;
  String? custId;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['totalAmount'] = totalAmount;
    map['customerMobNo'] = customerMobNo;
    map['custId'] = custId;
    map['status'] = status;
    return map;
  }

}

class Cart {
  Cart({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.totalPrice, 
      this.userId,});

  Cart.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    totalPrice = json['totalPrice'];
    userId = json['userId'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? totalPrice;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['totalPrice'] = totalPrice;
    map['userId'] = userId;
    return map;
  }

}

class Addresses {
  Addresses({
      this.id, 
      this.address, 
      this.createdAt, 
      this.updatedAt, 
      this.userId, 
      this.shopId,});

  Addresses.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['user_id'];
    shopId = json['shopId'];
  }
  String? id;
  String? address;
  String? createdAt;
  String? updatedAt;
  String? userId;
  dynamic shopId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['user_id'] = userId;
    map['shopId'] = shopId;
    return map;
  }

}