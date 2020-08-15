part of 'widgets.dart';

class TodayWidget extends StatelessWidget {
  final GlobalTotals today;

  const TodayWidget({Key key, this.today}) : super(key: key);
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
              statusText: formatter.format(today.todayCases),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
            ExpandedColorCardStatus(
              color: const Color(0xffff5959),
              title: 'Deaths',
              statusText: formatter.format(today.todayDeaths),
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
              statusText: formatter.format(today.todayRecovered),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
          ],
        ),
      ],
    );
  }
}
