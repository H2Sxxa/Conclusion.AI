import 'package:shared_preferences/shared_preferences.dart';

class AppConfigKeys {
  static late SharedPreferences instance;
  static const String apikey = "APIKEY";
  static const String model = "MODEL";

  static Future<void> initialize() async {
    instance = await SharedPreferences.getInstance();
  }
}

class AppConfigValues {
  static String? get apikey =>
      AppConfigKeys.instance.getString(AppConfigKeys.apikey);
  static String? get model =>
      AppConfigKeys.instance.getString(AppConfigKeys.model) ?? "gpt-3.5-turbo";
}
