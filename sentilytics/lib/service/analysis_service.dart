import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sentilytics/model/analysis_model.dart';

class AnalysisService {
//  NOTE FOR CONTRIBUTORS:
// Change the below base URL according to your setup:
//
//  If you're running backend locally on emulator:
// const String backendBaseUrl = 'http://10.0.2.2:8080';
//
//  If you're running on a real device (same Wi-Fi as backend):
// const String backendBaseUrl = 'http://<YOUR_PC_LOCAL_IP>:8080';
//
//  If backend is deployed online (Render/Railway/AWS/etc):
// const String backendBaseUrl = 'https://your-deployed-backend-url.com';
//
// Make sure backend and Flutter app are using same network or public domain.

  final String backendBaseUrl = "http://10.0.2.2:8080/api/sentilytics";

  Future<Analysismodel> getAnalysis(String amazonUrl) async {
    try {
      final asin = extractASIN(amazonUrl);

      if (asin == null) {
        return Analysismodel.empty();
      }

      final apiUrl = Uri.parse('$backendBaseUrl/$asin');
      final response = await http.get(apiUrl);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Analysismodel.fromJson(data);
      } else {
        print("Backend error: ${response.body}");
      }
    } catch (e) {
      print("Exception during analysis: $e");
    }

    return Analysismodel.empty();
  }

  String? extractASIN(String url) {
    try {
      final regex = RegExp(r'/([A-Z0-9]{10})(?:[/?]|$)');
      final match = regex.firstMatch(url);
      if (match != null) {
        return match.group(1);
      }
    } catch (e) {
      print("Error extracting ASIN: $e");
    }
    return null;
  }
}