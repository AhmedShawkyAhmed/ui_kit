import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/src/styles/core_colors.dart';

class DefaultDropdown<T> extends StatelessWidget {
  const DefaultDropdown({
    super.key,
    required this.items,
    this.selectedItem,
    this.hint,
    this.hintStyle,
    this.enabled = true,
    this.hasBorder = false,
    this.border,
    this.hasShadow = true,
    this.filled = true,
    this.isCollapsed = true,
    this.showSearchBox = false,
    this.itemHeight = 30,
    this.maxHeight,
    this.dropDownKey,
    this.enabledColor,
    this.selectedTextStyle,
    this.dropdownTextStyle,
    this.iconSize,
    this.decoration,
    this.fillColor,
    this.disabledFillColor,
    this.borderRadius,
    this.itemAsString,
    this.fontSize,
    this.selectedAlign,
    this.dropdownAlign,
    this.onChanged,
    this.dropdownButtonBuilder,
    this.selectedLeadingWidget,
    this.dropdownLeadingWidget,
    this.onBeforeChange,
    this.height,
    this.width,
  });

  final List<T> items;
  final T? selectedItem;
  final String? hint;
  final TextStyle? hintStyle;
  final BorderSide? border;
  final bool enabled, hasBorder, hasShadow, filled, isCollapsed, showSearchBox;
  final double? maxHeight;
  final Key? dropDownKey;
  final TextStyle? selectedTextStyle;
  final TextStyle? dropdownTextStyle;
  final BoxDecoration? decoration;
  final Color? enabledColor;
  final Color? fillColor;
  final double itemHeight;
  final double? height;
  final double? width;
  final double? iconSize;
  final double? fontSize;
  final Color? disabledFillColor;
  final BorderRadius? borderRadius;
  final void Function(T?)? onChanged;
  final String Function(T?)? itemAsString;
  final AlignmentGeometry? selectedAlign, dropdownAlign;
  final Widget? dropdownButtonBuilder;
  final Widget Function(BuildContext, T?)? selectedLeadingWidget;
  final Widget Function(BuildContext context, T item, bool isSelected)?
      dropdownLeadingWidget;
  final BeforeChange<T>? onBeforeChange;

  @override
  Widget build(BuildContext context) {
    int itemsCount = items.length;
    final relativeMenuHeight = ((itemsCount * (itemHeight)) +
        (showSearchBox
            ? itemsCount != 0
                ? itemHeight * 2.2
                : itemHeight * 4
            : itemHeight * 2));
    var inputBorder = OutlineInputBorder(
      borderRadius: borderRadius ?? BorderRadius.circular(7),
      borderSide: BorderSide(
        color: enabled ? enabledColor ?? CoreColors.blue : CoreColors.blue,
        width: 0.5,
      ),
    );
    return SizedBox(
      height: height ?? 40,
      width: width ?? 250,
      child: DropdownSearch<T>(
        key: dropDownKey,
        enabled: enabled,
        popupProps: PopupProps.menu(
          showSearchBox: showSearchBox,
          searchFieldProps: const TextFieldProps(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              isCollapsed: false,
              constraints: BoxConstraints(),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 4,
                vertical: 0.5,
              ),
            ),
          ),
          itemBuilder: (ctx, item, b) => Container(
            alignment: dropdownAlign ?? AlignmentDirectional.center,
            padding: const EdgeInsetsDirectional.fromSTEB(5, 2, 5, 2),
            child: Row(
              children: [
                dropdownLeadingWidget?.call(ctx, item, b) ?? const SizedBox(),
                Expanded(
                  child: Container(
                    alignment: dropdownAlign ?? AlignmentDirectional.center,
                    child: Text(
                      itemAsString != null
                          ? itemAsString!(item)
                          : item.toString(),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.ltr,
                      style: dropdownTextStyle ??
                          TextStyle(
                            color: enabled
                                ? enabledColor ?? CoreColors.blue
                                : CoreColors.grey,
                            fontSize: fontSize ?? 18,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          menuProps: MenuProps(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          ),
          constraints: BoxConstraints(
            maxHeight: maxHeight ??
                (relativeMenuHeight > 400 ? 400 : relativeMenuHeight)
                    .toDouble(),
          ),
        ),
        selectedItem: selectedItem,
        itemAsString: itemAsString,
        dropdownButtonProps: DropdownButtonProps(
          constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
          splashRadius: 12,
          iconSize: iconSize ?? 18,
          icon: dropdownButtonBuilder ??
              Icon(
                Icons.keyboard_arrow_down,
                color:
                    enabled ? enabledColor ?? CoreColors.blue : CoreColors.grey,
                size: iconSize ?? 18,
              ),
          selectedIcon: dropdownButtonBuilder ??
              Icon(
                Icons.keyboard_arrow_down,
                color:
                    enabled ? enabledColor ?? CoreColors.blue : CoreColors.grey,
                size: iconSize ?? 18,
              ),
        ),
        dropdownDecoratorProps: DropDownDecoratorProps(
          textAlignVertical: TextAlignVertical.center,
          dropdownSearchDecoration: InputDecoration(
            suffixIconConstraints:
                const BoxConstraints(minHeight: 0, minWidth: 0),
            isCollapsed: isCollapsed,
            fillColor: CoreColors.white,
            filled: filled,
            border: inputBorder,
          ),
        ),
        items: items,
        dropdownBuilder: (ctx, value) {
          if (value == null || (value is String && (value == ''))) {
            return Container(
              alignment: selectedAlign ?? AlignmentDirectional.center,
              padding: const EdgeInsetsDirectional.only(start: 0),
              child: Text(
                hint ?? '',
                maxLines: 2,
                textDirection: TextDirection.ltr,
                overflow: TextOverflow.ellipsis,
                style: hintStyle ??
                    TextStyle(
                      color: CoreColors.grey,
                      fontSize: fontSize ?? 18,
                    ),
              ),
            );
          }
          return Container(
            alignment: selectedAlign ?? AlignmentDirectional.center,
            padding: const EdgeInsetsDirectional.only(start: 30),
            child: Row(
              children: [
                selectedLeadingWidget?.call(ctx, value) ?? const SizedBox(),
                Expanded(
                  child: FittedBox(
                    alignment: selectedAlign ?? AlignmentDirectional.center,
                    fit: BoxFit.scaleDown,
                    child: Text(
                      value is String
                          ? value
                          : itemAsString == null
                              ? value.toString()
                              : itemAsString!(value),
                      maxLines: 2,
                      textDirection: TextDirection.ltr,
                      overflow: TextOverflow.ellipsis,
                      style: selectedTextStyle ??
                          TextStyle(
                            color: enabled
                                ? enabledColor ?? CoreColors.blue
                                : CoreColors.grey,
                            fontSize: fontSize ?? 18,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        onChanged: onChanged,
        onBeforeChange: onBeforeChange,
      ),
    );
  }
}
