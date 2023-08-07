class festival {
  final String name;
  final String image;

  festival({required this.name, required this.image});

  factory festival.fromMap({required Map data}) {
    return festival(name: data["name"], image: data["image"]);
  }
}
