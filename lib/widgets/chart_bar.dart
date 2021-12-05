import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double spendingOfWeekPre;

  ChartBar({required this.label, required this.amount, required this.spendingOfWeekPre});
  // const ChartBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(amount.toString()),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(220, 220, 220, 1.0)),
              ),
              FractionallySizedBox(
                heightFactor: spendingOfWeekPre,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                ),
              )
            ],
          ),
        ),
        Text(label)
      ],
    );
  }
}
