import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../core/plugins/bouncy/bouncy.dart';
import '../../../../core/plugins/iconx/icons_x_icons.dart';
import '../../../../core/plugins/responsive_size_util/responsive_size_util.dart';
import '../country/country_page.dart';
import '../global/global_page.dart';

class StatisticPage extends StatefulWidget {
  @override
  _StatisticPageState createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage>
    with AutomaticKeepAliveClientMixin<StatisticPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Color(0xff273c75),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 18, 12, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'MYSO.IO',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'BJohn',
                      fontSize: 22,
                    ),
                  ),
                  Row(
                    children: [
                      Bouncy(
                        duration: const Duration(milliseconds: 100),
                        onPressed: () {},
                        child: Icon(
                          IconsX.comment_inv,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      const SizedBox(width: 25),
                      Bouncy(
                        duration: const Duration(milliseconds: 100),
                        onPressed: () {},
                        child: Icon(
                          IconsX.info,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TabBar(
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.black,
                      indicator: const BubbleTabIndicator(
                        indicatorHeight: 45.0,
                        indicatorColor: Colors.white,
                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      ),
                      tabs: [
                        Text(
                          'Global',
                          style: TextStyle(
                            fontSize:
                                ResponsiveSizeUtil.getInstance().setSp(32),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'My Country',
                          style: TextStyle(
                            fontSize:
                                ResponsiveSizeUtil.getInstance().setSp(32),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                children: [
                  GlobalPage(),
                  CountryPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
