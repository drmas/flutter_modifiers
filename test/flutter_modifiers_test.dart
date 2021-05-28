import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_modifiers/flutter_modifiers.dart';

void main() {
  test('.padding', () {
    final padding = Text("Hello").padding();
    expect(padding is Padding, true);
  });

  test('.center', () {
    final center = Text("Hello").center();
    expect(center is Center, true);
  });

  test('.align', () {
    final align = Text("Hello").align(Alignment.center);
    expect(align is Align, true);
  });

  test('.aspectRatio', () {
    final aspectRatio = Text("Hello").aspectRatio(2);
    expect(aspectRatio is AspectRatio, true);
  });

  test('.baseline', () {
    final baseline = Text("Hello")
        .baseline(baseline: 1, baselineType: TextBaseline.alphabetic);
    expect(baseline is Baseline, true);
  });

  test('.constrainedBox', () {
    final constrainedBox = Text("Hello").constrainedBox(BoxConstraints());
    expect(constrainedBox is ConstrainedBox, true);
  });

  test('.expanded', () {
    final expanded = Text("Hello").expanded(1);
    expect(expanded is Expanded, true);
  });

  test('.fittedBox', () {
    final fittedBox = Text("Hello").fittedBox();
    expect(fittedBox is FittedBox, true);
  });

  test('.fittedBox', () {
    final fittedBox = Text("Hello").fittedBox();
    expect(fittedBox is FittedBox, true);
  });

  test('.fractionallySizedBox', () {
    final fractionallySizedBox = Text("Hello").fractionallySizedBox();
    expect(fractionallySizedBox is FractionallySizedBox, true);
  });

  test('.intrinsicHeight', () {
    final intrinsicHeight = Text("Hello").intrinsicHeight();
    expect(intrinsicHeight is IntrinsicHeight, true);
  });

  test('.intrinsicWidth', () {
    final intrinsicWidth =
        Text("Hello").intrinsicWidth(stepHeight: 1.0, stepWidth: 1.0);
    expect(intrinsicWidth is IntrinsicWidth, true);
  });

  test('.limitedBox', () {
    final limitedBox = Text("Hello").limitedBox();
    expect(limitedBox is LimitedBox, true);
  });

  test('.offstage', () {
    final offstage = Text("Hello").offstage(true);
    expect(offstage is Offstage, true);
  });

  test('.overflowBox', () {
    final overflowBox = Text("Hello").overflowBox(
      minWidth: 1.0,
      maxWidth: 1.0,
      minHeight: 1.0,
      maxHeight: 1.0,
    );
    expect(overflowBox is OverflowBox, true);
  });

  test('.sizedBox', () {
    final sizedBox = Text("Hello").sizedBox(width: 1.0, height: 1.0);
    expect(sizedBox is SizedBox, true);
  });

  test('.sizedOverflowBox', () {
    final sizedOverflowBox = Text("Hello").sizedOverflowBox(
      size: Size(1.0, 1.0),
    );
    expect(sizedOverflowBox is SizedOverflowBox, true);
  });

  test('.transform', () {
    final transform = Text("Hello").transform(
      transform: Matrix4.skewY(0.3)..rotateX(10),
      alignment: Alignment.center,
    );
    expect(transform is Transform, true);
  });

  test('.rotate', () {
    final rotate = Text("Hello").rotate(10);
    expect(rotate is Transform, true);
  });

  test('.translate', () {
    final translate = Text("Hello").translate(offset: Offset(10, 20));
    expect(translate is Transform, true);
  });

  test('.scale', () {
    final scale = Text("Hello").scale(scale: 2);
    expect(scale is Transform, true);
  });

  test('.clipOval', () {
    final clipOval = Text("Hello").clipOval();
    expect(clipOval is ClipOval, true);
  });

  test('.clipPath', () {
    final clipPath = Text("Hello").clipPath();
    expect(clipPath is ClipPath, true);
  });

  test('.clipRect', () {
    final clipRect = Text("Hello").clipRect();
    expect(clipRect is ClipRect, true);
  });

  test('.opacity', () {
    final opacity = Text("Hello").opacity(0.5);
    expect(opacity is Opacity, true);
  });

  test('.theme', () {
    final theme = Text("Hello").theme(data: ThemeData());
    expect(theme is Theme, true);
  });
}
