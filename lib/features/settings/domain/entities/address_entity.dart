class AddressEntity {
  final String stAddress;
  final String city;
  final String state;
  final int zipCode;
  final String? id;

  AddressEntity({
    required this.stAddress,
    required this.city,
    required this.state,
    required this.zipCode,
    this.id,
  });

  factory AddressEntity.fromJson(Map<String, dynamic> json) {
    return AddressEntity(
      stAddress: json['stAddress'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zipCode'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'stAddress': stAddress,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'id': id,
    };
  }
}