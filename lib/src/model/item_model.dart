class ItemModel {
  final String date;
  final int greenValue;
  final int pinkValue;
  final int blueValue;
  final int met;
  final double jogging;

  ItemModel({
    required this.date,
    required this.greenValue,
    required this.pinkValue,
    required this.blueValue,
    required this.met,
    required this.jogging,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
        date: json["date"],
        greenValue: json["green"],
        pinkValue: json["pink"],
        blueValue: json["blue"],
        met: json["met"],
        jogging: json["jogging"]);
  }

  static List<ItemModel> get items => _sampleJsonData
      .map(
        (item) => ItemModel.fromJson(item),
      )
      .toList();

  static List<ItemModel> get mockOlderDateItems =>
      _olderJsonData.map((item) => ItemModel.fromJson(item)).toList();

  static List<Map<String, dynamic>> get _olderJsonData => [
        {
          "date": "2022-02-14",
          "green": 56,
          "pink": 70,
          "blue": 90,
          "met": 230,
          "jogging": 4.7
        },
        {
          "date": "2022-02-13",
          "green": 56,
          "pink": 70,
          "blue": 90,
          "met": 210,
          "jogging": 4.7
        },
        {
          "date": "2022-02-12",
          "green": 56,
          "pink": 70,
          "blue": 90,
          "met": 130,
          "jogging": 4.7
        },
        {
          "date": "2022-02-12",
          "green": 56,
          "pink": 70,
          "blue": 90,
          "met": 250,
          "jogging": 4.7
        },
      ];

  static List<Map<String, dynamic>> get _sampleJsonData => [
        {
          "date": "2022-02-23",
          "green": 56,
          "pink": 70,
          "blue": 100,
          "met": 200,
          "jogging": 4.7
        },
        {
          "date": "2022-02-22",
          "green": 76,
          "pink": 30,
          "blue": 90,
          "met": 250,
          "jogging": 3.7
        },
        {
          "date": "2022-02-21",
          "green": 66,
          "pink": 80,
          "blue": 40,
          "met": 210,
          "jogging": 2.7
        },
        {
          "date": "2022-02-20",
          "green": 76,
          "pink": 77,
          "blue": 60,
          "met": 200,
          "jogging": 4.1
        },
        {
          "date": "2022-02-19",
          "green": 55,
          "pink": 75,
          "blue": 30,
          "met": 130,
          "jogging": 3.2
        },
        {
          "date": "2022-02-18",
          "green": 54,
          "pink": 73,
          "blue": 92,
          "met": 231,
          "jogging": 1.7
        },
        {
          "date": "2022-02-17",
          "green": 66,
          "pink": 78,
          "blue": 70,
          "met": 200,
          "jogging": 4.4
        },
        {
          "date": "2022-02-16",
          "green": 50,
          "pink": 70,
          "blue": 60,
          "met": 230,
          "jogging": 4.7
        },
        {
          "date": "2022-02-15",
          "green": 76,
          "pink": 90,
          "blue": 70,
          "met": 220,
          "jogging": 5.0
        }
      ];
}
