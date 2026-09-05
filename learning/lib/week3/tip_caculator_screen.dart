import 'package:flutter/material.dart';
import 'package:learning/week3/counter_button_widget.dart';

class TipCaculatorScreen extends StatefulWidget {
  const TipCaculatorScreen({super.key});

  @override
  State<TipCaculatorScreen> createState() => _TipCaculatorScreenState();
}

class _TipCaculatorScreenState extends State<TipCaculatorScreen> {
  double _billAmont = 0.0;
  double _tipPercentage = 10;
  int _person = 1;

  double get totalPerPerson => _billAmont / _person;
  double get totalTip => _billAmont * (_tipPercentage / 100);
  double get grandTotal => _billAmont + totalTip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tip Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.greenAccent),

              child: Column(
                children: [
                  Text('Total Per Person'),
                  Text('\$$totalPerPerson'),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [Text('Total Tip'), Text('\$$totalTip')],
                      ),
                      Column(
                        children: [Text('Grand Total'), Text('\$$grandTotal')],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Text('Bill Amount'),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  _billAmont = double.parse(value);
                });
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Text('Tip percentage'),
            Row(
              children: [10, 15, 18, 20].map((value) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _tipPercentage = value.toDouble();
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Text(value.toString()),
                  ),
                );
              }).toList(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Number of people'),
                CounterButtonWidget(
                  value: _person,
                  increment: (value) {
                    setState(() {
                      _person = value;
                    });
                  },
                  decrement: (value) {
                    setState(() {
                      _person = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
