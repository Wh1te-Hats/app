import 'package:flutter/material.dart';

class customText extends StatefulWidget {
  final Color colors;
  final String text;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;

  const customText(this.text, this.colors, this.fontSize, this.padding,
      this.fontWeight, this.fontStyle);

  @override
  State<customText> createState() => _customTextState();
}

class _customTextState extends State<customText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      child: Text(
        widget.text,
        // style: Theme.of(context).textTheme.headline6,
        style: Theme.of(context).textTheme.headline6?.merge(
              TextStyle(
                fontSize: widget.fontSize,
                fontWeight: widget.fontWeight,
                color: widget.colors,
                fontStyle: widget.fontStyle,
              ),
            ),
      ),
    );
  }
}