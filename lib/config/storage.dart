import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class AppStorage {
  static late Directory baseDirectory;

  static Future<void> init() async {
    baseDirectory = await getApplicationDocumentsDirectory();
    if (!await baseDirectory.exists()) {
      await baseDirectory.create(recursive: true);
    }
  }

  static Future<Directory> subDirectory(String name) async {
    final dir = Directory(path.join(baseDirectory.path, name));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  static Future<File> pluginsConfig() async {
    final file = File(path.join(baseDirectory.path, 'plugins_config.json'));
    if (!await file.exists()) {
      await file.writeAsString('{}');
    }
    return file;
  }

  static File pluginsConfigSync() {
    final file = File(path.join(baseDirectory.path, 'plugins_config.json'));
    if (!file.existsSync()) {
      file.writeAsStringSync('{}');
    }
    return file;
  }
}

class PluginsConfig {
  // HashMap<String, String> _cache;
}
