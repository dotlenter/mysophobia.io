part of 'widgets.dart';

class CircularPulsatingContainer extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final EdgeInsets padding;
  final double width;
  final double height;
  final Color color;
  final Color pulseColor;

  const CircularPulsatingContainer({
    Key key,
    @required this.duration,
    @required this.child,
    this.padding,
    this.width,
    this.height,
    this.color,
    @required this.pulseColor,
  }) : super(key: key);
  @override
  _CircularPulsatingContainerState createState() =>
      _CircularPulsatingContainerState();
}

class _CircularPulsatingContainerState extends State<CircularPulsatingContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? const EdgeInsets.all(10),
      width: widget.width ?? 80,
      height: widget.height ?? 80,
      decoration: BoxDecoration(
        color: widget.color ?? Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: widget.pulseColor ?? Colors.green[300].withOpacity(0.2),
            spreadRadius: _animation.value,
            blurRadius: _animation.value,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: widget.child,
    );
  }
}
