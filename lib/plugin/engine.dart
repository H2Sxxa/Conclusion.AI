import 'dart:collection';
import 'dart:convert';

import 'package:conclusion/model/reference.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';
import 'package:rhttp/rhttp.dart';

class JavaScriptEngine {
  static bool isInitialized = false;

  static JavascriptRuntime runtime = getJavascriptRuntime();
  static Future<void> init() async {
    if (isInitialized) {
      return;
    }
    isInitialized = true;
    runtime.onMessage("http", (params) async {
      final method = params["method"] ?? "GET";
      final url = params["url"];
      final data = params["data"];
      final isBinary = params["isBinary"] ?? false;
      HttpHeaders? headers;
      if (params["headers"] != null) {
        headers = HttpHeaders.rawMap(params["headers"]);
      }

      if (isBinary) {
        final response = await Rhttp.requestBytes(
          url: url,
          method: HttpMethod(method),
          headers: headers,
          body: data == null ? null : HttpBody.text(data),
        );
        return jsonEncode({
          "status": response.statusCode,
          "body": base64Encode(response.body),
        });
      } else {
        final response = await Rhttp.requestText(
          url: url,
          method: HttpMethod(method),
          headers: headers,
          body: data == null ? null : HttpBody.text(data),
        );
        return jsonEncode({
          "status": response.statusCode,
          "body": response.body,
        });
      }
    });
    runtime.onMessage("config", (keys) async {
      //TODO
    });

    runtime.evaluate(await rootBundle.loadString("assets/prelude.js"));
  }

  static JsEvalResult eval(String code) {
    return runtime.evaluate(code);
  }

  static Future<JsEvalResult> evalAsync(String code) {
    return runtime.evaluateAsync(code);
  }

  static Future<JsEvalResult> evalPromise(String code) async {
    return runtime.handlePromise(eval(code));
  }
}

class PluginLoader {
  static final HashSet<String> registeredPlugins = HashSet();
  static Future<void> loadPlugins() async {
    // TODO Load and initialize all plugins
  }

  static Future<List<ReferenceData>> callPlugin({
    required String name,
    required String keyword,
    required int numbers,
  }) async {
    if (!registeredPlugins.contains(name)) {
      throw Exception("Plugin not registered");
    }

    final result = await JavaScriptEngine.evalPromise(
      "$name.get('$name', '$keyword', $numbers)",
    );

    //TODO

    return [];
  }
}
