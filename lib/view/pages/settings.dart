import 'package:conclusion/view/pages/debug.dart';
import 'package:conclusion/view/pages/model_settings.dart';
import 'package:conclusion/view/pages/source.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.data_array),
            title: Text("Model"),
            trailing: Icon(Icons.chevron_right_rounded),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ModelSettings()));
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Source"),
            trailing: Icon(Icons.chevron_right_rounded),
            onTap: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => SourcePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text("License"),
            trailing: Icon(Icons.chevron_right_rounded),
            onTap: () {
              showLicensePage(context: context);
            },
          ),
          if (kDebugMode)
            ListTile(
              leading: Icon(Icons.bug_report),
              title: Text("Debug"),
              trailing: Icon(Icons.chevron_right_rounded),
              onTap: () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => DebugPage())),
            ),
        ],
      ),
    );
  }
}
