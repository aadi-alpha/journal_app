import 'package:flutter/material.dart';
import 'package:journal_app/data/Journal_model.dart';

class JournalCard extends StatelessWidget {
  final JournalModel entry;
  const JournalCard({super.key, required this.entry});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 244, 248),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entry.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(entry.content),
            SizedBox(height: 10),
            Text(entry.date, style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
