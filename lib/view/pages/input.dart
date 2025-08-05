import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  final String? title;
  final String? value;
  const InputPage({super.key, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController(text: value);
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: TextField(
          controller: controller,
          maxLines: null,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(16.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(controller.text);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

Future<String?> getInput(
  BuildContext context, {
  String? title,
  String? value,
}) async {
  final result = await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => InputPage(title: title, value: value),
    ),
  );
  return result;
}
