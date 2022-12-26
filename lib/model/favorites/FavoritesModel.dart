class FavoritesModel {
  FavoritesModel({
      this.id, 
      this.createdAt, 
      this.updatedAt, 
      this.userId, 
      this.productsId,});

  FavoritesModel.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    productsId = json['productsId'];
  }
  String? id;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? productsId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['userId'] = userId;
    map['productsId'] = productsId;
    return map;
  }

}