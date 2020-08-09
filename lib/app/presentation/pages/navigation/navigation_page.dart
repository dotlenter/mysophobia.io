import 'package:flutter/material.dart';

import '../../../../core/plugins/iconx/icons_x_icons.dart';
import '../../../../core/plugins/responsive_size_util/responsive_size_util.dart';
import 'widgets/widgets.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BarItem> barItems = [
      BarItem(
        text: 'Home',
        icon: IconsX.home,
        color: Colors.blue,
        pageWidget: Container(
          color: Colors.red[300],
        ),
      ),
      BarItem(
        text: 'Find',
        icon: IconsX.search_2,
        color: Colors.blue,
        pageWidget: Container(
          color: Colors.indigoAccent[300],
        ),
      ),
      BarItem(
        text: 'Menu',
        icon: Icons.menu,
        color: Colors.blue,
        pageWidget: Container(
          color: Colors.green[300],
        ),
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          curve: Curves.bounceIn,
          child: barItems[selectedBarIndex].pageWidget,
        ),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        barItems: barItems,
        animationDuration: const Duration(milliseconds: 120),
        barStyle: BarStyle(
          fontSize: ResponsiveSizeUtil.getInstance().setSp(28),
          iconSize: 28.0,
        ),
        onBarTap: (int index) {
          setState(
            () {
              selectedBarIndex = index;
            },
          );
        },
      ),
    );
  }
}
