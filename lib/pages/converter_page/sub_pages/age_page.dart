import 'dart:math';

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
  int date = Random().nextInt(28) + 1;
  int month = Random().nextInt(12) + 1;
  late String monthString;
  late int year;

  int todayYear = DateTime.now().year;
  int minYear = DateTime.now().year - 75;

  late DateTime dob;

  static List<String> monthNames = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"
  ];

  static String _getMonthName(int month) {
    return monthNames[month - 1];
  }


  int daysInMonths() {
    switch (month) {
      case 2:
        return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? 29 : 28; // Leap year check
      case 4:
      case 6:
      case 9:
      case 11:
        return 30;
      default:
        return 31;
    }
  }

  @override
  void initState() {
    monthString = _getMonthName(month);
    year = minYear + Random().nextInt(todayYear - minYear + 1);
    dob = DateTime(year, month, date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(// * : Date of birth
              children: [
                const Text(
                  "Date of birth",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => _showBottomDialog(context),
                  child: Row(
                    children: [
                      Text(
                        "${date.toString()} $monthString ${year.toString()}",
                        style: const TextStyle(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.yellowAccent,)
                    ],
                  )
                ),
              ]
            ),
            const SizedBox(height: 25,),
            Row(// * : Today's Date
              children: [
                const Text(
                  "Today",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent
                  ),
                ),
                const Spacer(),
                Text(
                  "${today.day.toString().padLeft(2, '0')} ${_getMonthName(today.month)} ${today.year.toString()}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
              ]
            ),
            const SizedBox(height: 25,),
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
                child: const Text(
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
                      maxValue: daysInMonths(),
                      value: localDate,
                      onChanged: (value) {
                        setState(() => localDate = value+1);
                      },
                    ),
                    _buildCupertinoPicker(// * : Month
                      minValue: 1,
                      maxValue: (year == today.year) ? today.month : 12,
                      value: monthNames.indexOf(monthString) + 1,
                      onChanged: (value) {
                        setState(() {
                          localMonth = _getMonthName(value+1);
                          month = value+1;
                          daysInMonths();
                        });
                      },
                    ),
                    _buildCupertinoPicker(// * : Year
                      minValue: today.year - 75,
                      maxValue: today.year,
                      value: year,
                      onChanged: (value) {
                        setState(() {
                          localYear = (value + 1950);
                          daysInMonths();
                        });
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
                            backgroundColor: MaterialStatePropertyAll(Colors.grey[800]),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                              )
                            ),
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(12)
                            ),
                          ),
                          child: const Text(
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
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(12)
                            ),
                          ),
                          child: const Text(
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
      decoration: const BoxDecoration(
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
              style: const TextStyle(
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
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: const Color(0xFF232426),
        border: Border.all(),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 0,
            offset: const Offset(0, 0), // changes position of shadow
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
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey
          ),
          const SizedBox(height: 15),
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
        const Text(
          "Age",
          style: TextStyle(
            color: Colors.purpleAccent,
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
        Row(// * : Age in years
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                "${age.getAgeInYears(dob)}",
                style: const TextStyle(
                  fontSize: 65,
                  color: Colors.cyanAccent
                ),
              ),
            ),
            const Text(
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
          style: const TextStyle(
            color: Colors.tealAccent,
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
        const Text(
          "Next Birthday",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.purpleAccent
          ),
        ),
        const SizedBox(height: 12,),
        SvgPicture.asset(
          "assets/svg/cake.svg",
          height: 50,
          colorFilter: const ColorFilter.mode(Colors.cyanAccent, BlendMode.srcIn),
        ),
        const SizedBox(height: 12,),
        Text(
          nextBirthday.getWeekDay(dob),
          style: const TextStyle(
            color: Colors.amber,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 12,),
        Text(
          "${nextBirthday.getMonthsLeft(dob)} months | ${nextBirthday.getDaysLeft(dob)} days",
          style: const TextStyle(
            color: Colors.tealAccent,
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
        const Center(
          child: Text(
            "Summary",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent
            ),
          )
        ),
        const SizedBox(height: 20,),
        Row(// * : Years, Months, Weeks
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(// * : Years
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Years",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInYears(dob)}",
                      style: const TextStyle(
                        color: Colors.greenAccent,
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
                    const Text(
                      "Months",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInMonths(dob)}",
                      style: const TextStyle(
                        color: Colors.greenAccent,
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
                    const Text(
                      "Weeks",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInWeeks(dob)}",
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
        const SizedBox(height: 15,),
        Row(// * : Days, Hours
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(// * : Days
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Days",
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInDays(dob)}",
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20,
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
                    const Text(
                      "Hours",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInHours(dob)}",
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(// * : Minutes
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      "Minutes",
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "${summary.getAgeInMinutes(dob)}",
                      style: const TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20,
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