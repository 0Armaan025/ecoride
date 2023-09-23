class Hackathon {
  String hackName;
  String startDate;
  String endDate;
  String image;
  String description;
  bool hasPrizes;
  Map<String, String> prizes;
  Hackathon({
    required this.hackName,
    required this.startDate,
    required this.endDate,
    required this.image,
    required this.description,
    required this.hasPrizes,
    required this.prizes,
  });
  static Hackathon fromMap(Map<String, dynamic> data) {
    return Hackathon(
        hackName: data["hackName"]!,
        startDate: data['startDate']!,
        endDate: data['endDate']!,
        image: data['image']!,
        description: data['description']!,
        hasPrizes: data['hasPrizes']!,
        prizes: data['prizes']!);
  }

  Map<String, dynamic> toMap() {
    return {
      "hackName": hackName,
      "startDate": startDate,
      "endDate": endDate,
      "image": image,
      "description": description,
      "hasPrizes": hasPrizes,
      "prizes": prizes,
    };
  }
}
