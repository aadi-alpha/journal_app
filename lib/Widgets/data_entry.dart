import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:journal_app/data/Journal_model.dart';
import 'package:journal_app/data/listOfEntry.dart';

class DataEntry extends StatefulWidget {
  final Function(JournalModel) onSave;
  const DataEntry({super.key, required this.onSave});
  @override
  State<DataEntry> createState() => _DataEntryState();
}

class _DataEntryState extends State<DataEntry> {
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
            controller: _titleEditingController,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              label: Text("Content"),
              border: OutlineInputBorder(),
            ),
            controller: _contentEditingController,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close),
              ),
              ElevatedButton(
                onPressed: () {
                  JournalModel entry = JournalModel(
                    id: (listOfEntry.length + 1).toString(),
                    title: _titleEditingController.text,
                    content: _contentEditingController.text,
                    date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                  );
                  widget.onSave(entry);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                child: Icon(Icons.check),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
