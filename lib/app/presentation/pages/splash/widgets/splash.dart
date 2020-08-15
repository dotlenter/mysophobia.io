part of 'widgets.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/myso_dark.png'),
            width: 110,
            height: 110,
          ),
          const SizedBox(height: 12),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                fontFamily: 'BJohn',
                fontSize: 26,
                color: Colors.black54,
              ),
              children: [
                TextSpan(text: 'Mysophobia'),
                TextSpan(
                  text: '.',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'IO',
                  style: TextStyle(color: Color(0xff273c75)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
