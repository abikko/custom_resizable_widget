import 'package:custom_resizable_widget/src/base/base_controller.dart';
import 'package:custom_resizable_widget/src/controller/resize/resize_view_data.dart';
import 'package:flutter/widgets.dart';

class ResizeController extends BaseController<ResizeViewData> {
  ResizeController(super.model);

  void onPanUpdate(DragUpdateDetails details) {}

  void onPanStart(DragStartDetails details) {}

  void onPanEnd(DragEndDetails details) {}
}
