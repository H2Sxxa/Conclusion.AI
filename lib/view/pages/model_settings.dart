import 'package:conclusion/config/config.dart';
import 'package:conclusion/view/pages/input.dart';
import 'package:conclusion/view/pages/select.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';

class ModelSettings extends StatefulWidget {
  const ModelSettings({super.key});

  @override
  State<StatefulWidget> createState() => ModelSettingsState();
}

class ModelSettingsState extends State<ModelSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Model", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("API Key"),
            onTap: () async {
              final apikey = await getInput(context, title: "API Key");
              if (apikey != null) {
                if (apikey.isEmpty) {
                  await AppConfigKeys.instance.remove(AppConfigKeys.apikey);
                } else {
                  await AppConfigKeys.instance.setString(
                    AppConfigKeys.apikey,
                    apikey,
                  );
                }

                setState(() {});
              }

              OpenAI.apiKey = AppConfigValues.apikey ?? "";
            },
            trailing: Text(
              AppConfigValues.apikey == null
                  ? "empty"
                  : AppConfigValues.apikey!.substring(
                      AppConfigValues.apikey!.length - 8,
                    ),
            ),
          ),
          ListTile(
            title: Text("Model"),
            trailing: Text(AppConfigValues.model ?? "gpt-3.5-turbo"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SelectPage()))
                  .then((_) {
                    setState(() {});
                  });
            },
          ),
        ],
      ),
    );
  }
}
