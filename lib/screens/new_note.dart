import 'package:flutter/material.dart';
import '../shared/notes.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  _NewNoteState createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
        elevation: 4,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descriptionController,
              minLines: 1,
              maxLines: 9999,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (titleController.text.isEmpty ||
              descriptionController.text.isEmpty) {
            return;
          }
          addNote(
            title: titleController.text,
            description: descriptionController.text,
          );
          Navigator.pop(context);
        },
        tooltip: 'Save Note',
        label: const Text('Save'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
