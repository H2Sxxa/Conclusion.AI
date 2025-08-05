import 'package:flutter/material.dart';

class SourcePage extends StatefulWidget {
  const SourcePage({super.key});

  @override
  State<StatefulWidget> createState() => SourcePageState();
}

class SourcePageState extends State<SourcePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Source', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          ListTile(title: Text('Bing (CN)'), onTap: () {}, trailing: Text("2")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add source action
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
