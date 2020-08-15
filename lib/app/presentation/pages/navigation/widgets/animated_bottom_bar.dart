part of 'widgets.dart';

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;
  final BarStyle barStyle;

  const AnimatedBottomBar({
    this.barItems,
    this.animationDuration = const Duration(milliseconds: 500),
    this.onBarTap,
    this.barStyle,
  });

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    final List<Widget> _barItems = [];
    for (int i = 0; i < widget.barItems.length; i++) {
      final BarItem item = widget.barItems[i];
      final bool isSelected = (selectedBarIndex == i);
      _barItems.add(
        InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedBarIndex = i;
              widget.onBarTap(selectedBarIndex);
            });
          },
          child: Bouncy(
            duration: const Duration(milliseconds: 20),
            onPressed: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  item.icon,
                  color: isSelected
                      ? const Color(0xff273c75)
                      : const Color(0xff273c75).withOpacity(0.4),
                  size: widget.barStyle.iconSize,
                ),
                Text(
                  item.text,
                  style: TextStyle(
                    color: isSelected
                        ? const Color(0xff273c75)
                        : const Color(0xff273c75).withOpacity(0.4),
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return _barItems;
  }
}

class BarStyle {
  final double fontSize, iconSize;
  final FontWeight fontWeight;
  final String fontFamily;

  BarStyle({
    this.fontSize = 28.0,
    this.iconSize = 12,
    this.fontWeight = FontWeight.w600,
    this.fontFamily = 'HNB',
  });
}

class BarItem {
  String text;
  IconData icon;
  IconData selectedIcon;
  Color color;
  Widget pageWidget;

  BarItem({
    this.text,
    @required this.icon,
    @required this.color,
    this.selectedIcon,
    this.pageWidget,
  });
}
