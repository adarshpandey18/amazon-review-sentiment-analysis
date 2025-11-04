class Analysismodel {
  final String sentimentLabel;
  final double avgScore;
  final String summary;

  Analysismodel(this.sentimentLabel, this.avgScore, this.summary);

  factory Analysismodel.fromJson(Map<String, dynamic> json) {
    return Analysismodel(
      json['sentimentLabel'] ?? '',
      (json['averageScore'] ?? 0).toDouble(),
      json['summary'] ?? '',
    );
  }

  static Analysismodel empty() => Analysismodel('', 0.0, '');
}
