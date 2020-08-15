import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/plugins/responsive_size_util/responsive_size_util.dart';
import '../../cubits/disease_sh/diseasesh_cubit.dart';
import 'widgets/widgets.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage>
    with AutomaticKeepAliveClientMixin<GlobalPage> {
  RefreshController _refreshController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  void _onRefresh(BuildContext context) {
    setState(() {
      context.bloc<DiseaseshCubit>()..fetchGlobalTotals();
    });
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => context.bloc<DiseaseshCubit>()..fetchGlobalTotals(),
      child: SmartRefresher(
        header: const ClassicHeader(
          releaseIcon: Icon(Icons.refresh, color: Colors.white),
          releaseText: 'Realease to refresh',
          refreshingIcon: SpinKitFadingCircle(color: Colors.black54, size: 24),
          textStyle: TextStyle(
            color: Colors.white54,
          ),
        ),
        physics: const BouncingScrollPhysics(),
        controller: _refreshController,
        onRefresh: () => _onRefresh(context),
        onLoading: _onLoading,
        child: ListView(
          children: [
            BlocConsumer<DiseaseshCubit, DiseaseshState>(
              listener: (context, state) {
                state.map(
                  initial: (_) {},
                  loading: (_) {},
                  loaded: (loaded) => Scaffold.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green[300],
                      content: const Text(
                        'Data obtained from WorldOfMeter.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      duration: const Duration(seconds: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      behavior: SnackBarBehavior.floating,
                    ),
                  ),
                  error: (_) {},
                );
              },
              builder: (context, state) {
                return state.map(
                  initial: (_) => Container(),
                  loading: (_) => _buildLoading(),
                  loaded: (loaded) => _buildGlobal(loaded),
                  error: (e) => _buildError(e),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  DefaultTabController _buildGlobal(Loaded loaded) => DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Global',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        padding: const EdgeInsets.all(5),
                        child: CachedNetworkImage(
                          imageUrl: 'https://i.ibb.co/jkR75Q7/pngfuel-com.png',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(
                            strokeWidth: 2.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.green[300]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TabBar(
                    labelColor: Colors.white,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ResponsiveSizeUtil.getInstance().setSp(30),
                    ),
                    indicatorColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.white.withOpacity(0.5),
                    isScrollable: true,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    tabs: <Widget>[
                      const Tab(
                        text: 'Total',
                      ),
                      const Tab(
                        text: 'Today',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 650,
              child: TabBarView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: <Widget>[
                  TotalWidget(global: loaded.total),
                  TodayWidget(today: loaded.total),
                ],
              ),
            ),
          ],
        ),
      );
  Container _buildError(Error e) {
    return Container(
      child: Text(e.toString()),
    );
  }

  Column _buildLoading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SpinKitChasingDots(
          color: Colors.white,
        ),
      ],
    );
  }
}
