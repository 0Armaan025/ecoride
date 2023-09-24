// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CargoModel {
  final String cargoName;
  final String cargoOrigin;
  final String cargoShipperEmail;
  final String cargoShipperUid;
  final String cargoDestination;
  final String cargoDescription;
  final String cargoWeight;
  final String professionalismCheck;
  final String cargoID;
  CargoModel({
    required this.cargoID,
    required this.cargoName,
    required this.cargoOrigin,
    required this.cargoShipperEmail,
    required this.cargoShipperUid,
    required this.cargoDestination,
    required this.cargoDescription,
    required this.cargoWeight,
    required this.professionalismCheck,
  });

  CargoModel copyWith({
    String? cargoID,
    String? cargoName,
    String? cargoOrigin,
    String? cargoShipperEmail,
    String? cargoShipperUid,
    String? cargoDestination,
    String? cargoDescription,
    String? cargoWeight,
    String? professionalismCheck,
  }) {
    return CargoModel(
      cargoID: cargoID ?? this.cargoID,
      cargoName: cargoName ?? this.cargoName,
      cargoOrigin: cargoOrigin ?? this.cargoOrigin,
      cargoShipperEmail: cargoShipperEmail ?? this.cargoShipperEmail,
      cargoShipperUid: cargoShipperUid ?? this.cargoShipperUid,
      cargoDestination: cargoDestination ?? this.cargoDestination,
      cargoDescription: cargoDescription ?? this.cargoDescription,
      cargoWeight: cargoWeight ?? this.cargoWeight,
      professionalismCheck: professionalismCheck ?? this.professionalismCheck,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "cargoID": cargoID,
      'cargoName': cargoName,
      'cargoOrigin': cargoOrigin,
      'cargoShipperEmail': cargoShipperEmail,
      'cargoShipperUid': cargoShipperUid,
      'cargoDestination': cargoDestination,
      'cargoDescription': cargoDescription,
      'cargoWeight': cargoWeight,
      'professionalismCheck': professionalismCheck,
    };
  }

  factory CargoModel.fromMap(Map<String, dynamic> map) {
    return CargoModel(
      cargoID: map["cargoID"],
      cargoName: map['cargoName'] as String,
      cargoOrigin: map['cargoOrigin'] as String,
      cargoShipperEmail: map['cargoShipperEmail'] as String,
      cargoShipperUid: map['cargoShipperUid'] as String,
      cargoDestination: map['cargoDestination'] as String,
      cargoDescription: map['cargoDescription'] as String,
      cargoWeight: map['cargoWeight'] as String,
      professionalismCheck: map['professionalismCheck'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CargoModel.fromJson(String source) =>
      CargoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CargoModel(cargoName: $cargoName, cargoOrigin: $cargoOrigin, cargoShipperEmail: $cargoShipperEmail, cargoShipperUid: $cargoShipperUid, cargoDestination: $cargoDestination, cargoDescription: $cargoDescription, cargoWeight: $cargoWeight, professionalismCheck: $professionalismCheck)';
  }

  @override
  bool operator ==(covariant CargoModel other) {
    if (identical(this, other)) return true;

    return other.cargoName == cargoName &&
        other.cargoOrigin == cargoOrigin &&
        other.cargoShipperEmail == cargoShipperEmail &&
        other.cargoShipperUid == cargoShipperUid &&
        other.cargoDestination == cargoDestination &&
        other.cargoDescription == cargoDescription &&
        other.cargoWeight == cargoWeight &&
        other.professionalismCheck == professionalismCheck;
  }

  @override
  int get hashCode {
    return cargoName.hashCode ^
        cargoOrigin.hashCode ^
        cargoShipperEmail.hashCode ^
        cargoShipperUid.hashCode ^
        cargoDestination.hashCode ^
        cargoDescription.hashCode ^
        cargoWeight.hashCode ^
        professionalismCheck.hashCode;
  }
}
