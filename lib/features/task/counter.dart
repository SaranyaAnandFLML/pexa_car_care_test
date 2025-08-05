import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/common/variables.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  String warning = '';

  void incrementCounter() {
    setState(() {
      counter++;
      warning = '';
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
        warning = '';
      } else {
        warning = 'Oops! Counter cannot go below zero.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Simple Counter',
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600
        ),
      ),),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(w*0.06),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Counter: $counter',
                style: TextStyle(fontSize: w*0.08, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: w*0.03),
              if (warning.isNotEmpty)
                Text(
                  warning,
                  style: TextStyle(color: Colors.red, fontSize: w*0.04),
                ),
              SizedBox(height: w*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: decrementCounter,
                    child: Text('Decrement'),
                  ),
                  SizedBox(width: w*0.07),
                  ElevatedButton(
                    onPressed: incrementCounter,
                    child: Text('Increment'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}