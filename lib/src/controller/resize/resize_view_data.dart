class ResizeViewData {
  final double rightMargin;
  final double leftMargin;

  const ResizeViewData(this.rightMargin, this.leftMargin);

  factory ResizeViewData.initial() => const ResizeViewData(0, 0);
}
