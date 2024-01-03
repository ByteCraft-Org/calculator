import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  int fromDate = DateTime.now().day;
  int fromMonth = DateTime.now().month;
  late String fromMonthStr;
  int fromYear = DateTime.now().year;

  int toDate = DateTime.now().day;
  int toMonth = DateTime.now().month;
  late String toMonthStr;
  int toYear = DateTime.now().year;

  late DateTime from = DateTime(fromYear, fromMonth, fromDate);
  late DateTime to = DateTime(toYear, toMonth, toDate);

  static List<String> monthNames = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"
  ];

  static String _getMonthName(int month) {
    return monthNames[month - 1];
  }


  int daysInMonths() {
    switch (fromMonth) {
      case 2:
        return (fromYear % 4 == 0 && (fromYear % 100 != 0 || fromYear % 400 == 0)) ? 29 : 28; // Leap year check
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
    fromMonthStr = _getMonthName(fromMonth);
    toMonthStr = _getMonthName(toMonth);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(// * : From date
              children: [
                const Text(
                  "From",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => _showBottomDialog(context, 1),
                  child: Row(
                    children: [
                      Text(
                        "${fromDate.toString().padLeft(2, '0')} $fromMonthStr ${fromYear.toString()}",
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
            Row(// * : To Date
              children: [
                const Text(
                  "To",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => _showBottomDialog(context, 2),
                  child: Row(
                    children: [
                      Text(
                        "${toDate.toString().padLeft(2, '0')} $toMonthStr ${toYear.toString()}",
                        style: const TextStyle(
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down, color: Colors.pinkAccent,)
                    ],
                  ),
                ),
              ]
            ),
            const SizedBox(height: 25,),
            _dateCard(context) // * : Date Card
          ],
        )
      )
    );
  }

  void _showBottomDialog(BuildContext context, int whichBox) {
    showModalBottomSheet(
      backgroundColor: Colors.grey[900],
      elevation: 1,
      useSafeArea: false,
      context: context,
      builder: (BuildContext bc) {
        var localDate = fromDate;
        var localMonth = fromMonthStr;
        var localYear = fromYear;
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
                  "Select Date",
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
                      maxValue: 12,
                      value: monthNames.indexOf(fromMonthStr) + 1,
                      onChanged: (value) {
                        setState(() {
                          localMonth = _getMonthName(value+1);
                          (whichBox == 1) ? fromMonth = value+1 : toMonth = value+1;
                          daysInMonths();
                        });
                      },
                    ),
                    _buildCupertinoPicker(// * : Year
                      minValue: 1900,
                      maxValue: 2100,
                      value: fromYear,
                      onChanged: (value) {
                        setState(() {
                          localYear = (value + 1900);
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
                              if(whichBox == 1){
                                fromDate = localDate;
                                fromMonthStr = localMonth;
                                fromYear = localYear;
                                from = DateTime(localYear, fromMonth, localDate);
                              } else {
                                toDate = localDate;
                                toMonthStr = localMonth;
                                toYear = localYear;
                                to = DateTime(localYear, toMonth, localDate);
                              }
                            });
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

  Widget _dateCard(context){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF232426),
          border: Border.all(),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: _summaryContainer()
      ),
    );
  }

  Widget _summaryContainer() {
    DifferenceCalci difference = DifferenceCalci();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Difference",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.purpleAccent
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Divider(thickness: 1, color: Colors.grey.withOpacity(0.5)),
        Row(// * : Years, Months, Weeks
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(// * : Years
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Years",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "${difference.getDiffInYears(from, to)}",
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            Column(// * : Months
              children: [
                const Text(
                  "Months",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "${difference.getDiffInMonths(from,to)}",
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            Column(// * : Weeks
              children: [
                const Text(
                  "Days",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "${difference.getDiffInDays(from,to)}",
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ]
        ),
        const SizedBox(height: 20,),
        Divider(thickness: 1, color: Colors.grey.withOpacity(0.5)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(// * : From, To
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(// * : From
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "From",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "${fromDate.toString().padLeft(2, '0')} $fromMonthStr ${fromYear.toString()}",
                    style: const TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              Column(// * : To
                children: [
                  const Text(
                    "To",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "${toDate.toString().padLeft(2, '0')} $toMonthStr ${toYear.toString()}",
                    style: const TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ],
    );
  }
}

class DifferenceCalci{
  int getDiffInYears(DateTime from, DateTime to) {
    if(from.isBefore(to)) {
      DateTime temp = DateTime.now();
      temp = from;
      from = to;
      to = temp;
    }
    return to.year - from.year;
  }

  int getDiffInMonths(DateTime from, DateTime to) {
    if(from.isBefore(to)) {
      DateTime temp = DateTime.now();
      temp = from;
      from = to;
      to = temp;
    }

    int diffInMonths = (from.year - to.year) * 12 + from.month - to.month;
    if (from.day < to.day) {
      diffInMonths--;
    }

    return diffInMonths;
  }

  int getDiffInDays(DateTime from, DateTime to) {
    if(from.isBefore(to)) {
      DateTime temp = DateTime.now();
      temp = from;
      from = to;
      to = temp;
    }
    Duration difference = from.difference(to);
    int diffInDays = difference.inDays;
    return diffInDays;
  }
}