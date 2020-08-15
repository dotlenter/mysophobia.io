part of 'widgets.dart';

class TotalWidget extends StatelessWidget {
  final CountryTotals total;

  const TotalWidget({Key key, this.total}) : super(key: key);

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
              statusText: formatter.format(total.cases),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
            ExpandedColorCardStatus(
              color: const Color(0xffff5959),
              title: 'Deaths',
              statusText: formatter.format(total.deaths),
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
              statusText: formatter.format(total.recovered),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
            ExpandedColorCardStatus(
              color: const Color(0xff4cb5ff),
              title: 'Active',
              statusText: formatter.format(total.active),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
            ExpandedColorCardStatus(
              color: const Color(0xff9059ff),
              title: 'Serious',
              statusText: formatter.format(total.critical),
              titleSize: ResponsiveSizeUtil.getInstance().setSp(26),
              statusTextSize: ResponsiveSizeUtil.getInstance().setSp(32),
            ),
          ],
        ),
      ],
    );
  }
}
