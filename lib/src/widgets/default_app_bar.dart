import 'package:flutter/material.dart';
import 'package:navigation_service/navigation_service.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? titleWidget;
  final String? title;
  final IconData? leadingIcon;
  final EdgeInsetsGeometry? padding;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final List<Widget>? actions;

  DefaultAppBar({
    super.key,
    this.leading,
    this.titleWidget,
    this.titleTextStyle,
    this.actions,
    this.leadingIcon,
    this.padding,
    this.backgroundColor,
    this.title,
  }) : preferredSize = PreferredAppBarSize(60, null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsetsDirectional.only(
            end: 10,
            top: 10,
          ),
      child: AppBar(
        backgroundColor: backgroundColor ?? CoreColors.white,
        forceMaterialTransparency: true,
        leading: leading ??
            GestureDetector(
              onTap: () => NavigationService.pop(),
              child: Icon(
                leadingIcon ?? Icons.arrow_back_ios_new,
              ),
            ),
        actions: actions,
        title: titleWidget ??
            Text(
              title ?? "",
              style: titleTextStyle ??
                  const TextStyle(
                    color: CoreColors.black,
                    fontSize: 25,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
      ),
    );
  }

  @override
  final Size preferredSize;
}

class PreferredAppBarSize extends Size {
  PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            ((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0)));

  final double? toolbarHeight;
  final double? bottomHeight;
}
