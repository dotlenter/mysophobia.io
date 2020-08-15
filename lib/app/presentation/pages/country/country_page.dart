import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/plugins/bouncy/bouncy.dart';
import '../../../../core/plugins/responsive_size_util/responsive_size_util.dart';
import '../../../../injection.dart';
import '../../cubits/country/country_cubit.dart';
import 'widgets/widgets.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage>
    with AutomaticKeepAliveClientMixin<CountryPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  void _onLoading() {
    _refreshController.loadComplete();
  }

  void _onRefresh(BuildContext context) {
    context.bloc<CountryCubit>()..fetchCountryTotals();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => context.bloc<CountryCubit>()..fetchCountryTotals(),
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
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BlocConsumer<CountryCubit, CountryState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return state.map(
                    initial: (_) => _loadCountryTotals(),
                    loading: (_) => _buildLoading(),
                    loaded: (loaded) => _buildMyCountry(loaded),
                    permissionDenied: (_) => _buildRequestLocation(),
                    error: (e) => _buildError(e),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  DefaultTabController _buildMyCountry(Loaded loaded) {
    return DefaultTabController(
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
                    Text(
                      loaded.countryTotal.country,
                      style: const TextStyle(
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
                        imageUrl: loaded.countryTotal.countryInfo.flag,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(
                          strokeWidth: 2.0,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green[300]),
                        ),
                      ),
                    ),
                  ],
                ),
                TabBar(
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveSizeUtil.getInstance().setSp(32),
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
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: TabBarView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: <Widget>[
                TotalWidget(total: loaded.countryTotal),
                TodayWidget(total: loaded.countryTotal),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Container _testWidget() {
  //   return Container(
  //       child: const Text(
  //     'Test Miracle',
  //     style: TextStyle(
  //       color: Colors.white,
  //       fontSize: 24,
  //     ),
  //   ));
  // }

  Container _buildRequestLocation() {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            'The app needs your location to load your country\'s data.'
            ' Your location will only be use for this instance.',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveSizeUtil.getInstance().setSp(38),
            ),
          ),
          const SizedBox(height: 10),
          Bouncy(
            duration: const Duration(milliseconds: 100),
            onPressed: () => g<CountryCubit>()..fetchCountryTotals(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Allow Access',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ResponsiveSizeUtil.getInstance().setSp(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildError(Error e) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Text(
        e.error,
        style: TextStyle(
          color: Colors.white,
          fontSize: ResponsiveSizeUtil.getInstance().setSp(38),
        ),
      ),
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

  BlocProvider<CountryCubit> _loadCountryTotals() {
    return BlocProvider(
      create: (_) => g<CountryCubit>()..fetchCountryTotals(),
      child: Container(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
