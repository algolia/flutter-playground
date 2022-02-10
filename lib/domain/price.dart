class Price {
  final String? currency;
  final num? value;
  final num? discountedValue;
  final num? discountLevel;
  final bool? onSales;

  Price(
      {this.currency,
      this.value,
      this.discountedValue,
      this.discountLevel,
      this.onSales});

  static Price fromJson(Map<String, dynamic> json) {
    return Price(
      currency: json['currency'],
      value: json['value'],
      discountedValue: json['discounted_value'],
      discountLevel: json['discount_level'],
      onSales: json['on_sales'],
    );
  }

  @override
  String toString() {
    return 'Price{currency: $currency, value: $value, discountedValue: $discountedValue, discountLevel: $discountLevel, onSale: $onSales}';
  }
}
