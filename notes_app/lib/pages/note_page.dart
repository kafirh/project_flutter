import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app/database/note_database.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/pages/add_edit_note_page.dart';
import 'package:notes_app/pages/note_detail_page.dart';
import 'package:notes_app/widgets/note_card_widget.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late List<Note> _notes = [];
  var _isLoading = false;

  Future<void> _refreshNotes() async {
    setState(() {
      _isLoading = false;
    });
    _notes = await NoteDatabase.instance.getALLNotes();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          //  final note = Note(
          //      isImportant: false,
          //      number: 1,
          //      title: 'Testing',
          //      description: 'Desc Testing',
          //      createdTime: DateTime.now());
          //  await NoteDatabase.instance.create(note);
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddEditNotePage()));
          _refreshNotes();
        },
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _notes.isEmpty
              ? const Text('Notes kosong')
              : MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    final note = _notes[index];
                    return GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NoteDetailPage(id: note.id!),
                            ));
                        _refreshNotes();
                      },
                      child: NoteCardWidget(note: note, index: index),
                    );
                  }),
    );
  }
}
