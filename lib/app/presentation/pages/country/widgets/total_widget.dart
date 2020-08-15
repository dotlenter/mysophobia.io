part of 'widgets.dart';

class TotalWidget extends StatelessWidget {
  final CountryTotals total;

  const TotalWidget({Key key, this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ExpandedColorCardStatus(
              color: const Color(0xffffb259),
              title: 'Cases',
              statusText: total.cases.toString(),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
            ExpandedColorCardStatus(
              color: const Color(0xffff5959),
              title: 'Deaths',
              statusText: total.deaths.toString(),
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
              statusText: total.recovered.toString(),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
            ExpandedColorCardStatus(
              color: const Color(0xff4cb5ff),
              title: 'Active',
              statusText: total.active.toString(),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
            ExpandedColorCardStatus(
              color: const Color(0xff9059ff),
              title: 'Serious',
              statusText: total.critical.toString(),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
          ],
        ),
      ],
    );
  }
}
