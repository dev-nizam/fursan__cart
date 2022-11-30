class SignupModel {
  SignupModel({
      this.msg, 
      this.tokens, 
      this.res,});

  SignupModel.fromJson(dynamic json) {
    msg = json['msg'];
    tokens = json['tokens'] != null ? Tokens.fromJson(json['tokens']) : null;
    res = json['res'] != null ? Res.fromJson(json['res']) : null;
  }
  String? msg;
  Tokens? tokens;
  Res? res;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['msg'] = msg;
    if (tokens != null) {
      map['tokens'] = tokens?.toJson();
    }
    if (res != null) {
      map['res'] = res?.toJson();
    }
    return map;
  }

}

class Res {
  Res({
      this.id, 
      this.email, 
      this.role, 
      this.username,});

  Res.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    role = json['role'];
    username = json['username'];
  }
  String? id;
  String? email;
  int? role;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['role'] = role;
    map['username'] = username;
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