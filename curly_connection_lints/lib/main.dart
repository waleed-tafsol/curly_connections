import 'package:analysis_server_plugin/plugin.dart';
import 'package:analysis_server_plugin/registry.dart';

import 'route_name_lint.dart';

final plugin = _CurlyLints();

class _CurlyLints extends Plugin {
  @override
  String get name => 'curly_connection_lints';

  @override
  void register(PluginRegistry registry) {
    registry.registerLintRule(RouteNameMustBeStaticConst());
  }
}
