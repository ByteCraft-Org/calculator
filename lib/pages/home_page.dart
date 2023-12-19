import 'package:ant_icons/ant_icons.dart';
import 'package:calculator/pages/calculator_page/calculator_page.dart';
import 'package:calculator/pages/converter_page/converter_page.dart';
import 'package:evil_icons_flutter/evil_icons_flutter.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:heroicons/heroicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mdi/mdi.dart';
import 'package:unicons/unicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageSelected = 0;
  Color iconColor = Colors.grey;
  PageController pageController = PageController();

  void moveToPage(int page) {
    setState(() => pageSelected = page);
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () => moveToPage(0),
                      icon: Icon(
                        (pageSelected==0) ? Icons.calculate_rounded : Icons.calculate_outlined
                      ),
                      color: (pageSelected==0) ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      iconSize: 35,
                    ),
                    IconButton(
                      onPressed: () => moveToPage(1),
                      icon: Icon(
                        (pageSelected==1) ? Icons.dashboard_rounded : Icons.dashboard_outlined
                      ),
                      color: (pageSelected==1) ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      iconSize: 35,
                    ),
                    IconButton(
                      onPressed: () => moveToPage(2),
                      icon: Icon(
                        (pageSelected==2) ? FontAwesomeIcons.solidMoneyBill1 : FontAwesomeIcons.moneyBill1
                      ),
                      color: (pageSelected==2) ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      iconSize: 35,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: const [
                    CalculatorPage(),
                    ConverterPage(),
                    Pages(text: "Page3"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final String text;
  const Pages({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
