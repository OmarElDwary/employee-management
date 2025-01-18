import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info(
      {super.key,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.t1,
      required this.t2,
      required this.t3});
  final String title1;
  final String title2;
  final String title3;
  final String t1;
  final String t2;
  final String t3;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              title1,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            Text(
              t1,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            )
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text(
              title2,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            Text(
              t2,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            )
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text(
              title3,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            Text(
              t3,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            )
          ],
        ),
      ],
    );
  }
}
