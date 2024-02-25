class DataModel {
  int? id;
  String title;
  int isCompleted;
  String date;
  DataModel({this.id, required this.title, required this.isCompleted, required this.date});

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(id: json['id'], title: json["title"], isCompleted: json["isCompleted"], date: json["date"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "isCompleted": isCompleted,
        "date": date,
      };
}
