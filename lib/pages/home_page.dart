import 'package:calculator/pages/calculator_page/calculator_page.dart';
import 'package:calculator/pages/converter_page/converter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                      icon: SvgPicture.asset(
                        (pageSelected==0) ? "assets/svg/calculatorFilled.svg" : "assets/svg/calculatorOutlined.svg",
                        height: 35,
                      ),
                      color: (pageSelected==0) ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      iconSize: 35,
                    ),
                    IconButton(
                      onPressed: () => moveToPage(1),
                      icon: SvgPicture.asset(
                        (pageSelected==1) ? "assets/svg/converterFilled.svg" : "assets/svg/converterOutlined.svg",
                        height: 35,
                      ),
                      color: (pageSelected==1) ? Theme.of(context).colorScheme.secondary : Colors.grey,
                      iconSize: 35,
                    ),
                    IconButton(
                      onPressed: () => moveToPage(2),
                      icon: SvgPicture.asset(
                        (pageSelected==2) ? "assets/svg/currencyFilled.svg" : "assets/svg/currencyOutlined.svg",
                        height: 40,
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
                  onPageChanged: (page) => setState(() => pageSelected = page),
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
