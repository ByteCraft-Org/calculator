import 'package:calculator/utils/widgets/custom_button.dart';
import 'package:calculator/utils/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key,});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  final DiscountLogics _discountLogics = DiscountLogics();

  bool isDiscount = false;

  void _onButtonPressed(String btnText, bool isDiscount){
    setState(() {
      _discountLogics._onButtonPressed(context, btnText, isDiscount);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(// * : Original Price
              flex: 1,
              child: GestureDetector(
                onTap: () => setState(() => isDiscount = false),
                child: Row(
                  children: [
                    const Text(
                      "Original Price :",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _discountLogics.originalPrice,
                          maxLines: 1,
                          style: TextStyle(
                            color: (!isDiscount) ? Colors.orange : Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () => setState(() => isDiscount = true),
                child: Row(
                  children: [
                    const Text(
                      "Discount (% off) :",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          _discountLogics.discount,
                          maxLines: 1,
                          style: TextStyle(
                            color: (isDiscount) ? Colors.orange : Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  const Text(
                    "Final Price :",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        _discountLogics.finalPrice,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  "You save ${_discountLogics.youSave}",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Divider(// * : Divider Line
            thickness: 2,
              color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
            const SizedBox(height: 5,),
            Expanded(// * : Button Segment
              flex: 10,
              child: _buttonBox(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonBox(BuildContext context) {
    Column col1 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButtonWithText(// * : Seven
          onTap: () => _onButtonPressed("7", isDiscount),
          buttontext: "7",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Four
          onTap: () => _onButtonPressed("4", isDiscount),
          buttontext: "4",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : One
          onTap: () => _onButtonPressed("1", isDiscount),
          buttontext: "1",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        const SizedBox(
          width: 60,
          height: 60,
        )
      ],
    );

    Column col2 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButtonWithText(// * : Eight
          onTap: () => _onButtonPressed("8", isDiscount),
          buttontext: "8",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Five
          onTap: () => _onButtonPressed("5", isDiscount),
          buttontext: "5",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Two
          onTap: () => _onButtonPressed("2", isDiscount),
          buttontext: "2",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Zero
          onTap: () => _onButtonPressed("0", isDiscount),
          buttontext: "0",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
      ],
    );

    Column col3 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButtonWithText(// * : Nine
          onTap: () => _onButtonPressed("9", isDiscount),
          buttontext: "9",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Six
          onTap: () => _onButtonPressed("6", isDiscount),
          buttontext: "6",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Three
          onTap: () => _onButtonPressed("3", isDiscount),
          buttontext: "3",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
        CustomButtonWithText(// * : Decimal
          onTap: () => _onButtonPressed(".", isDiscount),
          buttontext: ".",
          textColor: Theme.of(context).primaryColor,
          fontSize: 30,
        ),
      ],
    );

    Column col4 = Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomConverterButton(
          onPressed: () => setState(() => _discountLogics._onAllClearPressed(isDiscount)),
          text: "AC",
        ),
        CustomConverterButton(
          onPressed: () => setState(() => _discountLogics._onBackSpacePressed(isDiscount)),
          icon: LineAwesomeIcons.backspace,
        ),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        col1,
        col2,
        col3,
        col4
      ],
    );
  }
}


class DiscountLogics {
  String originalPrice = "0";
  String discount = "0";
  String finalPrice = "0";
  String youSave = "0";

  void _onButtonPressed(BuildContext context, String buttonText, bool isDiscount) {
    if (!isDiscount) {
      originalPrice = _updateText(context, isDiscount, buttonText);
    } else {
      discount = _updateText(context, isDiscount, buttonText);
    }
    _calculateDiscount(isDiscount);
  }

  String _updateText(BuildContext context, bool isDiscount, String newText) {
    if (!isDiscount) {
      if (originalPrice.length == 12) {
        customSnackbar(context: context, message: "Max characters reached");
        return originalPrice;
      }
      return (originalPrice == "0") ? (newText == ".") ? "0$newText" : newText : originalPrice + newText;
    } else {
      if (discount.length == 7) {
        customSnackbar(context: context, message: "Max characters reached");
        return discount;
      }

      String updatedDiscount = (discount == "0") ? (newText == ".") ? "0$newText" : newText : discount + newText;
      double newDiscountValue = double.tryParse(updatedDiscount) ?? 0.0;
      if (newDiscountValue >= 100) {
        customSnackbar(context: context, message: "Discount should be less than 100%");
        return discount;
      }
      return updatedDiscount;
    }
  }


  void _onAllClearPressed(bool isDiscount) {
    (!isDiscount) ? originalPrice = "0" : discount = "0";
  }

  void _onBackSpacePressed(bool isDiscount) {
    if (!isDiscount) {
      originalPrice = _removeLastCharacter(originalPrice);
    } else {
      discount = _removeLastCharacter(discount);
    }
    _calculateDiscount(isDiscount);
  }

  String _removeLastCharacter(String text) {
    return (text.length > 1) ? text.substring(0, text.length - 1) : "0";
  }
  
  void _calculateDiscount(bool isDiscount) {
    double discountPercentage = double.parse(discount) / 100;
    double truePrice = double.parse(originalPrice);
    double saving = discountPercentage * truePrice;
    double discountedPrice = truePrice - saving;

    youSave = saving.toStringAsFixed(2);
    finalPrice = discountedPrice.toStringAsFixed(2);

    if(discountedPrice == discountedPrice.toInt()) {
      finalPrice = discountedPrice.toInt().toString();
    }
    if(saving == saving.toInt()) {
      youSave = saving.toInt().toString();
    }
  }
}