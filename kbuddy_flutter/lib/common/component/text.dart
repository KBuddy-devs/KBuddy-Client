import 'package:flutter/material.dart';

class FlexText extends StatelessWidget {
  final String content;
  final int? maxLines;
  final int? minLines;
  final Color? fontColor;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final ScrollPhysics? scrollPhysics;
  final bool isSelectable;
  final TextStyle? textStyle;

  const FlexText({
    super.key,
    required this.content,
    this.maxLines,
    this.minLines,
    this.fontColor,
    this.fontWeight,
    this.overflow,
    this.isSelectable = false,
    this.scrollPhysics,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle finalStyle = (textStyle ?? const TextStyle()).copyWith(
      color: fontColor ?? textStyle?.color,
      fontWeight: fontWeight ?? textStyle?.fontWeight,
    );

    if (isSelectable) {
      return SelectableText(
        content,
        style: finalStyle,
        scrollPhysics: scrollPhysics ?? const AlwaysScrollableScrollPhysics(),
        maxLines: maxLines,
        minLines: minLines,
        textAlign: TextAlign.start,
      );
    }

    return Text(
      content,
      style: finalStyle,
      maxLines: maxLines ?? 3,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}
