import '../models/festival_models.dart';

List<Map> allFestival = [
  {
    "name": "Diwali",
    "image": "assets/festival_logo/diwali.png",
  },
  {
    "name": "Makar Sakranti",
    "image": "assets/festival_logo/kite.png",
  },
  {
    "name": "Holi",
    "image": "assets/festival_logo/holi.png",
  },
  {
    "name": "Raksha Bandhan",
    "image": "assets/festival_logo/rakhi.png",
  },
  {
    "name": "Janmashtmi",
    "image": "assets/festival_logo/janmashtmi.png",
  },
  {
    "name": "Independence Day",
    "image": "assets/festival_logo/flag.png",
  },
  {
    "name": "Ganesh Chaturthi",
    "image": "assets/festival_logo/ganesha.png",
  },
  {
    "name": "Navratri",
    "image": "assets/festival_logo/navratri.png",
  },
  {
    "name": "Christmas",
    "image": "assets/festival_logo/christmas.png",
  },
];

List<festival> festivalData = allFestival
    .map(
      (e) => festival.fromMap(
        data: e,
      ),
    )
    .toList();
