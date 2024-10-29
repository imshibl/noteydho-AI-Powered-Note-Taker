import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteydho/config/router.dart';

class NoteListView extends StatefulWidget {
  const NoteListView({super.key});

  @override
  State<NoteListView> createState() => _NoteListViewState();
}

class _NoteListViewState extends State<NoteListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note List'),
        elevation: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: const [
          Text("New Section +"),
        ],
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.push(AppRouter.note);
            },
            child: const ListTile(
              title: Text('Chapter 1'),
              subtitle: Text('Containes note of chpater 1'),
            ),
          );
        },
      ),
    );
  }
}
