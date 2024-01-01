import 'package:calculator/pages/calculator_page/calculator_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CalculatorPage(),
          ),
        ),
      ),
    );
  }
}