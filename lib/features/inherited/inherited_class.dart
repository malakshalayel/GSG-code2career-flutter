import 'package:flutter/widgets.dart';

class Inherited extends InheritedModel {
  const Inherited({required super.child, super.key, required this.color});

  final Color color;

  static Inherited of(BuildContext context, {String? aspect}) {
    Inherited? inherited = InheritedModel.inheritFrom(context, aspect: aspect);
    // Inherited inherited =
    //     context.dependOnInheritedWidgetOfExactType<Inherited>()!;
    return inherited!;
  }

  // @override
  // bool updateShouldNotify(covariant Inherited oldWidget) {
  //   return oldWidget.color != color;
  // }

  @override
  bool updateShouldNotifyDependent(
    covariant InheritedModel oldWidget,
    Set dependencies,
  ) {
    // TODO: implement updateShouldNotifyDependent
    throw UnimplementedError();
  }

  @override
  bool updateShouldNotify(covariant Inherited oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
}
