class Ride {
  String name;
  String description;
  String carModel;
  String maxPeople;
  bool maskRequired;
  String ID;
  String publishedBy;
  String image;
  String destination;
  Ride({
    required this.name,
    required this.description,
    required this.carModel,
    required this.maxPeople,
    required this.maskRequired,
    required this.ID,
    required this.publishedBy,
    required this.image,
    required this.destination,
  });
  static Ride fromMap(Map<String, dynamic> data) {
    return Ride(
      name: data['name'],
      description: data['description'],
      carModel: data['carModel'],
      maxPeople: data['maxPeople'],
      maskRequired: data['maskRequired'],
      ID: data['ID'],
      publishedBy: data['publishedBy'],
      image: data['image'],
      destination: data["destination"],
    );
  }
}
