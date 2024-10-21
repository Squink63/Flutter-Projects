import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _noteController = TextEditingController();
   Box? notesBox;

  @override
  void initState() {
    super.initState();
    // Get the Hive box
    notesBox = Hive.box('notes');
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _addNote() {
    final note = _noteController.text;
    if (note.isNotEmpty) {
      // Add the note to the Hive box
      notesBox?.add(note);
      _noteController.clear();
      setState(() {}); // Refresh UI
    }
  }

  void _deleteNoteAt(int index) {
    // Delete the note from the Hive box
    notesBox?.deleteAt(index);
    setState(() {}); // Refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'Enter a note',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addNote,
                ),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: notesBox!.listenable(),
              builder: (context, Box box, _) {
                if (box.isEmpty) {
                  return Center(child: Text('No notes added yet.'));
                }

                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final note = box.get(index) as String;

                    return ListTile(
                      title: Text(note),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteNoteAt(index),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}