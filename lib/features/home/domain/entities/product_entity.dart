class ProductEntity {
  final int? id;
  final String? name;

  ProductEntity({this.id, this.name});

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(id: map['id'], name: map['name']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }
}
