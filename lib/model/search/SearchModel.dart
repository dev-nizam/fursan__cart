class SearchModel {
  SearchModel({
    this.id,
    this.name,
    this.url,
  });

  SearchModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }
  String? id;
  String? name;
  String? url;

  static List<SearchModel> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => SearchModel.fromJson(value)).toList();
  }

  Map<String, String> toJson() {
    final map = <String, String>{};
    map['id'] = id!;
    map['name'] = name!;
    map['url'] = url!;
    return map;
  }
}
