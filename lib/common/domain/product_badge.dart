class ProductBadge {
  const ProductBadge({
    required this.name,
    required this.colorValue,
  });

  final String name;
  final int colorValue;

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "colorValue": colorValue,
    };
  }

  static ProductBadge? fromMap(Map<String, dynamic>? badgeMap) {
    if (badgeMap == null) {
      return null;
    } else {
      return ProductBadge(
          name: badgeMap["name"], colorValue: badgeMap["colorValue"]);
    }
  }
}
