// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AgePage extends StatefulWidget {
  const AgePage({super.key});

  @override
  State<AgePage> createState() => _AgePageState();
}

class _AgePageState extends State<AgePage> {
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
      backgroundColor: Colors.grey[900],
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
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Color(0xFF232426),
        border: Border.all(),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: _ageContainer(),
              ),
              Container(
                width: 1,
                height: 160,
                color: Colors.grey
              ),
              Expanded(
                child: _nextBirthdayContainer(),
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey
          ),
          SizedBox(height: 15),
          _summaryContainer()
        ],
      )
    );
  }

  Widget _ageContainer() {
    AgeCalci age = AgeCalci();

    return Column(// * : Age Container
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Age",
          style: TextStyle(
            color: Colors.white,
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
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
        Text(
          "${age.getAgeInMonths(dob)} months | ${age.getAgeInDays(dob)} days",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
        )
      ],
    );
  }
  
  Widget _nextBirthdayContainer() {
    NextBirthdayCalci nextBirthday = NextBirthdayCalci();

    return Column(// * : Next Birthday Container
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Next Birthday",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.orange
          ),
        ),
        SizedBox(height: 10,),
        SvgPicture.asset(
          "assets/svg/cake.svg",
          height: 50,
        ),
        SizedBox(height: 10,),
        Text(
          nextBirthday.getWeekDay(dob),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 10,),
        Text(
          "${nextBirthday.getMonthsLeft(dob)} months | ${nextBirthday.getDaysLeft(dob)} days",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
        )
      ],
    );
  }

  Widget _summaryContainer() {
    SummaryCalci summary = SummaryCalci();

    return Column(
      children: [
        Center(
          child: Text(
            "Summary",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.orange
            ),
          )
        ),
        SizedBox(height: 20,),
        Row(// * : Years, Months, Weeks
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(// * : Years
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Years",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInYears(dob)}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(// * : Months
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Months",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInMonths(dob)}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(// * : Weeks
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Weeks",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInWeeks(dob)}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
        SizedBox(height: 15,),
        Row(// * : Days, Hours
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(// * : Days
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Days",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInDays(dob)}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(// * : Hours
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Hours",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInHours(dob)}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
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

class NextBirthdayCalci{
  DateTime today = DateTime.now();

  String getWeekDay(DateTime birthDate) {
    DateTime newBirthday = DateTime(DateTime.now().year + 1, birthDate.month, birthDate.day);
    List<String> weekNames = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
    return weekNames[newBirthday.weekday - 1];
  }

  int getMonthsLeft(DateTime birthDate) {
    DateTime now = DateTime.now();
    DateTime nextBirthday = DateTime(now.year, birthDate.month, birthDate.day);
    if (now.isAfter(nextBirthday)) {
      nextBirthday = DateTime(now.year + 1, birthDate.month, birthDate.day);
    }
    int monthsLeft = (nextBirthday.year - now.year) * 12 + (nextBirthday.month - now.month);
    return monthsLeft;
  }

  int getDaysLeft(DateTime birthDate) {
    DateTime now = DateTime.now();
    DateTime nextBirthday = DateTime(now.year, birthDate.month, birthDate.day);

    if (now.isAfter(nextBirthday)) {
      nextBirthday = DateTime(now.year + 1, birthDate.month, birthDate.day);
    }

    int daysLeft = nextBirthday.difference(now).inDays;

    return daysLeft;
  }
}

class SummaryCalci{
  DateTime today = DateTime.now();

  int getAgeInYears(DateTime birthDate) {
    return today.year - birthDate.year;
  }

  int getAgeInWeeks(DateTime birthDate) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(birthDate);
    int ageInWeeks = (difference.inDays / 7).floor();
    return ageInWeeks;
  }

  int getAgeInMonths(DateTime birthDate) {
    DateTime now = DateTime.now();
    int ageInMonths = (now.year - birthDate.year) * 12 + now.month - birthDate.month;
    if (now.day < birthDate.day) {
      ageInMonths--;
    }

    return ageInMonths;
  }

  int getAgeInDays(DateTime birthDate) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(birthDate);
    int ageInDays = difference.inDays;
    return ageInDays;
  }

  int getAgeInHours(DateTime birthDate) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(birthDate);
    int ageInHours = difference.inHours;
    return ageInHours;
  }

  int getAgeInMinutes(DateTime birthDate) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(birthDate);
    int ageInMinutes = difference.inMinutes;
    return ageInMinutes;
  }
}