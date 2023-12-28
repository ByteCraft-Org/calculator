import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgTab extends StatefulWidget {
  final String selectedAsset;
  final String unselectedAsset;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;

  const SvgTab({
    super.key, 
    required this.selectedAsset,
    required this.unselectedAsset,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
  });

  @override
  _SvgTabState createState() => _SvgTabState();
}

class _SvgTabState extends State<SvgTab> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.isSelected ? widget.selectedAsset : widget.unselectedAsset,
      height: 30,
      colorFilter: ColorFilter.mode(
        widget.isSelected ? widget.selectedColor : widget.unselectedColor,
        BlendMode.srcIn,
      ),
    );
  }
}
