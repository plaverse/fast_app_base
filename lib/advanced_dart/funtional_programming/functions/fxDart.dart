import 'package:fast_app_base/advanced_dart/funtional_programming/functions/reduce.dart';

export 'package:fast_app_base/advanced_dart/funtional_programming/functions/future_map.dart';
export 'package:fast_app_base/advanced_dart/funtional_programming/functions/map.dart';
export 'package:fast_app_base/advanced_dart/funtional_programming/functions/reduce.dart';
export 'package:fast_app_base/advanced_dart/funtional_programming/functions/run.dart';

fxDart(List args) async {
  await reduce((a, f) async {
    if (a is Future) {
      return f(await a);
    }
    return f(a);
  }, args);
}
