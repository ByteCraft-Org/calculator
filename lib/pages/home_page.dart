import 'package:calculator/pages/calculator_page/calculator_page.dart';
import 'package:calculator/pages/converter_page/converter_page.dart';
import 'package:calculator/utils/widgets/custom_tabs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedTab = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, animationDuration: Duration.zero);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          enableFeedback: true,
          onTap: (value) => setState(() => selectedTab = value),
          indicatorWeight: 5,
          tabs: [
            Tab(
              child: SvgTab(
                  selectedAsset: "assets/svg/calculatorFilled.svg",
                  unselectedAsset: "assets/svg/calculatorOutlined.svg",
                  isSelected: selectedTab == 0 || tabController.index == 0,
                  selectedColor: Theme.of(context).colorScheme.secondary,
                  unselectedColor: Colors.grey,
                ),
            ),
            Tab(
              child: SvgTab(
                selectedAsset: "assets/svg/converterFilled.svg",
                unselectedAsset: "assets/svg/converterOutlined.svg",
                isSelected: selectedTab == 1 || tabController.index == 1,
                selectedColor: Theme.of(context).colorScheme.secondary,
                unselectedColor: Colors.grey,
              ),
            ),
            Tab(
              child: SvgTab(
                selectedAsset: "assets/svg/currencyFilled.svg",
                unselectedAsset: "assets/svg/currencyOutlined.svg",
                isSelected: selectedTab == 2 || tabController.index == 2,
                selectedColor: Theme.of(context).colorScheme.secondary,
                unselectedColor: Colors.grey,
              ),
            ),
          ]
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBarView(
            controller: tabController,
            children: const [
              CalculatorPage(),
              ConverterPage(),
              Pages(text: "Page3"),
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
