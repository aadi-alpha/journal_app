import 'package:flutter/material.dart';
import 'package:journal_app/Widgets/Journal_Card.dart';
import 'package:journal_app/Widgets/data_entry.dart';
import 'package:journal_app/data/listOfEntry.dart';

class JournalhomeScreen extends StatefulWidget {
  const JournalhomeScreen({super.key});

  @override
  State<JournalhomeScreen> createState() => _JournalHomeScreenState();
}

class _JournalHomeScreenState extends State<JournalhomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Journals",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: listOfEntry.length,
          itemBuilder: (context, index) {
            return JournalCard(entry: listOfEntry[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        foregroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            context: context,
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.5,
                child: DataEntry(
                  onSave: (entry) {
                    setState(() {
                      listOfEntry.add(entry);
                    });
                  },
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
