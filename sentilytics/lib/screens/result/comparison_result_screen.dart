import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sentilytics/model/AnalysisModel.dart';
import 'package:sentilytics/routes/app_router_constant.dart';

class ComparisonResultScreen extends StatelessWidget {
  final Analysismodel model1;
  final Analysismodel model2;

  const ComparisonResultScreen({
    super.key,
    required this.model1,
    required this.model2,
  });

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

  Widget _buildModelCard(String title, Analysismodel model) {
    final color = _getSentimentColor(model.sentimentLabel);
    final icon = _getSentimentIcon(model.sentimentLabel);

    return Expanded(
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(
                model.sentimentLabel.toUpperCase(),
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Score: ${model.avgScore.toStringAsFixed(2)}",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    model.summary,
                    style: GoogleFonts.openSans(fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final winner =
        model1.avgScore > model2.avgScore
            ? "Model 1 Wins 🎉"
            : model1.avgScore < model2.avgScore
            ? "Model 2 Wins 🎉"
            : "It's a Tie 🤝";

    return Scaffold(
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
        title: const Text("Comparison Result"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              winner,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ).animate().fadeIn().slideY(),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  _buildModelCard("Model 1", model1),
                  const SizedBox(width: 12),
                  _buildModelCard("Model 2", model2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
