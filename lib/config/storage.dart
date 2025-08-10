import 'dart:collection';
import 'dart:convert';
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

  static Future<File> pluginsConfigFile() async {
    final file = File(path.join(baseDirectory.path, 'plugins_config.json'));
    if (!await file.exists()) {
      await file.writeAsString('{}');
    }
    return file;
  }

  static File pluginsConfigFileSync() {
    final file = File(path.join(baseDirectory.path, 'plugins_config.json'));
    if (!file.existsSync()) {
      file.writeAsStringSync('{}');
    }
    return file;
  }
}

class PluginsConfig {
  final File pluginsConfig;
  final HashMap<String, String> _cache;

  PluginsConfig({required this.pluginsConfig})
    : _cache = jsonDecode(pluginsConfig.readAsStringSync());

  factory PluginsConfig.instance() {
    return PluginsConfig(pluginsConfig: AppStorage.pluginsConfigFileSync());
  }

  void writeSync(String key, String value) {
    _cache[key] = value;
    pluginsConfig.writeAsStringSync(jsonEncode(_cache));
  }

  Future<void> write(String key, String value) async {
    _cache[key] = value;
    await pluginsConfig.writeAsString(jsonEncode(_cache));
  }

  String? read(String key) {
    return _cache[key];
  }

  void clearSync() {
    _cache.clear();
    pluginsConfig.writeAsStringSync(jsonEncode(_cache));
  }

  Future<void> clear() async {
    _cache.clear();
    await pluginsConfig.writeAsString(jsonEncode(_cache));
  }
}
