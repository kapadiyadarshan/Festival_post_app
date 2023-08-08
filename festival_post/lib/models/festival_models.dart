class festival {
  final String name;
  final String image;
  final List BG;

  festival({required this.name, required this.image, required this.BG});

  factory festival.fromMap({required Map data}) {
    return festival(
        name: data["name"], image: data["image"], BG: data["BGimage"]);
  }
}
