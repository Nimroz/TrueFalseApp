import 'package:flutter/material.dart';


class FLatButton extends StatelessWidget {
  var color;
  var onTap;
  String trueFalse = '';

   FLatButton(this.color, this.onTap, this.trueFalse, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 180,
        width: 90,
        decoration: BoxDecoration(
          border: Border.all(),
          color: color,
        ),
        child: Center(
          child: Text(
            trueFalse,
            textAlign: TextAlign.center,
            style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          ),
        ),
      ),
    );
  }
}
