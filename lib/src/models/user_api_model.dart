class UserApi {
  final String id;
  final String name;
  final String document;
  final String password;
  final String email;
  final DateTime birthday;
  final String gender;
  final String phone;
  final List<String> product;
  final String? image;
  final int version;

  UserApi({
    required this.id,
    required this.name,
    required this.document,
    required this.password,
    required this.email,
    required this.birthday,
    required this.gender,
    required this.phone,
    required this.product,
    this.image,
    required this.version,
  });

  // Método para crear un objeto User a partir de un mapa JSON
  factory UserApi.fromJson(Map<String, dynamic> json) {
    return UserApi(
      id: json['_id'],
      name: json['name'],
      document: json['document'],
      password: json['password'],
      email: json['email'],
      birthday: DateTime.parse(json['birthday']),
      gender: json['gender'],
      phone: json['phone'],
      product: List<String>.from(json['product']),
      image: json['image'],
      version: json['__v'],
    );
  }
} 