class SigninModel {
  SigninModel({
      this.tokens, 
      this.user,});

  SigninModel.fromJson(dynamic json) {
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  Tokens? tokens;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tokens != null) {
      map['tokens'] = tokens?.toJson();
    }
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
      this.username, 
      this.email, 
      this.phone, 
      this.role, 
      this.blocked, 
      this.refreshToken, 
      this.referralCode,});

  User.fromJson(dynamic json) {
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
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? username;
  String? email;
  dynamic phone;
  int? role;
  bool? blocked;
  dynamic refreshToken;
  String? referralCode;

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
    return map;
  }

}

class Tokens {
  Tokens({
      this.accessToken, 
      this.refreshToken,});

  Tokens.fromJson(dynamic json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
  String? accessToken;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    return map;
  }

}