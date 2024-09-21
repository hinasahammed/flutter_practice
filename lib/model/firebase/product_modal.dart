// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModal {
  final String name;
  final String category;
  final String price;
  final String stock;

  ProductModal({
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
  });

  ProductModal copyWith({
    String? name,
    String? category,
    String? price,
    String? stock,
  }) {
    return ProductModal(
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      stock: stock ?? this.stock,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'category': category,
      'price': price,
      'stock': stock,
    };
  }

  factory ProductModal.fromMap(Map<String, dynamic> map) {
    return ProductModal(
      name: map['name'] as String,
      category: map['category'] as String,
      price: map['price'] as String,
      stock: map['stock'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModal.fromJson(String source) => ProductModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModal(name: $name, category: $category, price: $price, stock: $stock)';
  }

  @override
  bool operator ==(covariant ProductModal other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.category == category &&
      other.price == price &&
      other.stock == stock;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      category.hashCode ^
      price.hashCode ^
      stock.hashCode;
  }
}
