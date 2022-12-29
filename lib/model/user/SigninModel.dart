class SigninModel {
  SigninModel({
      this.tokens, 
      this.userAuth,});

  SigninModel.fromJson(dynamic json) {
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
    userAuth = json['userAuth'] != null ? UserAuth.fromJson(json['userAuth']) : null;
  }
  Tokens? tokens;
  UserAuth? userAuth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tokens != null) {
      map['tokens'] = tokens?.toJson();
    }
    if (userAuth != null) {
      map['userAuth'] = userAuth?.toJson();
    }
    return map;
  }

}

class UserAuth {
  UserAuth({
      this.id, 
      this.email, 
      this.role, 
      this.username, 
      this.blocked, 
      this.user,});

  UserAuth.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    role = json['role'];
    username = json['username'];
    blocked = json['blocked'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? id;
  String? email;
  int? role;
  String? username;
  bool? blocked;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['role'] = role;
    map['username'] = username;
    map['blocked'] = blocked;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.id,});

  User.fromJson(dynamic json) {
    id = json['id'];
  }
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
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