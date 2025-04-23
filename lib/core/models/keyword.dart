class KeywordModel {
  KeywordModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory KeywordModel.fromJson(Map<String, dynamic> json) {
    return KeywordModel(
      id: json['id'] ,
      name: json['name'],
    );
  }
}