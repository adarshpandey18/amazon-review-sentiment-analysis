import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sentilytics/model/AnalysisModel.dart';

class AnalysisService {
  final String backendBaseUrl = "http://10.0.2.2:8080/api/sentilytics";

  Future<Analysismodel> getAnalysis(String amazonUrl) async {
    try {
      final asin = extractASIN(amazonUrl);

      if (asin == null) {
        print("ASIN extraction failed");
        return Analysismodel.empty();
      }

      final apiUrl = Uri.parse('$backendBaseUrl/$asin');
      print("Extracted ASIN: $asin");
      print("Calling backend: $apiUrl");

      final response = await http.get(apiUrl);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

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
