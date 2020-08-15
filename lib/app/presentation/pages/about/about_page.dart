import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/plugins/bouncy/bouncy.dart';
import '../../../../core/plugins/iconx/icons_x_icons.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onRefresh() async {
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://image.freepik.com/free-vector/programming-concept-illustration_114360-1325.jpg',
      placeholder: (context, url) => Column(
        children: [
          Shimmer.fromColors(
            baseColor: const Color(0xFFBBBBBB),
            highlightColor: const Color(0xFFFFFFFF),
            child: Container(
              width: 120,
              height: 20,
            ),
          ),
          Shimmer.fromColors(
            baseColor: const Color(0xFFBBBBBB),
            highlightColor: const Color(0xFFFFFFFF),
            child: Container(),
          ),
        ],
      ),
      imageBuilder: (context, imageProvider) => Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: imageProvider,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(12, 18, 12, 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'MYSO.IO',
                    style: TextStyle(
                      color: Color(0xff273c75),
                      fontFamily: 'BJohn',
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SmartRefresher(
                header: const ClassicHeader(
                  refreshingText: 'Nothing to refresh.',
                  releaseIcon: Icon(IconsX.emo_laugh),
                  releaseText: 'Nothing to refresh really...',
                  completeText: 'Told you so...',
                  completeIcon:
                      Icon(IconsX.emo_sunglasses, color: Colors.black54),
                  refreshingIcon:
                      SpinKitFadingCircle(color: Colors.black54, size: 24),
                  textStyle: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                physics: const BouncingScrollPhysics(),
                controller: _refreshController,
                onRefresh: _onRefresh,
                onLoading: _onLoading,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          _buildAboutCards(
                            'The Developers',
                            'Get to know the people behind this humble app.',
                            Colors.green[300],
                          ),
                          _buildAboutCards(
                            'Buy us a coffee',
                            'It would be nice if we get a coffee for making this, even a bit of appreciation helps us to keep going.',
                            Colors.lightBlue[200],
                          ),
                          _buildAboutCards(
                            'Contact us',
                            'Anything you have in mind? Found a bug in the app? Want improvements? Need any help? Contact us!',
                            Colors.red[300],
                          ),
                          _buildAboutCards(
                            'Want to be one of us?',
                            'Got an idea you think is good for free? Let\'s make it open source. We can help you!',
                            const Color(0xff273c75),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildAboutCards(String title, String description, Color glowColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: glowColor.withOpacity(0.2),
              spreadRadius: 8.0,
              blurRadius: 4.0,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
