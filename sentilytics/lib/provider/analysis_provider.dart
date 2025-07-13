import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sentilytics/routes/app_router_constant.dart';
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

  Future<void> compareLinks(
    String url1,
    String url2,
    BuildContext context,
  ) async {
    loading = true;
    notifyListeners();

    try {
      print("Getting analysis for URL 1: $url1");
      final model1 = await analysisService.getAnalysis(url1);

      print("Getting analysis for URL 2: $url2");
      final model2 = await analysisService.getAnalysis(url2);

      loading = false;
      notifyListeners();

      if (model1.sentimentLabel.isEmpty || model2.sentimentLabel.isEmpty) {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: 'Analysis failed for one or both links.',
          ),
        );
        return;
      }

      // Navigate with both models packed in a list or map
      context.go(
        AppRouterConstant.compareResulPath,
        extra: {'model1': model1, 'model2': model2},
      );
    } catch (e) {
      print("Error during comparison: $e");
      loading = false;
      notifyListeners();
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(message: 'Something went wrong.'),
      );
    }
  }
}
