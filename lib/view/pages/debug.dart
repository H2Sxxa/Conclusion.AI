import 'package:conclusion/plugin/engine.dart';
import 'package:flutter/material.dart';

class DebugPage extends StatefulWidget {
  const DebugPage({super.key});

  @override
  State<StatefulWidget> createState() => DebugPageState();
}

class DebugPageState extends State<DebugPage> {
  String output = "";
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Debug")),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data = (await JavaScriptEngine.evalPromise(controller.text));
          output = data.stringResult;
          setState(() {});
        },
        child: Icon(Icons.calculate),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 100),
        children: [
          TextField(
            controller: controller,
            maxLines: null,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          SizedBox(height: 8),
          Text("Output"),
          SizedBox(height: 4),

          Card.outlined(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Text(output),
            ),
          ),
        ],
      ),
    );
  }
}
