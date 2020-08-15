part of 'widgets.dart';

class TodayWidget extends StatelessWidget {
  final CountryTotals total;

  const TodayWidget({Key key, this.total}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###');
    return Column(
      children: [
        Row(
          children: [
            ExpandedColorCardStatus(
              color: const Color(0xffffb259),
              title: 'Cases',
              statusText: formatter.format(total.todayCases),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
            ExpandedColorCardStatus(
              color: const Color(0xffff5959),
              title: 'Deaths',
              statusText: formatter.format(total.todayDeaths),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
          ],
        ),
        Row(
          children: [
            ExpandedColorCardStatus(
              color: const Color(0xff4cd97b),
              title: 'Recovered',
              statusText: formatter.format(total.todayRecovered),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
