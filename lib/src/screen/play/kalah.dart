import 'package:flutter/material.dart';

class Kalah extends StatelessWidget {
  const Kalah({
    required this.stones,
    Key? key,
  }) : super(key: key);

  final int stones;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 200.0,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff563232)),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Text("$stones"),
      ),
    );
  }
}
