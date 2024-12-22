class ColorsEntity {
  final String hexcolor;
  final String title;

  ColorsEntity({required this.hexcolor, required this.title});

  factory ColorsEntity.fromJson(Map<String, dynamic> json) {
    return ColorsEntity(
      hexcolor: json['hexcolor'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hexcolor': hexcolor,
      'title': title,
    };
  }
}
