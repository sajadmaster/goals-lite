import 'package:cupertino_tabbar/cupertino_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:goals_lite/_shared/my_strings.dart';

enum ChartTabEnum {
  week,
  month,
}

class ChartTabbar extends StatefulWidget {
  final Function onChanged;
  ChartTabbar({required this.onChanged});

  @override
  _ChartTabbarState createState() => _ChartTabbarState();
}

class _ChartTabbarState extends State<ChartTabbar> {
  int cupertinoTabBarValue = 0;
  int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: CupertinoTabBar(
        Colors.black12,
        Colors.white,
        const [
          Text(
            WEEK,
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
          Text(
            MONTH,
            textAlign: TextAlign.center,
          ),
          // Text(
          //   YEAR,
          //   textAlign: TextAlign.center,
          // ),
        ],
        cupertinoTabBarValueGetter,
        (int index) {
          setState(() {
            cupertinoTabBarValue = index;
            widget.onChanged(index);
            print('Inside Chart: Tabbar Changed to $index');
          });
        },
        useShadow: false,
        innerHorizontalPadding: 20,
        innerVerticalPadding: 8,
      ),
    );
  }
}

// class _ChartTabbarState extends State<ChartTabbar> {
//   int cupertinoTabBarValue = 0;
//   int cupertinoTabBarValueGetter() => cupertinoTabBarValue;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CupertinoTabBar(
//             black1,
//             Colors.white,
//             const [
//               Text(
//                 WEEK,
//               ),
//               Text(
//                 MONTH,
//               ),
//               Text(
//                 YEAR,
//               ),
//             ],
//             cupertinoTabBarValueGetter,
//             (int index) {
//               setState(() {
//                 cupertinoTabBarValue = index;
//               });
//             },
//             useShadow: false,
//             innerHorizontalPadding: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
