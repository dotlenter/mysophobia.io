library bouncy;

import 'package:flutter/material.dart';

class Bouncy extends StatefulWidget {
  /// Child that will receive the bouncing animation
  final Widget child;

  /// Callback on click event
  final VoidCallback onPressed;

  /// Scale factor
  ///  < 0 => the bouncing will be reversed and widget will grow
  ///    1 => default value
  ///  > 1 => increase the bouncing effect
  final double scaleFactor;

  final Duration duration;

  ///
  ///A widget wrapper that makes your widget looks like it's bouncing.
  ///
  ///Not setting duration will have a default value like;
  ///
  /// ```
  /// Duration(millisecons: 200)
  /// ```
  ///
  ///Not setting scaleFactor will have a default scaleFactor value of 1.
  const Bouncy({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.scaleFactor = 1,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  @override
  _BouncyState createState() => _BouncyState();
}

class _BouncyState extends State<Bouncy> with SingleTickerProviderStateMixin {
  //// Animation controller
  AnimationController _controller;

  /// View scale used in order to make the bouncing animation
  double _scale;

  /// Key of the given child used to get its size and position whenever we need
  final GlobalKey _childKey = GlobalKey();

  /// If the touch position is outside or not of the given child
  bool _isOutside = false;

  /// Simple getter on widget's child
  Widget get child => widget.child;

  /// Simple getter on widget's onPressed callback
  VoidCallback get onPressed => widget.onPressed;

  /// Simple getter on widget's scaleFactor
  double get scaleFactor => widget.scaleFactor;

  /// Simple getter on widget's animation duration
  Duration get duration => widget.duration;

  /// We instantiate the animation controller
  /// The idea is to call setState() each time the controller's
  /// value changes
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: duration,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Each time the [_controller]'s value changes, build() will be called
  /// We just have to calculate the appropriate scale from the controller value
  /// and pass it to our Transform.scale widget
  @override
  Widget build(BuildContext context) {
    _scale = 1 - (_controller.value * scaleFactor);
    return Listener(
      onPointerDown: _onTapDown,
      onPointerUp: _onTapUp,
      onPointerMove: _onPointerMove,
      child: Transform.scale(
        key: _childKey,
        scale: _scale,
        child: child,
      ),
    );
  }

  /// Simple method called when we need to notify the user of a press event
  void _triggerOnPressed() {
    if (onPressed != null) {
      onPressed();
    }
  }

  /// We start the animation
  void _onTapDown(PointerDownEvent event) {
    _controller.forward();
  }

  /// We reverse the animation and notify the user of a press event
  void _onTapUp(PointerUpEvent event) {
    Future.delayed(duration, () {
      if (!_isOutsideChildBox(event.position)) {
        _triggerOnPressed();
      }
      _controller.reverse();
    });
  }

  /// Here we are listening on each change when drag event is triggered
  /// We must keep the [_isOutside] value updated in order to use it later
  void _onPointerMove(PointerMoveEvent event) {
    final Offset touchPosition = event.position;
    _isOutside = _isOutsideChildBox(touchPosition);
    if (_isOutside) {
      _controller.reverse();
      return;
    }
  }

  /// When this callback is triggered, we reverse the animation
  /// As we do not have position details, we use the [_isOutside] field to know
  /// if we need to notify the user of a press event
  // void _onPointerCancel(PointerCancelEvent event) {
  //   final Offset touchPosition = event.position;
  //   _isOutside = _isOutsideChildBox(touchPosition);
  // }

  /// Method called when we need to now if a specific touch position is inside the given
  /// child render box
  bool _isOutsideChildBox(Offset touchPosition) {
    try {
      final RenderBox childRenderBox =
          _childKey.currentContext.findRenderObject() as RenderBox;
      final Size childSize = childRenderBox.size;
      final Offset childPosition = childRenderBox.localToGlobal(Offset.zero);

      return touchPosition.dx < childPosition.dx ||
          touchPosition.dx > childPosition.dx + childSize.width ||
          touchPosition.dy < childPosition.dy ||
          touchPosition.dy > childPosition.dy + childSize.height;
    } catch (e) {
      return true;
    }
  }
}
