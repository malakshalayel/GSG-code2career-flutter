import 'package:e_commerce_design1/core/custom_text_field.dart';
import 'package:e_commerce_design1/screens/note/data/note_model.dart';
import 'package:e_commerce_design1/screens/note/data/notes_sqlite_db.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  NoteItem({super.key, this.onDismissed, required this.note}) {
    titleCon.text = note.title;
    contentCon.text = note.content;
  }
  void Function(DismissDirection)? onDismissed;
  final NoteModel note;
  TextEditingController titleCon = TextEditingController();
  TextEditingController contentCon = TextEditingController();
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
        child: ListTile(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(controller: titleCon, hint: 'Title'),
                      CustomTextField(
                        controller: contentCon,
                        hint: 'Add You content',
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          NoteModel updatedNote = NoteModel(
                            title: titleCon.text,
                            content: contentCon.text,
                            date: note.date,
                            id: note.id,
                          );
                          await NotesSqliteDb.updateNoteFromDb(updatedNote);
                          Navigator.pop(context);
                        },
                        child: Text('update'),
                      ),
                    ],
                  ),
                );
              },
            );
          },

          title: Text(note.title),
          subtitle: Text(note.content),
          trailing: Text(note.date),
        ),
      ),
    );
    ;
  }
}
