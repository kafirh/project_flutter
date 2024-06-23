import 'package:flutter/material.dart';
import 'package:notes_app/database/note_database.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/widgets/note_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  const AddEditNotePage({super.key, this.note});
  final Note? note;

  @override
  State<AddEditNotePage> createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  late bool _isImportant;
  late int _number;
  late String _title;
  late String _description;
  final _forekey = GlobalKey<FormState>();
  var _isupdateform = false;

  @override
  void initState() {
    super.initState();
    _isImportant = widget.note?.isImportant ?? false;
    _number = widget.note?.number ?? 0;
    _title = widget.note?.title ?? "";
    _description = widget.note?.description ?? "";
    _isupdateform = widget.note != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isupdateform ? 'Edit' : 'Add'),
        actions: [
          _buildButtonSave(),
        ],
      ),
      body: Form(
        key: _forekey,
        child: NoteFormWidget(
          isImportant: _isImportant,
          number: _number,
          title: _title,
          description: _description,
          onChangeIsImportant: (value) {
            setState(() {
              _isImportant = value;
            });
          },
          onChangeNumber: (value) {
            setState(() {
              _number = value;
            });
          },
          onChangeTitle: (value) {
            _title = value;
          },
          onChangeDescription: (value) {
            _description = _description;
          },
        ),
      ),
    );
  }

  Widget _buildButtonSave() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 11),
      child: ElevatedButton(
          onPressed: () async {
            final isValid = _forekey.currentState!.validate();
            if (isValid) {
              if (_isupdateform) {
                await _updateNote();
              } else {
                await _addNote();
              }
              Navigator.pop(context);
            }
          },
          child: const Text('Save')),
    );
  }

  Future<void> _addNote() async {
    final note = Note(
      isImportant: _isImportant,
      number: _number,
      title: _title,
      description: _description,
      createdTime: DateTime.now(),
    );
    await NoteDatabase.instance.create(note);
  }

  Future<void> _updateNote() async {
    final updateNote = Note(
      isImportant: _isImportant,
      number: _number,
      title: _title,
      description: _description,
      createdTime: DateTime.now(),
    );
    await NoteDatabase.instance.updateNote(updateNote);
  }
}
