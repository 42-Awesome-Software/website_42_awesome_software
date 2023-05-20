import 'package:flutter/material.dart';

class CustomButtonOptions {
  const CustomButtonOptions({
    this.textStyle,
    this.elevation,
    this.height,
    this.width,
    this.padding,
    this.color,
    this.disabledColor,
    this.disabledTextColor,
    this.splashColor,
    this.iconSize,
    this.iconColor,
    this.iconPadding,
    this.borderRadius,
    this.borderSide,
    this.hoverColor,
    this.hoverBorderSide,
    this.hoverTextColor,
    this.hoverElevation,
  });

  final TextStyle? textStyle;
  final double? elevation;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final Color? splashColor;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? iconPadding;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Color? hoverColor;
  final BorderSide? hoverBorderSide;
  final Color? hoverTextColor;
  final double? hoverElevation;
}

class CustomIconButton extends StatefulWidget {
  const CustomIconButton(
      {super.key,
      required this.label,
      required this.iconPath,
      required this.onPressed,
      required this.options});

  final String label;
  final String iconPath;
  final Function() onPressed;
  final CustomButtonOptions options;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ButtonStyle(
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
        (states) {
          if (states.contains(MaterialState.hovered) &&
              widget.options.hoverBorderSide != null) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: widget.options.hoverBorderSide!,
            );
          }
          return RoundedRectangleBorder(
            borderRadius:
                widget.options.borderRadius ?? BorderRadius.circular(8),
            side: widget.options.borderSide ?? BorderSide.none,
          );
        },
      ),
      foregroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled) &&
              widget.options.disabledTextColor != null) {
            return widget.options.disabledTextColor;
          }
          if (states.contains(MaterialState.hovered) &&
              widget.options.hoverTextColor != null) {
            return widget.options.hoverTextColor;
          }
          return widget.options.textStyle?.color;
        },
      ),
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          if (states.contains(MaterialState.disabled) &&
              widget.options.disabledColor != null) {
            return widget.options.disabledColor;
          }
          if (states.contains(MaterialState.hovered) &&
              widget.options.hoverColor != null) {
            return widget.options.hoverColor;
          }
          return widget.options.color;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.pressed)) {
          return widget.options.splashColor;
        }
        return null;
      }),
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0)),
      elevation: MaterialStateProperty.resolveWith<double?>(
        (states) {
          if (states.contains(MaterialState.hovered) &&
              widget.options.hoverElevation != null) {
            return widget.options.hoverElevation!;
          }
          return widget.options.elevation;
        },
      ),
    );

    return SizedBox(
      height: widget.options.height,
      width: widget.options.width,
      child: ElevatedButton.icon(
        style: style,
        label: Text(widget.label, style: widget.options.textStyle),
        onPressed: widget.onPressed,
        icon: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: widget.options.iconPadding ?? EdgeInsets.zero,
            child: ImageIcon(
              color:
                  widget.options.iconColor ?? widget.options.textStyle!.color,
              size: widget.options.iconSize,
              AssetImage(
                widget.iconPath,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
