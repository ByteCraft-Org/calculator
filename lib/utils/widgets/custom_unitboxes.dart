import 'package:flutter/material.dart';

class CustomUnitBoxes extends StatefulWidget {
  final Function onTapDropDown, onTapBox;
  final Widget dropDownDisplay;
  final String value;
  final bool isThisBoxSelected;
  final List<String> unitLists;
  final int selectedItem;
  
  const CustomUnitBoxes({
    super.key,
    required this.onTapDropDown,
    required this.dropDownDisplay,
    required this.onTapBox,
    required this.value,
    required this.isThisBoxSelected,
    required this.unitLists,
    required this.selectedItem,
  });

  @override
  State<CustomUnitBoxes> createState() => _CustomUnitBoxesState();
}

class _CustomUnitBoxesState extends State<CustomUnitBoxes> {
  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(// * : First Unit Selector
          onTap: () => widget.onTapDropDown(),
          child: widget.dropDownDisplay
        ),
        Expanded(// * : First Unit Text Box
          child: GestureDetector(
            onTap: () => widget.onTapBox(),
            child: Container(
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      widget.value,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: widget.isThisBoxSelected ? Colors.orange : Colors.white,
                      ),
                    ),
                  ),
                  Container(// * : Unit Display
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.unitLists[widget.selectedItem],
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}