import 'package:conclusion/plugin/engine.dart';
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
        children: PluginLoader.registeredPlugins.values
            .map(
              (e) => ListTile(
                title: Text(e.name),
                subtitle: Text(
                  e.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text(e.version),
                onTap: () {},
              ),
            )
            .toList(),
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
