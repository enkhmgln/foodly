enum ProductGrade {
  bad,
  mediocre,
  good,
  excellent,
}

class ProductModel {
  final String id;
  final String name;
  final String brand;
  final String category; // 'food' | 'cosmetic'
  final String? barcode;
  final int score; // 0-100
  final ProductGrade grade;
  final String summary;
  final List<String> issueTags;
  final String? imageUrl;

  const ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    this.barcode,
    required this.score,
    required this.grade,
    required this.summary,
    this.issueTags = const [],
    this.imageUrl,
  });

  static ProductGrade gradeFromScore(int score) {
    if (score <= 25) return ProductGrade.bad;
    if (score <= 50) return ProductGrade.mediocre;
    if (score <= 75) return ProductGrade.good;
    return ProductGrade.excellent;
  }

  static String gradeLabel(ProductGrade grade) {
    switch (grade) {
      case ProductGrade.bad:
        return 'Bad';
      case ProductGrade.mediocre:
        return 'Mediocre';
      case ProductGrade.good:
        return 'Good';
      case ProductGrade.excellent:
        return 'Excellent';
    }
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final score = json['score'] as int? ?? 0;
    final gradeStr = json['grade'] as String?;
    final grade = gradeStr != null
        ? _gradeFromString(gradeStr)
        : gradeFromScore(score);

    final tags = json['issueTags'] as List<dynamic>?;
    final issueTags = tags != null
        ? tags.map((e) => e.toString()).toList()
        : <String>[];

    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      category: json['category'] as String? ?? 'food',
      barcode: json['barcode'] as String?,
      score: score,
      grade: grade,
      summary: json['summary'] as String? ?? '',
      issueTags: issueTags,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  static ProductGrade _gradeFromString(String s) {
    switch (s.toLowerCase()) {
      case 'bad':
        return ProductGrade.bad;
      case 'mediocre':
        return ProductGrade.mediocre;
      case 'good':
        return ProductGrade.good;
      case 'excellent':
        return ProductGrade.excellent;
      default:
        return ProductGrade.mediocre;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'category': category,
      'barcode': barcode,
      'score': score,
      'grade': ProductModel.gradeLabel(grade),
      'summary': summary,
      'issueTags': issueTags,
      'imageUrl': imageUrl,
    };
  }
}
