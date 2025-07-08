import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sentilytics/screens/change%20name/change_name_screen.dart';
import 'package:sentilytics/service/analysis_service.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AnalysisProvider extends ChangeNotifier {
  final AnalysisService analysisService = AnalysisService();
  bool loading = false;
  Future<void> getAnalysis(String url, BuildContext context) async {
    loading = true;
    notifyListeners();

    print("Calling analysisService.getAnalysis()...");
    final analysismodel = await analysisService.getAnalysis(url);

    print("Sentiment Label: ${analysismodel.sentimentLabel}");
    print("Average Score: ${analysismodel.avgScore}");
    print("Summary: ${analysismodel.summary}");

    loading = false;
    notifyListeners();

    if (analysismodel.sentimentLabel.isEmpty) {
      print("Analysis failed – Empty sentiment label");
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(message: 'Failed to perform analysis.'),
      );
    } else {
      context.go('/result', extra: analysismodel);
    }
  }
}
