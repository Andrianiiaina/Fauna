class User {
  dynamic idUser;
  String name;
  String password;
  String picture;
  User(
      {this.idUser,
      required this.name,
      required this.password,
      required this.picture});

  User.fromMap(Map<String, dynamic> res)
      : idUser = res["idUser"],
        name = res["name"],
        picture = res["picture"],
        password = res["password"];

  Map<String, Object?> toMap() {
    return {
      'idUser': idUser,
      'name': name,
      'picture': picture,
      'password': password,
    };
  }
}
