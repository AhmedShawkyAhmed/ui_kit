import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class DefaultSwitch extends StatefulWidget {
  const DefaultSwitch({
    super.key,
    required this.onChanged,
    required this.valueData,
    this.activeColor,
    this.iconColor,
  });

  final bool? valueData;
  final void Function(bool)? onChanged;
  final Color? activeColor;
  final Color? iconColor;

  @override
  State<DefaultSwitch> createState() => _DefaultSwitchState();
}

class _DefaultSwitchState extends State<DefaultSwitch> {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: widget.valueData!,
      onChanged: (bool value) {
        setState(
          () => widget.onChanged?.call(value),
        );
      },
      activeColor: widget.activeColor ?? CoreColors.blue,
      activeTrackColor: widget.activeColor ?? CoreColors.blue,
      inactiveTrackColor: CoreColors.lightGrey,
      trackOutlineWidth: WidgetStateProperty.all(0),
      trackColor: WidgetStateProperty.all(
        widget.valueData!
            ? widget.activeColor ?? CoreColors.blue
            : CoreColors.lightGrey,
      ),
      trackOutlineColor: WidgetStateProperty.all(
        widget.valueData!
            ? widget.activeColor ?? CoreColors.blue
            : CoreColors.lightGrey,
      ),
      thumbColor: WidgetStateProperty.all(
        widget.iconColor ?? CoreColors.white,
      ),
      thumbIcon: WidgetStateProperty.all(
        Icon(
          Icons.circle,
          color: widget.iconColor ?? CoreColors.white,
        ),
      ),
    );
  }
}
