

import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;

const  LoadingWidget({super.key, this.height = 40, this
      .width = 40,this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ,
        height: height ,
        child: CircularProgressIndicator.adaptive(
          backgroundColor: color,
          strokeCap: StrokeCap.round,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
