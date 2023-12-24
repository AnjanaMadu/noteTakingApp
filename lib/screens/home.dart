import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/notes.dart';
import 'update_note.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 4,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: StreamBuilder(
          stream: readNotes(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            if (snapshot.data.docs.length == 0) {
              return const Text("No data found");
            }

            return ListView(
              children: snapshot.data.docs.map<Widget>((document) {
                return ListTile(
                  title: Text(document['title']),
                  subtitle: Text(
                    document['description'],
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await deleteNote(
                        docId: document.id,
                      );
                    },
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    log(document.id);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return UpdateNote(
                            title: document['title'],
                            description: document['description'],
                            docId: document.id,
                          );
                        },
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/new');
          },
          tooltip: 'New Note',
          icon: const Icon(Icons.add),
          label: const Text('New Note')),
    );
  }
}
