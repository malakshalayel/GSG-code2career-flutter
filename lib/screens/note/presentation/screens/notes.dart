import 'dart:convert';

import 'package:e_commerce_design1/core/custom_text_field.dart';
import 'package:e_commerce_design1/screens/note/data/note_model.dart';
import 'package:e_commerce_design1/screens/note/data/notes_shared_db.dart';
import 'package:e_commerce_design1/screens/note/presentation/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  //List<String> notes = [];
  List<NoteModel> notes = [];
  String noteKey = 'notes';

  TextEditingController titleCon = TextEditingController();
  TextEditingController contentCon = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchList();
  }

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {
                        setState(() {
                          notes.add(
                            NoteModel(
                              title: titleCon.text,
                              content: contentCon.text,
                              date:
                                  '${DateTime.now().day} / ${DateTime.now().month}'
                                      .toString(),
                            ),
                          );
                          titleCon.clear();
                          contentCon.clear();
                          NotesSharedDb.updatedListAtSharedDb(notes);
                          Navigator.pop(context);
                        });
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

      body:
          notes.isEmpty
              ? Center(child: Text('There is nothing to show'))
              : ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NoteItem(
                    note: notes[index],
                    onDismissed: (direction) {
                      notes.removeAt(index);
                      NotesSharedDb.updatedListAtSharedDb(notes);
                      if (notes.isEmpty) {
                        setState(() {});
                      }
                    },
                  );
                },
              ),
    );
  }

  fetchList() async {
    var fetchList = await NotesSharedDb.fetchListFromSharedDb();
    setState(() {
      notes = fetchList;
    });
  }
}
