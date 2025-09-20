import 'package:e_commerce_design1/screens/note/data/note_model.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  NoteItem({super.key, this.onDismissed, required this.note});
  void Function(DismissDirection)? onDismissed;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: UniqueKey(),
      onDismissed: onDismissed,
      child: Container(
        width: double.infinity,

        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text('${note.title}\n${note.content}\n${note.date}'),
      ),
    );
    ;
  }
}
