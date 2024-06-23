import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/database/note_database.dart';
import 'package:notes/models/note.dart';
import 'package:notes/widgets/note_card_widget.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late List<Note> _notes;
  var _isLoading = false;

  Future<void> _refreshNotes() async {
    setState(() {
      _isLoading = true;
    });
    _notes = await NoteDatabase.instance.getALLNotes();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
          final note = Note(
              isImportant: false,
              number: 1,
              title: 'Testing',
              description: 'Desc Testing',
              createdTime: DateTime.now());
          await NoteDatabase.instance.create(note);
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
                      child: NoteCardWidget(note: note, index: index),
                    );
                  }),
    );
  }
}
