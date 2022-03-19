class Users {
  final String image;
  final String name;
  final String url;

  Users({required this.image, required this.name, required this.url});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      name: json["login"],
      url: json["html_url"],
      image: json["avatar_url"],
    );
  }
}
