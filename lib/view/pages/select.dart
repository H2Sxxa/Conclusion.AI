import 'package:conclusion/config/config.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});
  @override
  State<StatefulWidget> createState() => SelectPageState();
}

class SelectPageState extends State<SelectPage> {
  List<OpenAIModelModel>? models;
  @override
  void initState() {
    super.initState();
    _fetchModels();
  }

  Future<void> _fetchModels() async {
    try {
      final response = await OpenAI.instance.model.list();
      setState(() {
        models = response;
        models!.sort((a, b) => a.id.compareTo(b.id));
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget child;
    if (models == null) {
      child = Center(child: CircularProgressIndicator());
    } else {
      child = ListView.builder(
        itemCount: models!.length,
        itemBuilder: (context, index) {
          final model = models![index];
          return Container(
            decoration: AppConfigValues.model == model.id
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.colorScheme.primary,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  )
                : null,
            child: ListTile(
              title: Text(model.id),
              subtitle: Text(model.ownedBy),
              onTap: () {
                AppConfigKeys.instance.setString(AppConfigKeys.model, model.id);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Model set to ${model.id}")),
                );
                setState(() {});
              },
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Model",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: child,
    );
  }
}
