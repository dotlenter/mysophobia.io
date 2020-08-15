part of 'widgets.dart';

class CryptoAddressWidget extends StatelessWidget {
  final String coinType;
  final String addressText;
  final Color color;
  final VoidCallback onCopy;

  const CryptoAddressWidget({
    Key key,
    @required this.coinType,
    @required this.addressText,
    this.color,
    @required this.onCopy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: color ?? Colors.green[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              coinType,
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveSizeUtil.getInstance().setSp(30),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              addressText,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: ResponsiveSizeUtil.getInstance().setSp(26),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Bouncy(
            duration: const Duration(milliseconds: 100),
            onPressed: () => onCopy(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                'Copy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveSizeUtil.getInstance().setSp(24),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
