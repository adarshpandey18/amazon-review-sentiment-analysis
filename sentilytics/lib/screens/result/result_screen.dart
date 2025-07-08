import 'package:flutter/material.dart';
import 'package:sentilytics/model/AnalysisModel.dart';

class ResultScreen extends StatelessWidget {
  final Analysismodel analysismodel;
  const ResultScreen({super.key, required this.analysismodel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(analysismodel.sentimentLabel),
          Text(analysismodel.avgScore.toString()),
          Text(analysismodel.summary),
        ],
      ),
    );
  }
}
