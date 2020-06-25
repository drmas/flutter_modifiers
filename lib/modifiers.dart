library flutter_modifiers;

import 'package:flutter/material.dart';

extension FlutterModifiers<T extends Widget> on T {
  /// A widget that insets its child by the given padding.
  ///
  /// When passing layout constraints to its child, padding shrinks the
  /// constraints by the given padding, causing the child to layout at a smaller
  /// size. Padding then sizes itself to its child's size, inflated by the
  /// padding, effectively creating empty space around the child.
  ///
  /// {@tool snippet}
  ///
  /// This snippet creates "Hello World!" [Text] inside a [Card] that is indented
  /// by sixteen pixels in each direction.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/padding.png)
  ///
  /// ```dart
  /// const Card(
  ///   child: Padding(
  ///     padding: EdgeInsets.all(16.0),
  ///     child: Text('Hello World!'),
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// ## Design discussion
  ///
  /// ### Why use a [Padding] widget rather than a [Container] with a [Container.padding] property?
  ///
  /// There isn't really any difference between the two. If you supply a
  /// [Container.padding] argument, [Container] simply builds a [Padding] widget
  /// for you.
  ///
  /// [Container] doesn't implement its properties directly. Instead, [Container]
  /// combines a number of simpler widgets together into a convenient package. For
  /// example, the [Container.padding] property causes the container to build a
  /// [Padding] widget and the [Container.decoration] property causes the
  /// container to build a [DecoratedBox] widget. If you find [Container]
  /// convenient, feel free to use it. If not, feel free to build these simpler
  /// widgets in whatever combination meets your needs.
  ///
  /// In fact, the majority of widgets in Flutter are simply combinations of other
  /// simpler widgets. Composition, rather than inheritance, is the primary
  /// mechanism for building up widgets.
  ///
  /// See also:
  ///
  ///  * [AnimatedPadding], which animates changes in [padding] over a given
  ///    duration.
  ///  * [EdgeInsets], the class that is used to describe the padding dimensions.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  Padding padding([EdgeInsets padding]) {
    padding ??= EdgeInsets.all(8.0);
    return Padding(
      child: this,
      padding: padding,
    );
  }

  /// A widget that centers its child within itself.
  ///
  /// This widget will be as big as possible if its dimensions are constrained and
  /// [widthFactor] and [heightFactor] are null. If a dimension is unconstrained
  /// and the corresponding size factor is null then the widget will match its
  /// child's size in that dimension. If a size factor is non-null then the
  /// corresponding dimension of this widget will be the product of the child's
  /// dimension and the size factor. For example if widthFactor is 2.0 then
  /// the width of this widget will always be twice its child's width.
  ///
  /// See also:
  ///
  ///  * [Align], which lets you arbitrarily position a child within itself,
  ///    rather than just centering it.
  ///  * [Row], a widget that displays its children in a horizontal array.
  ///  * [Column], a widget that displays its children in a vertical array.
  ///  * [Container], a convenience widget that combines common painting,
  ///    positioning, and sizing widgets.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  Center center({double widthFactor, double heightFactor}) {
    return Center(
        child: this, widthFactor: widthFactor, heightFactor: heightFactor);
  }

  /// A widget that aligns its child within itself and optionally sizes itself
  /// based on the child's size.
  ///
  /// For example, to align a box at the bottom right, you would pass this box a
  /// tight constraint that is bigger than the child's natural size,
  /// with an alignment of [Alignment.bottomRight].
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=g2E7yl3MwMk}
  ///
  /// This widget will be as big as possible if its dimensions are constrained and
  /// [widthFactor] and [heightFactor] are null. If a dimension is unconstrained
  /// and the corresponding size factor is null then the widget will match its
  /// child's size in that dimension. If a size factor is non-null then the
  /// corresponding dimension of this widget will be the product of the child's
  /// dimension and the size factor. For example if widthFactor is 2.0 then
  /// the width of this widget will always be twice its child's width.
  ///
  /// ## How it works
  ///
  /// The [alignment] property describes a point in the `child`'s coordinate system
  /// and a different point in the coordinate system of this widget. The [Align]
  /// widget positions the `child` such that both points are lined up on top of
  /// each other.
  ///
  /// {@tool snippet}
  /// The [Align] widget in this example uses one of the defined constants from
  /// [Alignment], [topRight]. This places the [FlutterLogo] in the top right corner
  /// of the parent blue [Container].
  ///
  /// ![A blue square container with the Flutter logo in the top right corner.](https://flutter.github.io/assets-for-api-docs/assets/widgets/align_constant.png)
  ///
  /// ```dart
  /// Center(
  ///   child: Container(
  ///     height: 120.0,
  ///     width: 120.0,
  ///     color: Colors.blue[50],
  ///     child: Align(
  ///       alignment: Alignment.topRight,
  ///       child: FlutterLogo(
  ///         size: 60,
  ///       ),
  ///     ),
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// {@tool snippet}
  /// The [Alignment] used in the following example defines a single point:
  ///
  ///   * (0.2 * width of [FlutterLogo]/2 + width of [FlutterLogo]/2, 0.6 * height
  ///   of [FlutterLogo]/2 + height of [FlutterLogo]/2) = (36.0, 48.0).
  ///
  /// The [Alignment] class uses a coordinate system with an origin in the center
  /// of the [Container], as shown with the [Icon] above. [Align] will place the
  /// [FlutterLogo] at (36.0, 48.0) according to this coordinate system.
  ///
  /// ![A blue square container with the Flutter logo positioned according to the
  /// Alignment specified above. A point is marked at the center of the container
  /// for the origin of the Alignment coordinate system.](https://flutter.github.io/assets-for-api-docs/assets/widgets/align_alignment.png)
  ///
  /// ```dart
  /// Center(
  ///   child: Container(
  ///     height: 120.0,
  ///     width: 120.0,
  ///     color: Colors.blue[50],
  ///     child: Align(
  ///       alignment: Alignment(0.2, 0.6),
  ///       child: FlutterLogo(
  ///         size: 60,
  ///       ),
  ///     ),
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// {@tool snippet}
  /// The [FractionalOffset] used in the following example defines two points:
  ///
  ///   * (0.2 * width of [FlutterLogo], 0.6 * height of [FlutterLogo]) = (12.0, 36.0)
  ///     in the coordinate system of the blue container.
  ///   * (0.2 * width of [Align], 0.6 * height of [Align]) = (24.0, 72.0) in the
  ///     coordinate system of the [Align] widget.
  ///
  /// The [Align] widget positions the [FlutterLogo] such that the two points are on
  /// top of each other. In this example, the top left of the [FlutterLogo] will
  /// be placed at (24.0, 72.0) - (12.0, 36.0) = (12.0, 36.0) from the top left of
  /// the [Align] widget.
  ///
  /// The [FractionalOffset] class uses a coordinate system with an origin in the top-left
  /// corner of the [Container] in difference to the center-oriented system used in
  /// the example above with [Alignment].
  ///
  /// ![A blue square container with the Flutter logo positioned according to the
  /// FractionalOffset specified above. A point is marked at the top left corner
  /// of the container for the origin of the FractionalOffset coordinate system.](https://flutter.github.io/assets-for-api-docs/assets/widgets/align_fractional_offset.png)
  ///
  /// ```dart
  /// Center(
  ///   child: Container(
  ///     height: 120.0,
  ///     width: 120.0,
  ///     color: Colors.blue[50],
  ///     child: Align(
  ///       alignment: FractionalOffset(0.2, 0.6),
  ///       child: FlutterLogo(
  ///         size: 60,
  ///       ),
  ///     ),
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [AnimatedAlign], which animates changes in [alignment] smoothly over a
  ///    given duration.
  ///  * [CustomSingleChildLayout], which uses a delegate to control the layout of
  ///    a single child.
  ///  * [Center], which is the same as [Align] but with the [alignment] always
  ///    set to [Alignment.center].
  ///  * [FractionallySizedBox], which sizes its child based on a fraction of its
  ///    own size and positions the child according to an [Alignment] value.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  Align align(Alignment alignment) {
    return Align(
      child: this,
      alignment: alignment,
    );
  }

  /// A widget that attempts to size the child to a specific aspect ratio.
  ///
  /// The widget first tries the largest width permitted by the layout
  /// constraints. The height of the widget is determined by applying the
  /// given aspect ratio to the width, expressed as a ratio of width to height.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=XcnP3_mO_Ms}
  ///
  /// For example, a 16:9 width:height aspect ratio would have a value of
  /// 16.0/9.0. If the maximum width is infinite, the initial width is determined
  /// by applying the aspect ratio to the maximum height.
  ///
  /// Now consider a second example, this time with an aspect ratio of 2.0 and
  /// layout constraints that require the width to be between 0.0 and 100.0 and
  /// the height to be between 0.0 and 100.0. We'll select a width of 100.0 (the
  /// biggest allowed) and a height of 50.0 (to match the aspect ratio).
  ///
  /// In that same situation, if the aspect ratio is 0.5, we'll also select a
  /// width of 100.0 (still the biggest allowed) and we'll attempt to use a height
  /// of 200.0. Unfortunately, that violates the constraints because the child can
  /// be at most 100.0 pixels tall. The widget will then take that value
  /// and apply the aspect ratio again to obtain a width of 50.0. That width is
  /// permitted by the constraints and the child receives a width of 50.0 and a
  /// height of 100.0. If the width were not permitted, the widget would
  /// continue iterating through the constraints. If the widget does not
  /// find a feasible size after consulting each constraint, the widget
  /// will eventually select a size for the child that meets the layout
  /// constraints but fails to meet the aspect ratio constraints.
  ///
  /// See also:
  ///
  ///  * [Align], a widget that aligns its child within itself and optionally
  ///    sizes itself based on the child's size.
  ///  * [ConstrainedBox], a widget that imposes additional constraints on its
  ///    child.
  ///  * [UnconstrainedBox], a container that tries to let its child draw without
  ///    constraints.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  AspectRatio aspectRatio(double aspectRation) {
    return AspectRatio(
      child: this,
      aspectRatio: aspectRation,
    );
  }

  /// A widget that positions its child according to the child's baseline.
  ///
  /// This widget shifts the child down such that the child's baseline (or the
  /// bottom of the child, if the child has no baseline) is [baseline]
  /// logical pixels below the top of this box, then sizes this box to
  /// contain the child. If [baseline] is less than the distance from
  /// the top of the child to the baseline of the child, then the child
  /// is top-aligned instead.
  ///
  /// See also:
  ///
  ///  * [Align], a widget that aligns its child within itself and optionally
  ///    sizes itself based on the child's size.
  ///  * [Center], a widget that centers its child within itself.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  Baseline baseline({double baseline, TextBaseline baselineType}) {
    return Baseline(
      child: this,
      baseline: baseline,
      baselineType: baselineType,
    );
  }

  /// A widget that imposes additional constraints on its child.
  ///
  /// For example, if you wanted [child] to have a minimum height of 50.0 logical
  /// pixels, you could use `const BoxConstraints(minHeight: 50.0)` as the
  /// [constraints].
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=o2KveVr7adg}
  ///
  /// {@tool snippet}
  ///
  /// This snippet makes the child widget (a [Card] with some [Text]) fill the
  /// parent, by applying [BoxConstraints.expand] constraints:
  ///
  /// ```dart
  /// ConstrainedBox(
  ///   constraints: const BoxConstraints.expand(),
  ///   child: const Card(child: Text('Hello World!')),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// The same behavior can be obtained using the [new SizedBox.expand] widget.
  ///
  /// See also:
  ///
  ///  * [BoxConstraints], the class that describes constraints.
  ///  * [UnconstrainedBox], a container that tries to let its child draw without
  ///    constraints.
  ///  * [SizedBox], which lets you specify tight constraints by explicitly
  ///    specifying the height or width.
  ///  * [FractionallySizedBox], which sizes its child based on a fraction of its
  ///    own size and positions the child according to an [Alignment] value.
  ///  * [AspectRatio], a widget that attempts to fit within the parent's
  ///    constraints while also sizing its child to match a given aspect ratio.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  ConstrainedBox constrainedBox(BoxConstraints constraints) {
    return ConstrainedBox(
      child: this,
      constraints: constraints,
    );
  }

  /// A widget that expands a child of a [Row], [Column], or [Flex]
  /// so that the child fills the available space.
  ///
  /// Using an [Expanded] widget makes a child of a [Row], [Column], or [Flex]
  /// expand to fill the available space along the main axis (e.g., horizontally for
  /// a [Row] or vertically for a [Column]). If multiple children are expanded,
  /// the available space is divided among them according to the [flex] factor.
  ///
  /// An [Expanded] widget must be a descendant of a [Row], [Column], or [Flex],
  /// and the path from the [Expanded] widget to its enclosing [Row], [Column], or
  /// [Flex] must contain only [StatelessWidget]s or [StatefulWidget]s (not other
  /// kinds of widgets, like [RenderObjectWidget]s).
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=_rnZaagadyo}
  ///
  /// {@tool dartpad --template=stateless_widget_material}
  /// This example shows how to use an [Expanded] widget in a [Column] so that
  /// it's middle child, a [Container] here, expands to fill the space.
  ///
  /// ![This results in two thin blue boxes with a larger amber box in between.](https://flutter.github.io/assets-for-api-docs/assets/widgets/expanded_column.png)
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     appBar: AppBar(
  ///       title: Text('Expanded Column Sample'),
  ///     ),
  ///     body: Center(
  ///        child: Column(
  ///         children: <Widget>[
  ///           Container(
  ///             color: Colors.blue,
  ///             height: 100,
  ///             width: 100,
  ///           ),
  ///           Expanded(
  ///             child: Container(
  ///               color: Colors.amber,
  ///               width: 100,
  ///             ),
  ///           ),
  ///           Container(
  ///             color: Colors.blue,
  ///             height: 100,
  ///             width: 100,
  ///           ),
  ///         ],
  ///       ),
  ///     ),
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  ///
  /// {@tool dartpad --template=stateless_widget_material}
  /// This example shows how to use an [Expanded] widget in a [Row] with multiple
  /// children expanded, utilizing the [flex] factor to prioritize available space.
  ///
  /// ![This results in a wide amber box, followed by a thin blue box, with a medium width amber box at the end.](https://flutter.github.io/assets-for-api-docs/assets/widgets/expanded_row.png)
  ///
  /// ```dart
  /// Widget build(BuildContext context) {
  ///   return Scaffold(
  ///     appBar: AppBar(
  ///       title: Text('Expanded Row Sample'),
  ///     ),
  ///     body: Center(
  ///       child: Row(
  ///         children: <Widget>[
  ///           Expanded(
  ///             flex: 2,
  ///             child: Container(
  ///               color: Colors.amber,
  ///               height: 100,
  ///             ),
  ///           ),
  ///           Container(
  ///             color: Colors.blue,
  ///             height: 100,
  ///             width: 50,
  ///           ),
  ///           Expanded(
  ///             flex: 1,
  ///             child: Container(
  ///               color: Colors.amber,
  ///               height: 100,
  ///             ),
  ///           ),
  ///         ],
  ///       ),
  ///     ),
  ///   );
  /// }
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [Flexible], which does not force the child to fill the available space.
  ///  * [Spacer], a widget that takes up space proportional to it's flex value.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  Expanded expanded(int flex) {
    return Expanded(
      child: this,
      flex: flex,
    );
  }

  /// Scales and positions its child within itself according to [fit].
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=T4Uehk3_wlY}
  ///
  /// See also:
  ///
  ///  * [Transform], which applies an arbitrary transform to its child widget at
  ///    paint time.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  FittedBox fittedBox(
      {BoxFit fit: BoxFit.contain, Alignment alignment: Alignment.center}) {
    return FittedBox(
      child: this,
      fit: fit,
      alignment: alignment,
    );
  }

  /// A widget that sizes its child to a fraction of the total available space.
  /// For more details about the layout algorithm, see
  /// [RenderFractionallySizedOverflowBox].
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=PEsY654EGZ0}
  ///
  /// See also:
  ///
  ///  * [Align], which sizes itself based on its child's size and positions
  ///    the child according to an [Alignment] value.
  ///  * [OverflowBox], a widget that imposes different constraints on its child
  ///    than it gets from its parent, possibly allowing the child to overflow the
  ///    parent.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  FractionallySizedBox fractionallySizedBox(
      {AlignmentGeometry alignment: Alignment.center,
      double widthFactor,
      double heightFactor}) {
    return FractionallySizedBox(
      child: this,
      alignment: alignment,
      widthFactor: widthFactor,
      heightFactor: heightFactor,
    );
  }

  /// A widget that sizes its child to the child's intrinsic height.
  ///
  /// This class is useful, for example, when unlimited height is available and
  /// you would like a child that would otherwise attempt to expand infinitely to
  /// instead size itself to a more reasonable height.
  ///
  /// This class is relatively expensive, because it adds a speculative layout
  /// pass before the final layout phase. Avoid using it where possible. In the
  /// worst case, this widget can result in a layout that is O(N²) in the depth of
  /// the tree.
  ///
  /// See also:
  ///
  ///  * [The catalog of layout widgets](https://flutter.dev/widgets/layout/).
  IntrinsicHeight intrinsicHeight() {
    return IntrinsicHeight(child: this);
  }

  /// A widget that sizes its child to the child's intrinsic width.
  ///
  /// Sizes its child's width to the child's maximum intrinsic width. If
  /// [stepWidth] is non-null, the child's width will be snapped to a multiple of
  /// the [stepWidth]. Similarly, if [stepHeight] is non-null, the child's height
  /// will be snapped to a multiple of the [stepHeight].
  ///
  /// This class is useful, for example, when unlimited width is available and
  /// you would like a child that would otherwise attempt to expand infinitely to
  /// instead size itself to a more reasonable width.
  ///
  /// This class is relatively expensive, because it adds a speculative layout
  /// pass before the final layout phase. Avoid using it where possible. In the
  /// worst case, this widget can result in a layout that is O(N²) in the depth of
  /// the tree.
  ///
  /// See also:
  ///
  ///  * [The catalog of layout widgets](https://flutter.dev/widgets/layout/).
  IntrinsicWidth intrinsicWidth({double stepWidth, double stepHeight}) {
    return IntrinsicWidth(
      child: this,
      stepWidth: stepWidth,
      stepHeight: stepHeight,
    );
  }

  /// A box that limits its size only when it's unconstrained.
  ///
  /// If this widget's maximum width is unconstrained then its child's width is
  /// limited to [maxWidth]. Similarly, if this widget's maximum height is
  /// unconstrained then its child's height is limited to [maxHeight].
  ///
  /// This has the effect of giving the child a natural dimension in unbounded
  /// environments. For example, by providing a [maxHeight] to a widget that
  /// normally tries to be as big as possible, the widget will normally size
  /// itself to fit its parent, but when placed in a vertical list, it will take
  /// on the given height.
  ///
  /// This is useful when composing widgets that normally try to match their
  /// parents' size, so that they behave reasonably in lists (which are
  /// unbounded).
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=uVki2CIzBTs}
  ///
  /// See also:
  ///
  ///  * [ConstrainedBox], which applies its constraints in all cases, not just
  ///    when the incoming constraints are unbounded.
  ///  * [SizedBox], which lets you specify tight constraints by explicitly
  ///    specifying the height or width.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  LimitedBox limitedBox(
      {double maxWidth: double.infinity, double maxHeight: double.infinity}) {
    return LimitedBox(
      child: this,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }

  /// A widget that lays the child out as if it was in the tree, but without
  /// painting anything, without making the child available for hit testing, and
  /// without taking any room in the parent.
  ///
  /// Offstage children are still active: they can receive focus and have keyboard
  /// input directed to them.
  ///
  /// Animations continue to run in offstage children, and therefore use battery
  /// and CPU time, regardless of whether the animations end up being visible.
  ///
  /// [Offstage] can be used to measure the dimensions of a widget without
  /// bringing it on screen (yet). To hide a widget from view while it is not
  /// needed, prefer removing the widget from the tree entirely rather than
  /// keeping it alive in an [Offstage] subtree.
  ///
  /// See also:
  ///
  ///  * [Visibility], which can hide a child more efficiently (albeit less
  ///    subtly).
  ///  * [TickerMode], which can be used to disable animations in a subtree.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  Offstage offstage(bool offstage) {
    return Offstage(
      child: this,
      offstage: offstage,
    );
  }

  /// A widget that imposes different constraints on its child than it gets
  /// from its parent, possibly allowing the child to overflow the parent.
  ///
  /// See also:
  ///
  ///  * [RenderConstrainedOverflowBox] for details about how [OverflowBox] is
  ///    rendered.
  ///  * [SizedOverflowBox], a widget that is a specific size but passes its
  ///    original constraints through to its child, which may then overflow.
  ///  * [ConstrainedBox], a widget that imposes additional constraints on its
  ///    child.
  ///  * [UnconstrainedBox], a container that tries to let its child draw without
  ///    constraints.
  ///  * [SizedBox], a box with a specified size.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  OverflowBox overflowBox({
    AlignmentGeometry alignment: Alignment.center,
    double minWidth,
    double maxWidth,
    double minHeight,
    double maxHeight,
  }) {
    return OverflowBox(
      child: this,
      alignment: alignment,
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
    );
  }

  /// A box with a specified size.
  ///
  /// If given a child, this widget forces its child to have a specific width
  /// and/or height (assuming values are permitted by this widget's parent). If
  /// either the width or height is null, this widget will try to size itself to
  /// match the child's size in that dimension. If the child's size depends on the
  /// size of its parent, the height and width must be provided.
  ///
  /// If not given a child, [SizedBox] will try to size itself as close to the
  /// specified height and width as possible given the parent's constraints. If
  /// [height] or [width] is null or unspecified, it will be treated as zero.
  ///
  /// The [new SizedBox.expand] constructor can be used to make a [SizedBox] that
  /// sizes itself to fit the parent. It is equivalent to setting [width] and
  /// [height] to [double.infinity].
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=EHPu_DzRfqA}
  ///
  /// {@tool snippet}
  ///
  /// This snippet makes the child widget (a [Card] with some [Text]) have the
  /// exact size 200x300, parental constraints permitting:
  ///
  /// ```dart
  /// SizedBox(
  ///   width: 200.0,
  ///   height: 300.0,
  ///   child: const Card(child: Text('Hello World!')),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [ConstrainedBox], a more generic version of this class that takes
  ///    arbitrary [BoxConstraints] instead of an explicit width and height.
  ///  * [UnconstrainedBox], a container that tries to let its child draw without
  ///    constraints.
  ///  * [FractionallySizedBox], a widget that sizes its child to a fraction of
  ///    the total available space.
  ///  * [AspectRatio], a widget that attempts to fit within the parent's
  ///    constraints while also sizing its child to match a given aspect ratio.
  ///  * [FittedBox], which sizes and positions its child widget to fit the parent
  ///    according to a given [BoxFit] discipline.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  SizedBox sizedBox({
    AlignmentGeometry alignment: Alignment.center,
    double width,
    double height,
  }) {
    return SizedBox(
      child: this,
      width: width,
      height: height,
    );
  }

  /// A widget that is a specific size but passes its original constraints
  /// through to its child, which may then overflow.
  ///
  /// See also:
  ///
  ///  * [OverflowBox], A widget that imposes different constraints on its child
  ///    than it gets from its parent, possibly allowing the child to overflow the
  ///    parent.
  ///  * [ConstrainedBox], a widget that imposes additional constraints on its
  ///    child.
  ///  * [UnconstrainedBox], a container that tries to let its child draw without
  ///    constraints.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  SizedOverflowBox sizedOverflowBox(
      {@required Size size, AlignmentGeometry alignment: Alignment.center}) {
    return SizedOverflowBox(
      child: this,
      size: size,
      alignment: alignment,
    );
  }

  /// A widget that applies a transformation before painting its child.
  ///
  /// Unlike [RotatedBox], which applies a rotation prior to layout, this object
  /// applies its transformation just prior to painting, which means the
  /// transformation is not taken into account when calculating how much space
  /// this widget's child (and thus this widget) consumes.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=9z_YNlRlWfA}
  ///
  /// {@tool snippet}
  ///
  /// This example rotates and skews an orange box containing text, keeping the
  /// top right corner pinned to its original position.
  ///
  /// ```dart
  /// Container(
  ///   color: Colors.black,
  ///   child: Transform(
  ///     alignment: Alignment.topRight,
  ///     transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
  ///     child: Container(
  ///       padding: const EdgeInsets.all(8.0),
  ///       color: const Color(0xFFE8581C),
  ///       child: const Text('Apartment for rent!'),
  ///     ),
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [RotatedBox], which rotates the child widget during layout, not just
  ///    during painting.
  ///  * [FractionalTranslation], which applies a translation to the child
  ///    that is relative to the child's size.
  ///  * [FittedBox], which sizes and positions its child widget to fit the parent
  ///    according to a given [BoxFit] discipline.
  ///  * The [catalog of layout widgets](https://flutter.dev/widgets/layout/).
  Transform transform({
    @required Matrix4 transform,
    Offset origin,
    AlignmentGeometry alignment,
    bool transformHitTests: true,
  }) {
    return Transform(
      child: this,
      transform: transform,
      alignment: alignment,
      transformHitTests: transformHitTests,
    );
  }

  /// Creates a widget that transforms its child using a rotation around the
  /// center.
  ///
  /// The `angle` argument must not be null. It gives the rotation in clockwise
  /// radians.
  ///
  /// {@tool snippet}
  ///
  /// This example rotates an orange box containing text around its center by
  /// fifteen degrees.
  ///
  /// ```dart
  /// Transform.rotate(
  ///   angle: -math.pi / 12.0,
  ///   child: Container(
  ///     padding: const EdgeInsets.all(8.0),
  ///     color: const Color(0xFFE8581C),
  ///     child: const Text('Apartment for rent!'),
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [RotationTransition], which animates changes in rotation smoothly
  ///    over a given duration.
  Transform rotate(double angle) {
    return Transform.rotate(child: this, angle: angle);
  }

  /// Creates a widget that transforms its child using a translation.
  ///
  /// The `offset` argument must not be null. It specifies the translation.
  ///
  /// {@tool snippet}
  ///
  /// This example shifts the silver-colored child down by fifteen pixels.
  ///
  /// ```dart
  /// Transform.translate(
  ///   offset: const Offset(0.0, 15.0),
  ///   child: Container(
  ///     padding: const EdgeInsets.all(8.0),
  ///     color: const Color(0xFF7F7F7F),
  ///     child: const Text('Quarter'),
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  Transform translate({Offset offset, bool transformHitTests = true}) {
    return Transform.translate(
        child: this, offset: offset, transformHitTests: transformHitTests);
  }

  /// Creates a widget that scales its child uniformly.
  ///
  /// The `scale` argument must not be null. It gives the scalar by which
  /// to multiply the `x` and `y` axes.
  ///
  /// The [alignment] controls the origin of the scale; by default, this is
  /// the center of the box.
  ///
  /// {@tool snippet}
  ///
  /// This example shrinks an orange box containing text such that each dimension
  /// is half the size it would otherwise be.
  ///
  /// ```dart
  /// Transform.scale(
  ///   scale: 0.5,
  ///   child: Container(
  ///     padding: const EdgeInsets.all(8.0),
  ///     color: const Color(0xFFE8581C),
  ///     child: const Text('Bad Idea Bears'),
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [ScaleTransition], which animates changes in scale smoothly
  ///    over a given duration.
  Transform scale(
      {@required double scale,
      Offset origin,
      AlignmentGeometry alignment = Alignment.center,
      bool transformHitTests = true}) {
    return Transform.scale(
        child: this,
        scale: scale,
        origin: origin,
        transformHitTests: transformHitTests);
  }

  /// A widget that clips its child using an oval.
  ///
  /// By default, inscribes an axis-aligned oval into its layout dimensions and
  /// prevents its child from painting outside that oval, but the size and
  /// location of the clip oval can be customized using a custom [clipper].
  ///
  /// See also:
  ///
  ///  * [CustomClipper], for information about creating custom clips.
  ///  * [ClipRect], for more efficient clips without rounded corners.
  ///  * [ClipRRect], for a clip with rounded corners.
  ///  * [ClipPath], for an arbitrarily shaped clip.
  ClipOval clipOval(
      {CustomClipper<Rect> clipper, Clip clipBehavior: Clip.antiAlias}) {
    return ClipOval(
      clipper: clipper,
      clipBehavior: clipBehavior,
      child: this,
    );
  }

  /// A widget that clips its child using a path.
  ///
  /// Calls a callback on a delegate whenever the widget is to be
  /// painted. The callback returns a path and the widget prevents the
  /// child from painting outside the path.
  ///
  /// Clipping to a path is expensive. Certain shapes have more
  /// optimized widgets:
  ///
  ///  * To clip to a rectangle, consider [ClipRect].
  ///  * To clip to an oval or circle, consider [ClipOval].
  ///  * To clip to a rounded rectangle, consider [ClipRRect].
  ///
  /// To clip to a particular [ShapeBorder], consider using either the
  /// [ClipPath.shape] static method or the [ShapeBorderClipper] custom clipper
  /// class.
  ClipPath clipPath(
      {CustomClipper<Path> clipper, Clip clipBehavior: Clip.antiAlias}) {
    return ClipPath(clipper: clipper, clipBehavior: clipBehavior, child: this);
  }

  /// A widget that clips its child using a rectangle.
  ///
  /// By default, [ClipRect] prevents its child from painting outside its
  /// bounds, but the size and location of the clip rect can be customized using a
  /// custom [clipper].
  ///
  /// [ClipRect] is commonly used with these widgets, which commonly paint outside
  /// their bounds:
  ///
  ///  * [CustomPaint]
  ///  * [CustomSingleChildLayout]
  ///  * [CustomMultiChildLayout]
  ///  * [Align] and [Center] (e.g., if [Align.widthFactor] or
  ///    [Align.heightFactor] is less than 1.0).
  ///  * [OverflowBox]
  ///  * [SizedOverflowBox]
  ///
  /// {@tool snippet}
  ///
  /// For example, by combining a [ClipRect] with an [Align], one can show just
  /// the top half of an [Image]:
  ///
  /// ```dart
  /// ClipRect(
  ///   child: Align(
  ///     alignment: Alignment.topCenter,
  ///     heightFactor: 0.5,
  ///     child: Image.network(userAvatarUrl),
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  ///  * [CustomClipper], for information about creating custom clips.
  ///  * [ClipRRect], for a clip with rounded corners.
  ///  * [ClipOval], for an elliptical clip.
  ///  * [ClipPath], for an arbitrarily shaped clip.
  ClipRect clipRect(
      {CustomClipper<Rect> clipper, Clip clipBehavior: Clip.hardEdge}) {
    return ClipRect(clipper: clipper, clipBehavior: clipBehavior, child: this);
  }

  /// A widget that makes its child partially transparent.
  ///
  /// This class paints its child into an intermediate buffer and then blends the
  /// child back into the scene partially transparent.
  ///
  /// For values of opacity other than 0.0 and 1.0, this class is relatively
  /// expensive because it requires painting the child into an intermediate
  /// buffer. For the value 0.0, the child is simply not painted at all. For the
  /// value 1.0, the child is painted immediately without an intermediate buffer.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=9hltevOHQBw}
  ///
  /// {@tool snippet}
  ///
  /// This example shows some [Text] when the `_visible` member field is true, and
  /// hides it when it is false:
  ///
  /// ```dart
  /// Opacity(
  ///   opacity: _visible ? 1.0 : 0.0,
  ///   child: const Text("Now you see me, now you don't!"),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// This is more efficient than adding and removing the child widget from the
  /// tree on demand.
  ///
  /// ## Performance considerations for opacity animation
  ///
  /// Animating an [Opacity] widget directly causes the widget (and possibly its
  /// subtree) to rebuild each frame, which is not very efficient. Consider using
  /// an [AnimatedOpacity] instead.
  ///
  /// ## Transparent image
  ///
  /// If only a single [Image] or [Color] needs to be composited with an opacity
  /// between 0.0 and 1.0, it's much faster to directly use them without [Opacity]
  /// widgets.
  ///
  /// For example, `Container(color: Color.fromRGBO(255, 0, 0, 0.5))` is much
  /// faster than `Opacity(opacity: 0.5, child: Container(color: Colors.red))`.
  ///
  /// {@tool snippet}
  ///
  /// The following example draws an [Image] with 0.5 opacity without using
  /// [Opacity]:
  ///
  /// ```dart
  /// Image.network(
  ///   'https://raw.githubusercontent.com/flutter/assets-for-api-docs/master/packages/diagrams/assets/blend_mode_destination.jpeg',
  ///   color: Color.fromRGBO(255, 255, 255, 0.5),
  ///   colorBlendMode: BlendMode.modulate
  /// )
  /// ```
  ///
  /// {@end-tool}
  ///
  /// Directly drawing an [Image] or [Color] with opacity is faster than using
  /// [Opacity] on top of them because [Opacity] could apply the opacity to a
  /// group of widgets and therefore a costly offscreen buffer will be used.
  /// Drawing content into the offscreen buffer may also trigger render target
  /// switches and such switching is particularly slow in older GPUs.
  ///
  /// See also:
  ///
  ///  * [Visibility], which can hide a child more efficiently (albeit less
  ///    subtly, because it is either visible or hidden, rather than allowing
  ///    fractional opacity values).
  ///  * [ShaderMask], which can apply more elaborate effects to its child.
  ///  * [Transform], which applies an arbitrary transform to its child widget at
  ///    paint time.
  ///  * [AnimatedOpacity], which uses an animation internally to efficiently
  ///    animate opacity.
  ///  * [FadeTransition], which uses a provided animation to efficiently animate
  ///    opacity.
  ///  * [Image], which can directly provide a partially transparent image with
  ///    much less performance hit.
  Opacity opacity(double opacity) {
    return Opacity(child: this, opacity: opacity);
  }

  /// Applies a theme to descendant widgets.
  ///
  /// A theme describes the colors and typographic choices of an application.
  ///
  /// Descendant widgets obtain the current theme's [ThemeData] object using
  /// [Theme.of]. When a widget uses [Theme.of], it is automatically rebuilt if
  /// the theme later changes, so that the changes can be applied.
  ///
  /// The [Theme] widget implies an [IconTheme] widget, set to the value of the
  /// [ThemeData.iconTheme] of the [data] for the [Theme].
  ///
  /// See also:
  ///
  ///  * [ThemeData], which describes the actual configuration of a theme.
  ///  * [AnimatedTheme], which animates the [ThemeData] when it changes rather
  ///    than changing the theme all at once.
  ///  * [MaterialApp], which includes an [AnimatedTheme] widget configured via
  ///    the [MaterialApp.theme] argument.
  Theme theme({@required ThemeData data, bool isMaterialAppTheme: false}) {
    return Theme(
        child: this, data: data, isMaterialAppTheme: isMaterialAppTheme);
  }
}
