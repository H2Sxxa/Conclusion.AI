//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <dynamic_system_colors/dynamic_color_plugin.h>
#include <flutter_js/flutter_js_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) dynamic_system_colors_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DynamicColorPlugin");
  dynamic_color_plugin_register_with_registrar(dynamic_system_colors_registrar);
  g_autoptr(FlPluginRegistrar) flutter_js_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterJsPlugin");
  flutter_js_plugin_register_with_registrar(flutter_js_registrar);
}
