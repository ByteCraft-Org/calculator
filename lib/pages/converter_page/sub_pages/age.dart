// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
  AgeCalci age = AgeCalci();

  DateTime today = DateTime.now();
  int date = DateTime.now().day;
  int month = DateTime.now().month;
  String monthString = _getMonthName(DateTime.now().month);
  int year = DateTime.now().year;

  DateTime dob = DateTime.now();

  int ageYears = 0;
  int ageMonths = 0;
  int ageDays = 0;

  static List<String> monthNames = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"
  ];

  static String _getMonthName(int month) {
    return monthNames[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Age"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(// * : Date of birth
              children: [
                const Text(
                  "Date of birth",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () => _showBottomDialog(context),
                  child: Row(
                    children: [
                      Text(
                        "${date.toString()} $monthString ${year.toString()}",
                        style: const TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down)
                    ],
                  )
                ),
              ]
            ),
            SizedBox(height: 25,),
            Row(// * : Today's Date
              children: [
                const Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () => _showBottomDialog(context),
                  child: Text(
                    "${today.day.toString().padLeft(2, '0')} ${_getMonthName(today.month)} ${today.year.toString()}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  )
                ),
              ]
            ),
            SizedBox(height: 25,),
            _ageCard(context) // * : Age Card
          ],
        )
      )
    );
  }

  void _showBottomDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black38,
      elevation: 1,
      useSafeArea: false,
      context: context,
      builder: (BuildContext bc) {
        var localDate = date;
        var localMonth = monthString;
        var localYear = year;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Wrap(
            runSpacing: 10,
            spacing: 10,
            children: [
              Container(// * : Bottom Sheet Heading
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "Date of Birth",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Container(// * : Date Picker
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCupertinoPicker(// * : Day
                      minValue: 1,
                      maxValue: 30,
                      value: localDate,
                      onChanged: (value) {
                        setState(() => localDate = value+1);
                      },
                    ),
                    _buildCupertinoPicker(// * : Month
                      minValue: 1,
                      maxValue: 12,
                      value: monthNames.indexOf(monthString) + 1,
                      onChanged: (value) {
                        setState(() {
                          localMonth = _getMonthName(value+1);
                          month = value+1;
                        });
                      },
                    ),
                    _buildCupertinoPicker(// * : Year
                      minValue: 1950,
                      maxValue: today.year,
                      value: year,
                      onChanged: (value) {
                        setState(() => localYear = (value + 1950));
                      },
                    ),
                  ],
                ),
              ),
              Table(// * : Bottom Sheet Buttons
                children: [
                  TableRow(
                    children: [
                      Padding(// * : Cancel button
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.grey[700]),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                              )
                            ),
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.all(12)
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            )
                          ),
                        ),
                      ),
                      Padding(// * : Ok button 
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              date = localDate;
                              monthString = localMonth;
                              year = localYear;
                            });
                            setState(() => dob = DateTime(localYear, month, localDate));
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.blue[600]),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                              )
                            ),
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.all(12)
                            ),
                          ),
                          child: Text(
                            "OK",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            )
                          ),
                        ),
                      ),
                    ]
                  )
                ],
              )
            ],
          ),
        );
      }
    );
  }

  Widget _buildCupertinoPicker({
    required int minValue,
    required int maxValue,
    required int value,
    required ValueChanged<int> onChanged,
  }) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: CupertinoPicker(
        itemExtent: 50,
        useMagnifier: false,
        onSelectedItemChanged: onChanged,
        diameterRatio: 1,
        looping: false,
        scrollController: FixedExtentScrollController(initialItem: value - minValue),
        children: List.generate(
          maxValue - minValue + 1,
          (index) => Center(
            child: Text(
              (minValue + index).toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ageCard(context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF232426),
        border: Border.all(),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _ageContainer(),
              ),
            ],
          )
        ],
      )
    );
  }

  Widget _ageContainer() {
    return Column(// * : Age Container
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Age",
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Row(// * : Age in years
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "${age.getAgeInYears(dob)}",
                style: TextStyle(
                  fontSize: 65,
                  color: Colors.orange
                ),
              ),
            ),
            Text(
              "years",
              style: TextStyle(
                fontSize: 20
              ),
            )
          ],
        ),
        Text(
          "${age.getAgeInMonths(dob)} months | ${age.getAgeInDays(dob)} days",
          style: TextStyle(
            fontSize: 15
          ),
        )
      ],
    );
  }
}

class AgeCalci{
  DateTime today = DateTime.now();
  
  int getAgeInYears(DateTime birthDate) {
    return today.year - birthDate.year;
  }

  int getAgeInMonths(DateTime birthDate) {
    int months = today.month - birthDate.month;
    if (today.day < birthDate.day) {
      months--;
    }
    if (months < 0) {
      months += 12;
    }
    return months;
  }

  int getAgeInDays(DateTime birthDate) {
    int days = 0;
    if (today.day < birthDate.day) {
      days = birthDate.day - today.day;
    } else {
      days = today.day - birthDate.day;
    }
    return days;
  }
}