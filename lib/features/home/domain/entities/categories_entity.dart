class CategoriesEntity {
  final String categoryId;
  final String title;
  final String image;

  CategoriesEntity({required this.categoryId, required this.title,required this.image});

  factory CategoriesEntity.fromJason(Map<String, dynamic> json) {
    return CategoriesEntity(
      categoryId: json['categoryId'],
      title: json['title'],
      image: json['image'],
    );
  }
}
 