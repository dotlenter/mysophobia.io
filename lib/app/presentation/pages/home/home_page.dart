import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../core/plugins/bouncy/bouncy.dart';
import '../../../../core/plugins/iconx/icons_x_icons.dart';
import '../../../../core/routes/router.gr.dart';
import '../../../domain/entities/vaccines.dart';
import '../../cubits/vaccine/vaccine_cubit.dart';

class HomePage extends StatefulWidget {
  final VoidCallback onInfoPress;

  const HomePage({Key key, this.onInfoPress}) : super(key: key);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
  final RefreshController _refreshController = RefreshController();
  int candidates = 0;
  void _onLoading() {
    _refreshController.loadComplete();
  }

  void _onRefresh(BuildContext context) {
    context.bloc<VaccineCubit>()..fetchVaccines();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (_) => context.bloc<VaccineCubit>()..fetchVaccines(),
      child: BlocListener<VaccineCubit, VaccineState>(
        listener: (context, state) {
          state.map(
            initial: (_) {},
            loading: (_) {},
            loaded: (loaded) {
              setState(() {
                candidates = int.parse(loaded.vaccines.totalCandidates);
              });
            },
            error: (_) {},
          );
        },
        child: Column(
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
                            // Bouncy(
                            //   duration: const Duration(milliseconds: 100),
                            //   onPressed: () {},
                            //   child: Icon(
                            //     IconsX.comment_inv,
                            //     color: Colors.white.withOpacity(0.5),
                            //   ),,
                            // ),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Covid19 Vaccine Candidates',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            candidates.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                color: const Color(0xff273c75),
                child: SmartRefresher(
                  header: const ClassicHeader(
                    releaseIcon: Icon(Icons.refresh, color: Colors.white),
                    releaseText: 'Realease to refresh',
                    refreshingIcon:
                        SpinKitFadingCircle(color: Colors.black54, size: 24),
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
                      BlocBuilder<VaccineCubit, VaccineState>(
                        builder: (context, state) {
                          return state.map(
                            initial: (_) => _buildInitial(),
                            loading: (_) => _buildLoading(),
                            loaded: (loaded) =>
                                _buildVaccineList(loaded.vaccines),
                            error: (error) => _buildError(error.message),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildInitial() => SliverToBoxAdapter(child: Container());

  SliverList _buildVaccineList(Vaccines vaccines) {
    candidates = int.parse(vaccines.totalCandidates);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GestureDetector(
          onTap: () => ExtendedNavigator.of(context).push(Routes.vaccinePage,
              arguments: VaccinePageArguments(vaccine: vaccines.data[index])),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vaccines.data[index].candidate,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text(
                        'Trial Phase: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: colorMapper(vaccines.data[index].trialPhase),
                        ),
                        child: Text(
                          vaccines.data[index].trialPhase,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Institutions: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines
                          children: vaccines.data[index].institutions
                              .map(
                                (institute) => Text(
                                  institute + ' ',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sponsors: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Wrap(
                          spacing: 8.0, // gap between adjacent chips
                          runSpacing: 4.0, // gap between lines
                          children: vaccines.data[index].sponsors
                              .map(
                                (sponsors) => Text(
                                  sponsors + ' ',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    vaccines.data[index].details,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.fade,
                    maxLines: 5,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ),
        childCount: vaccines.data.length,
      ),
    );
  }

  SliverToBoxAdapter _buildLoading() {
    return const SliverToBoxAdapter(
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildError(String message) =>
      SliverToBoxAdapter(child: Container(child: Text(message)));

  Color colorMapper(String phase) {
    switch (phase) {
      case 'Phase 3':
        return Colors.green[300];
        break;
      case 'Phase 2/3':
        return Colors.green[200];
      default:
        return Colors.orangeAccent[100];
    }
  }

  @override
  bool get wantKeepAlive => true;
}
