import 'package:flutter/material.dart';

class CustomUnitBoxes extends StatefulWidget {
  final Function onTapDropDown, onTapBox;
  final Widget dropDownDisplay;
  final String valueText, exponent;
  final bool isThisBoxSelected;
  final List<String> unitLists;
  final int selectedItem;
  
  const CustomUnitBoxes({
    super.key,
    required this.onTapDropDown,
    required this.dropDownDisplay,
    required this.onTapBox,
    required this.valueText,
    this.exponent = "",
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
                    child: (widget.exponent.isEmpty || widget.exponent == "0")
                    ? Text(
                      widget.valueText,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: widget.isThisBoxSelected ? Colors.orange : Colors.white,
                      ),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.valueText,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: widget.isThisBoxSelected ? Colors.orange : Colors.white,
                          ),
                        ),
                        Text(
                          "×",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: widget.isThisBoxSelected ? Colors.orange[300] : Colors.grey.shade400,
                          ),
                        ),
                        Text(
                          "10",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: widget.isThisBoxSelected ? Colors.orange[300] : Colors.grey.shade400,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -4),
                          child: Text(
                            widget.exponent,
                            style: TextStyle(
                              color: widget.isThisBoxSelected ? Colors.orange[300] : Colors.grey.shade400,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic,
                            ),
                          ),
                        ),
                      ]
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