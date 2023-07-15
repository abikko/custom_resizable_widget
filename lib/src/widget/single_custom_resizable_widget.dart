import 'package:custom_resizable_widget/src/controller/initial_size/initial_size_view_data.dart';
import 'package:custom_resizable_widget/src/controller/resize/resize_controller.dart';
import 'package:custom_resizable_widget/src/controller/resize/resize_view_data.dart';
import 'package:flutter/widgets.dart';

typedef OnResizeCallback = void Function(ResizeViewData);

class SingleCustomResizableWidget extends StatefulWidget {
  const SingleCustomResizableWidget({
    super.key,
    required this.child,
    required this.resizable,
    this.onResize,
    this.initialSize,
    required this.displayPredictedResize,
  });

  final Widget child;

  final bool resizable;

  final OnResizeCallback? onResize;

  /// Defines an initialSize of given [child]
  ///
  /// If null, [child] will use parent height and width.
  final InitialSizeViewData? initialSize;

  /// if [displayPredictedResize] is true, widget will not resize on every [GestureDetector.onPanUpdate] callback
  /// on UI it will show where probably will be resized by drag.
  ///
  /// else if [displayPredictedResize] is false, widget will resize on every [GestureDetector.onPanUpdate] callback
  /// on UI it will resize on every drag.
  final bool displayPredictedResize;

  @override
  State<SingleCustomResizableWidget> createState() => _SingleCustomResizableWidgetState();
}

class _SingleCustomResizableWidgetState extends State<SingleCustomResizableWidget> {
  late final ResizeController _resizeController;

  @override
  void initState() {
    _resizeController = ResizeController(ResizeViewData.initial());
    super.initState();
  }

  @override
  void dispose() {
    _resizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        handleWidgetWrapper(child: widget.child),
      ],
    );
  }

  Widget handleWidgetWrapper({required Widget child}) {
    Widget wrappedChild = child;
    if (widget.resizable) {
      wrappedChild = StreamBuilder(
        stream: _resizeController.stream,
        builder: (context, model) {
          return GestureDetector(
            onPanUpdate: widget.displayPredictedResize ? null : _resizeController.onPanUpdate,
            onPanStart: widget.displayPredictedResize ? _resizeController.onPanStart : null,
            onPanEnd: widget.displayPredictedResize ? _resizeController.onPanEnd : null,
            child: child,
          );
        },
      );
    }

    return wrappedChild;
  }
}
