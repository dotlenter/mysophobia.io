import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/plugins/bouncy/bouncy.dart';
import '../../../../core/plugins/iconx/icons_x_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController();

  void _onLoading() {
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            color: Colors.white,
            child: SmartRefresher(
              header: const ClassicHeader(
                releaseIcon: Icon(Icons.refresh, color: Colors.black54),
                releaseText: 'Realease to refresh',
                refreshingIcon:
                    SpinKitFadingCircle(color: Colors.black54, size: 24),
                textStyle: TextStyle(
                  color: Colors.white54,
                ),
              ),
              physics: const BouncingScrollPhysics(),
              controller: _refreshController,
              onRefresh: () {},
              onLoading: _onLoading,
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {},
                      childCount: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
