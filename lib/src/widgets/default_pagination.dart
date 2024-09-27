import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:ui_kit/src/styles/core_colors.dart';
import 'package:ui_kit/src/views/error_view.dart';
import 'package:ui_kit/src/views/loading_view.dart';
import 'package:ui_kit/src/views/no_item_found_view.dart';

class DefaultPagedListView<T> extends StatefulWidget {
  /// Used in the indicators text, ignored if [builderDelegate] is provided.
  ///
  /// Example: (لا يوجد المزيد من ال [عناصر])
  final String? pluralItemName;
  final Widget Function(BuildContext, T, int) itemBuilder;

  /// Used to create an object from previously cached data.
  final T Function(Map<String, dynamic> json)? fromJson;

  /// Used to convert the object to json to be cached.
  ///
  /// ignored if [cacheKey] equals null
  final Map<String, dynamic> Function(T object)? toJson;

  /// returns the cached items on failure, if null the items will be appended to the itemList
  final Function(List<T> cachedItems)? onCachedItemsReturn;
  final RefreshController? refreshController;
  final void Function()? onRefresh;
  final bool showErrorIndicators;
  final bool showLoadingIndicator;
  final bool showNoMoreItemsIndicators;
  final bool animateTransitions;
  final Duration transitionDuration;
  final PagingController<int, T> pagingController;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final bool reverse;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final bool addAutomaticKeepAlive;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Color? loadingColor;
  final Clip clipBehavior;

  /// ListViewPagination with default builder delegate & indicators & caching
  ///
  /// You can implement pull to refresh by passing a refreshController & onRefresh function
  ///
  /// Don't wrap this widget with SmartRefresher because it will cause some bugs, instead you can provide
  /// [refreshController] & [onRefresh] directly to this widget
  ///
  /// To use caching on request failure you should provide [cacheKey] and it should be unique, used to create a box ands save the cached data.
  /// also should provide [toJson] and [fromJson] for the object [T].
  ///
  /// You can provide a [pluralItemName] for the object to be used in the indicator text
  ///
  /// The [showErrorIndicators] if enabled shows retry on failure that triggers [onRefresh] if provided,
  /// And if not [pagingController.refresh()]
  const DefaultPagedListView({
    super.key,
    required this.pagingController,
    required this.itemBuilder,
    this.pluralItemName,
    this.onRefresh,
    this.refreshController,
    this.fromJson,
    this.toJson,
    this.showErrorIndicators = true,
    this.showLoadingIndicator = true,
    this.showNoMoreItemsIndicators = true,
    this.onCachedItemsReturn,
    this.animateTransitions = false,
    this.transitionDuration = const Duration(milliseconds: 250),
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.primary,
    this.loadingColor,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.addAutomaticKeepAlive = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
  }) : super();

  @override
  State<DefaultPagedListView<T>> createState() =>
      _DefaultPagedListViewState<T>();
}

class _DefaultPagedListViewState<T> extends State<DefaultPagedListView<T>> {
  @override
  initState() {
    super.initState();
  }

  late final Widget child = PagedListView<int, T>(
    key: widget.key,
    pagingController: widget.pagingController,
    scrollController: widget.scrollController,
    scrollDirection: widget.scrollDirection,
    reverse: widget.reverse,
    primary: widget.primary,
    physics: widget.physics,
    shrinkWrap: widget.shrinkWrap,
    padding: widget.padding,
    itemExtent: widget.itemExtent,
    addAutomaticKeepAlives: widget.addAutomaticKeepAlive,
    addRepaintBoundaries: widget.addRepaintBoundaries,
    addSemanticIndexes: widget.addSemanticIndexes,
    cacheExtent: widget.cacheExtent,
    dragStartBehavior: widget.dragStartBehavior,
    keyboardDismissBehavior: widget.keyboardDismissBehavior,
    restorationId: widget.restorationId,
    clipBehavior: widget.clipBehavior,
    builderDelegate: defaultBuilderDelegate(
      showErrorIndicators: widget.showErrorIndicators,
      showLoadingIndicator: widget.showLoadingIndicator,
      showNoMoreItemsIndicators: widget.showNoMoreItemsIndicators,
      itemBuilder: widget.itemBuilder,
      transitionDuration: widget.transitionDuration,
      itemName: widget.pluralItemName ?? "",
      animateTransitions: widget.animateTransitions,
    ),
  );

  @override
  Widget build(BuildContext context) {
    if (widget.refreshController != null) {
      return SmartRefresher(
        controller: widget.refreshController!,
        onRefresh: widget.onRefresh,
        child: child,
      );
    }
    return child;
  }

  PagedChildBuilderDelegate<T> defaultBuilderDelegate({
    required Widget Function(BuildContext, T, int) itemBuilder,
    required String itemName,
    required bool animateTransitions,
    required Duration transitionDuration,
    required bool showErrorIndicators,
    required bool showLoadingIndicator,
    required bool showNoMoreItemsIndicators,
  }) {
    return PagedChildBuilderDelegate<T>(
      animateTransitions: animateTransitions,
      transitionDuration: transitionDuration,
      firstPageProgressIndicatorBuilder: (ctx) {
        return showLoadingIndicator
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: LoadingView(
                    iconColor: widget.loadingColor ?? CoreColors.blue),
              )
            : const SizedBox();
      },
      newPageProgressIndicatorBuilder: (ctx) {
        return showLoadingIndicator
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: LoadingView(
                    iconColor: widget.loadingColor ?? CoreColors.blue),
              )
            : const SizedBox();
      },
      firstPageErrorIndicatorBuilder: (context) {
        return showErrorIndicators
            ? Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ErrorView(
                  'An error occurred while loading $itemName',
                  onRetry: () =>
                      (widget.onRefresh ?? widget.pagingController.refresh)
                          .call(),
                ),
              )
            : const SizedBox();
      },
      noItemsFoundIndicatorBuilder: (context) {
        return showNoMoreItemsIndicators
            ? NoItemsFound('Not available $itemName')
            : const SizedBox();
      },
      newPageErrorIndicatorBuilder: (context) {
        return showErrorIndicators
            ? Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ErrorView(
                  'An error occurred while loading $itemName',
                  onRetry: () =>
                      widget.pagingController.retryLastFailedRequest(),
                ),
              )
            : const SizedBox();
      },
      noMoreItemsIndicatorBuilder: (context) {
        return showNoMoreItemsIndicators
            ? NoItemsFound('No More $itemName')
            : const SizedBox();
      },
      itemBuilder: itemBuilder,
    );
  }
}
