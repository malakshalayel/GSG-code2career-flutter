import 'dart:convert';

class NoteModel {
  String title;
  String content;
  String date;

  NoteModel({required this.title, required this.content, required this.date});

  String toJson() {
    return json.encode({'title': title, 'content': content, 'date': date});
  }

  NoteModel.fromJson(Map<String, dynamic> json) : title = json['title'] ,date = json['date'] , content = json['content'];
}
