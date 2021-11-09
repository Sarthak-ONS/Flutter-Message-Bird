import 'package:flutter/cupertino.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({Key? key, this.height = 10}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
