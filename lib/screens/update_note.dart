import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_app/shared/notes.dart';

class UpdateNote extends StatefulWidget {
  final String? title;
  final String? description;
  final String? docId;

  const UpdateNote({
    Key? key,
    String? this.title,
    String? this.description,
    String? this.docId,
  }) : super(key: key);

  @override
  _UpdateNoteState createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    log(widget.docId!);
    log(widget.title!);

    titleController.text = widget.title!;
    descriptionController.text = widget.description!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Note'),
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
                border: InputBorder.none,
              ),
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            Expanded(
              child: TextField(
                controller: descriptionController,
                minLines: 1,
                maxLines: null, // null will make it expand as user types
                decoration: const InputDecoration(
                  hintText: 'Description',
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (titleController.text.isEmpty ||
              descriptionController.text.isEmpty) {
            return;
          }
          updateNote(
            title: titleController.text,
            description: descriptionController.text,
            docId: widget.docId!,
          );
          Navigator.pop(context);
        },
        tooltip: 'Update Note',
        label: const Text('Update'),
        icon: const Icon(Icons.update),
      ),
    );
  }
}
