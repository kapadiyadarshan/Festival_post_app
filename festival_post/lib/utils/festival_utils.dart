import '../models/festival_models.dart';

List<Map> allFestival = [
  {
    "name": "Diwali",
    "image": "assets/festival_logo/diwali.png",
    "BGimage": [
      "https://img.freepik.com/free-vector/yellow-happy-diwali-background-with-text-space-lamp-design_1017-39929.jpg?w=1800&t=st=1691464704~exp=1691465304~hmac=c6f0e015ce3c302814d2daa934b1568842b7839464e566ef9837957a99cc111d",
      "https://t3.ftcdn.net/jpg/04/52/27/28/360_F_452272870_Hf8nMY4LmJuKFZ26r4AvZVWli9n0aURM.jpg",
    ]
  },
  {
    "name": "Makar Sakranti",
    "image": "assets/festival_logo/kite.png",
    "BGimage": [
      "https://img.freepik.com/free-vector/yellow-happy-diwali-background-with-text-space-lamp-design_1017-39929.jpg?w=1800&t=st=1691464704~exp=1691465304~hmac=c6f0e015ce3c302814d2daa934b1568842b7839464e566ef9837957a99cc111d",
      "https://t3.ftcdn.net/jpg/04/52/27/28/360_F_452272870_Hf8nMY4LmJuKFZ26r4AvZVWli9n0aURM.jpg",
    ]
  },
  {
    "name": "Holi",
    "image": "assets/festival_logo/holi.png",
    "BGimage": [
      "https://img.freepik.com/free-vector/yellow-happy-diwali-background-with-text-space-lamp-design_1017-39929.jpg?w=1800&t=st=1691464704~exp=1691465304~hmac=c6f0e015ce3c302814d2daa934b1568842b7839464e566ef9837957a99cc111d",
      "https://t3.ftcdn.net/jpg/04/52/27/28/360_F_452272870_Hf8nMY4LmJuKFZ26r4AvZVWli9n0aURM.jpg",
    ]
  },
  {
    "name": "Raksha Bandhan",
    "image": "assets/festival_logo/rakhi.png",
    "BGimage": [
      "https://img.freepik.com/free-vector/yellow-happy-diwali-background-with-text-space-lamp-design_1017-39929.jpg?w=1800&t=st=1691464704~exp=1691465304~hmac=c6f0e015ce3c302814d2daa934b1568842b7839464e566ef9837957a99cc111d",
      "https://t3.ftcdn.net/jpg/04/52/27/28/360_F_452272870_Hf8nMY4LmJuKFZ26r4AvZVWli9n0aURM.jpg",
    ]
  },
  {
    "name": "Janmashtmi",
    "image": "assets/festival_logo/janmashtmi.png",
    "BGimage": [
      "https://img.freepik.com/free-vector/yellow-happy-diwali-background-with-text-space-lamp-design_1017-39929.jpg?w=1800&t=st=1691464704~exp=1691465304~hmac=c6f0e015ce3c302814d2daa934b1568842b7839464e566ef9837957a99cc111d",
      "https://t3.ftcdn.net/jpg/04/52/27/28/360_F_452272870_Hf8nMY4LmJuKFZ26r4AvZVWli9n0aURM.jpg",
    ]
  },
  // {
  //   "name": "Independence Day",
  //   "image": "assets/festival_logo/flag.png",
  // },
  // {
  //   "name": "Ganesh Chaturthi",
  //   "image": "assets/festival_logo/ganesha.png",
  // },
  // {
  //   "name": "Navratri",
  //   "image": "assets/festival_logo/navratri.png",
  // },
  // {
  //   "name": "Christmas",
  //   "image": "assets/festival_logo/christmas.png",
  // },
];

List<festival> festivalData = allFestival
    .map(
      (e) => festival.fromMap(
        data: e,
      ),
    )
    .toList();
