import 'package:flutter/material.dart';

extension WidgetExtension on Column {
  Widget wrap({double padding = 16.0, double margin = 8.0}) {
    final reversedChildren = children
        .map((e) => Container(padding: EdgeInsets.all(padding), margin: EdgeInsets.all(margin), child: e))
        .toList();
    return Column(
      children: reversedChildren,
    );
  }
}

extension SpacingExtension on Column {
  static Column withSpacing({
    Key? key,
    required List<Widget> children,
    int spacing = 10,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
    TextBaseline? textBaseline,
  }) {
    var spacedChildren = children.expand((widget) => [widget, SizedBox(height: spacing.toDouble())]).toList();
    spacedChildren.removeLast(); // Remove the extra SizedBox

    return Column(
      key: key,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: spacedChildren,
    );
  }
}
