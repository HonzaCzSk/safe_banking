class Bank {
  final int id;
  final String name;
  final String rating;
  final List<String> images;
  final List<String> phishingExamples;
  final List<String> commonScams;
  final List<String> recentIncidents;
  final List<String> recommendedActions;

  Bank({
    required this.id,
    required this.name,
    required this.rating,
    required this.images,
    required this.phishingExamples,
    required this.commonScams,
    required this.recentIncidents,
    required this.recommendedActions,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json['id'],
      name: json['name'],
      rating: json['rating'],
      images: List<String>.from(json['images'] ?? []),
      phishingExamples: List<String>.from(json['phishing_examples'] ?? []),
      commonScams: List<String>.from(json['common_scams'] ?? []),
      recentIncidents: List<String>.from(json['recent_incidents'] ?? []),
      recommendedActions: List<String>.from(json['recommended_actions'] ?? []),
    );
  }
}
