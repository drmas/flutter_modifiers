# Flutter Modifiers

A collection of useful extension function that make your flutter code a lot cleaner.

## Why

Flutter is a very powerful tool, it provide you with a lot of widgets that have different use cases to help you build your app.

But because everything is designed to be a widget, you will find your code have so many nested widgets, which makes your code hard to read and understand from the first look.

Other tools like SwiftUI, and Jetpack Compose, have something called modifiers, which can provide some of functionality of Flutter widgets but in a simple way.

For example compare the following code

```swift
// SwiftUI Code
struct ContentView: View {
    var body: some View {
        VStack {
            Image("turtlerock")
              .clipShape(Circle())
              .offset(y: 10)
              .padding(.bottom, 10)

            Text("Turtle Rock")
              .padding()
        }
    }
}

```

```swift
// Flutter Code
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Transform.translate(
            child: ClipOval(
              child: Image.asset("turtlerock"),
            ),
            offset: Offset(0, 10.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Turtle Rock',
          ),
        )
      ],
    );
  }
}

```

You can clearly see the difference between both of them and how simple SwiftUI version is.

That's why I created these extension library which enables you to have the same result in simpler code.

Here is the same results but using modifiers

```swift
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/turtlerock.jpg")
            .clipOval()
            .translate(offset: Offset(0, 10))
            .padding(EdgeInsets.only(bottom: 10.0)),
        Text(
          'Turtle Rock',
        ).padding(),
      ],
    );
  }
}
```

## How to use

Import the library in your flutter file, then use the extensions function on any Widget

```swift
import 'package:flutter/material.dart';
import 'package:flutter_modifiers/modifiers.dart'; // <== add this import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset("assets/turtlerock.jpg")
            .clipOval() // <=== use any modifier
            .translate(offset: Offset(0, 10)) // <=== use any modifier
            .padding(EdgeInsets.only(bottom: 10.0)), // <=== use any modifier
        Text(
          'Turtle Rock',
        ).padding(),
      ],
    );
  }
}

```

## List of Modifiers

| Modifier             | Corrosponding Component | Description                                                                                                                                                             |
| -------------------- | ----------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| padding              | Padding                 | Add padding to parent widget. Default padding is `8.0`                                                                                                                  |
| center               | Center                  | Center parent widget                                                                                                                                                    |
| align                | Align                   | Align parent to specific alignement                                                                                                                                     |
| aspectRatio          | AspectRatio             | Size parent to a specific aspect ratio                                                                                                                                  |
| baseline             | Baseline                | Position parent to specific baseline                                                                                                                                    |
| constrainedBox       | ConstrainedBox          | Add additional constraint to parent                                                                                                                                     |
| expanded             | Expanded                | Expand parent in expands a child of a [Row], [Column], or [Flex]                                                                                                        |
| fittedBox            | FittedBox               | Scales and positions parent within itself according to [fit]                                                                                                            |
| fractionallySizedBox | FractionallySizedBox    | sizes its parent to a fraction of the total available space                                                                                                             |
| intrinsicHeight      | IntrinsicHeight         | Size its parent to parent's intrinsic height                                                                                                                            |
| intrinsicWidth       | IntrinsicWidth          | Size its parent to parent's intrinsic width                                                                                                                             |
| limitedBox           | LimitedBox              | Limit parent size only when it's unconstrained                                                                                                                          |
| offstage             | Offstage                | lays parent out as if it was in the tree, but without painting anything, without making the child available for hit testing, and without taking any room in the parent. |
| overflowBox          | OverflowBox             | Impose different constraints on its parent than it gets from its container, possibly allowing the parent to overflow the container                                      |
| sizedBox             | SizedBox                | Force parent to have a specific width and/or height                                                                                                                     |
| sizedOverflowBox     | SizedOverflowBox        | Specific size widget but passes its original constraints through to its parent, which may then overflow                                                                 |
| transform            | Transform               | Apply a transformation before painting its parent                                                                                                                       |
| rotate               | Transform               | Transform its parent using a rotation around the center                                                                                                                 |
| translate            | Transform               | Transforms its parent using a translation                                                                                                                               |
| scale                | Transform               | Scales its parent uniformly                                                                                                                                             |
| clipOval             | ClipOval                | Clip its child using an oval                                                                                                                                            |
| clipPath             | ClipPath                | Clip its child using a path                                                                                                                                             |
| clipRect             | ClipRect                | Clip its child using a rectangle                                                                                                                                        |
| opacity              | Opacity                 | Make its parent partially transparent                                                                                                                                   |
| theme                | Theme                   | Apply a theme to parent widget                                                                                                                                          |
