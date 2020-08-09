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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
      final bool isSelected = selectedBarIndex == i;
      _barItems.add(InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
          duration: widget.animationDuration,
          decoration: isSelected
              ? BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Color(0xFF00cec9),
                    ],
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00cec9).withAlpha(70),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: const Offset(
                        0.0,
                        2.0,
                      ),
                    ),
                  ],
                )
              : const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
          child: Bouncy(
            duration: const Duration(milliseconds: 20),
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Icon(
                  item.icon,
                  color: isSelected ? Colors.white : Colors.black54,
                  size: widget.barStyle.iconSize,
                ),
                SizedBox(
                  width: ResponsiveSizeUtil.getInstance().setWidth(20),
                ),
                AnimatedSize(
                  duration: widget.animationDuration,
                  curve: Curves.easeInOut,
                  vsync: this,
                  child: Text(
                    isSelected ? item.text : '',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: widget.barStyle.fontFamily,
                        fontWeight: widget.barStyle.fontWeight,
                        fontSize: widget.barStyle.fontSize),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
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
  Color color;
  Widget pageWidget;

  BarItem({this.text, this.icon, this.color, this.pageWidget});
}
