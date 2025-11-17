import 'package:flutter/material.dart';
import 'package:quiz_app/summary_items.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData; //<String, Object>

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return SummaryItem(data);
          }).toList(),
        ),
      ),
    );
  }
}
