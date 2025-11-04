import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sentilytics/model/analysis_model.dart';
import 'package:sentilytics/routes/app_router_constant.dart';

class ResultScreen extends StatelessWidget {
  final Analysismodel analysismodel;

  const ResultScreen({super.key, required this.analysismodel});

  Color _getSentimentColor(String label) {
    switch (label.toLowerCase()) {
      case 'positive':
        return Colors.green;
      case 'negative':
        return Colors.red;
      case 'neutral':
        return Colors.grey;
      default:
        return Colors.blueGrey;
    }
  }

  IconData _getSentimentIcon(String label) {
    switch (label.toLowerCase()) {
      case 'positive':
        return FontAwesomeIcons.faceSmile;
      case 'negative':
        return FontAwesomeIcons.faceFrown;
      case 'neutral':
        return FontAwesomeIcons.faceMeh;
      default:
        return FontAwesomeIcons.circleQuestion;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sentimentColor = _getSentimentColor(analysismodel.sentimentLabel);
    final sentimentIcon = _getSentimentIcon(analysismodel.sentimentLabel);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go(AppRouterConstant.bottomAppBarRoutePath);
              }
            },
            icon: Icon(Icons.arrow_back),
          ),
        ],
        title: const Text("Analysis Result"),
        backgroundColor: sentimentColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Icon(
                      sentimentIcon,
                      color: sentimentColor,
                      size: 48,
                    ).animate().fadeIn(),
                    const SizedBox(height: 16),
                    Text(
                      analysismodel.sentimentLabel.toUpperCase(),
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: sentimentColor,
                      ),
                    ).animate().slideY(duration: 400.ms),
                    const SizedBox(height: 8),
                    Text(
                      "Avg Score: ${analysismodel.avgScore.toStringAsFixed(2)}",
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ).animate().fadeIn(delay: 300.ms),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Card(
                color: Colors.white,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Text(
                      analysismodel.summary,
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ).animate().fadeIn(delay: 500.ms),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
