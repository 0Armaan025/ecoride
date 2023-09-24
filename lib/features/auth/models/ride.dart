// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RideModel {
  final String rideName;
  final String rideDescription;
  final String rideUploaderUid;
  final String vehicleImage;
  final String vehicleModel;
  final String isMaskRequired;
  RideModel({
    required this.rideName,
    required this.rideDescription,
    required this.rideUploaderUid,
    required this.vehicleImage,
    required this.vehicleModel,
    required this.isMaskRequired,
  });

  RideModel copyWith({
    String? rideName,
    String? rideDescription,
    String? rideUploaderUid,
    String? vehicleImage,
    String? vehicleModel,
    String? isMaskRequired,
  }) {
    return RideModel(
      rideName: rideName ?? this.rideName,
      rideDescription: rideDescription ?? this.rideDescription,
      rideUploaderUid: rideUploaderUid ?? this.rideUploaderUid,
      vehicleImage: vehicleImage ?? this.vehicleImage,
      vehicleModel: vehicleModel ?? this.vehicleModel,
      isMaskRequired: isMaskRequired ?? this.isMaskRequired,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rideName': rideName,
      'rideDescription': rideDescription,
      'rideUploaderUid': rideUploaderUid,
      'vehicleImage': vehicleImage,
      'vehicleModel': vehicleModel,
      'isMaskRequired': isMaskRequired,
    };
  }

  factory RideModel.fromMap(Map<String, dynamic> map) {
    return RideModel(
      rideName: map['rideName'] as String,
      rideDescription: map['rideDescription'] as String,
      rideUploaderUid: map['rideUploaderUid'] as String,
      vehicleImage: map['vehicleImage'] as String,
      vehicleModel: map['vehicleModel'] as String,
      isMaskRequired: map['isMaskRequired'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RideModel.fromJson(String source) =>
      RideModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RideModel(rideName: $rideName, rideDescription: $rideDescription, rideUploaderUid: $rideUploaderUid, vehicleImage: $vehicleImage, vehicleModel: $vehicleModel, isMaskRequired: $isMaskRequired)';
  }

  @override
  bool operator ==(covariant RideModel other) {
    if (identical(this, other)) return true;

    return other.rideName == rideName &&
        other.rideDescription == rideDescription &&
        other.rideUploaderUid == rideUploaderUid &&
        other.vehicleImage == vehicleImage &&
        other.vehicleModel == vehicleModel &&
        other.isMaskRequired == isMaskRequired;
  }

  @override
  int get hashCode {
    return rideName.hashCode ^
        rideDescription.hashCode ^
        rideUploaderUid.hashCode ^
        vehicleImage.hashCode ^
        vehicleModel.hashCode ^
        isMaskRequired.hashCode;
  }
}
