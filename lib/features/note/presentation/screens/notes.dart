import 'package:e_commerce_design1/core/custom_text_field.dart';
import 'package:e_commerce_design1/features/note/data/note_model.dart';
import 'package:e_commerce_design1/features/note/presentation/provider/notes_provider.dart';
import 'package:e_commerce_design1/features/note/presentation/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  String noteKey = 'notes';

  TextEditingController titleCon = TextEditingController();
  TextEditingController contentCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var notesProvider = Provider.of<NotesProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
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
                        NoteModel note = NoteModel(
                          title: titleCon.text,
                          content: contentCon.text,
                          date:
                              '${DateTime.now().day} / ${DateTime.now().month}'
                                  .toString(),
                        );
                        // var id = await NotesSqliteDb.insertNoteToDb(note);
                        // fetchList();
                        notesProvider.addNote(note);
                        titleCon.clear();
                        contentCon.clear();
                        // NotesSharedDb.updatedListAtSharedDb(notes);
                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),

      body: Consumer<NotesProvider>(
        builder: ((context, provider, child) {
          return provider.value.isEmpty
              ? Center(child: Text('There is nothing to show'))
              : ListView.builder(
                itemCount: provider.value.length,
                itemBuilder: (context, index) {
                  return NoteItem(
                    note: provider.value[index],
                    onDismissed: (direction) {
                      provider.deleteNote(provider.value[index]);
                    },
                  );
                },
              );
        }),
      ),
    );
  }

  // fetchList() async {
  //   Provider.of<NotesProvider>(context, listen: false).readNotes();

  //   // var fetchList = await NotesSharedDb.fetchListFromSharedDb();
  //   // setState(() {
  //   //   notes = fetchList;
  //   // });
  // }
}
