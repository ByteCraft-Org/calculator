import 'package:flutter/material.dart';

class DisplayPart extends StatelessWidget {
    const DisplayPart({super.key});
    
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(// * : History
            flex: 8,
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text("History Part"),
              ),
            ),
          ),
          Expanded(// * : Expression & Result
            flex: 3,
            child: Container(
            color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(// * : Expression Text
                    color: Colors.yellow,
                    child: const Center(
                      child: Text("Expression Part"),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                  ),
                  Container(// * : Result Text
                    color: Colors.red,
                    child: const Center(
                      child: Text("Result Part"),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 1.0)
          )
        ],
      ),
    );
  }
}
