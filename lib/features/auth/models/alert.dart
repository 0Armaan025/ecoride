// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AlertModel {
  final String alertTitle;
  final String alertDescription;
  final String alertTime;
  AlertModel({
    required this.alertTitle,
    required this.alertDescription,
    required this.alertTime,
  });

  AlertModel copyWith({
    String? alertTitle,
    String? alertDescription,
    String? alertTime,
  }) {
    return AlertModel(
      alertTitle: alertTitle ?? this.alertTitle,
      alertDescription: alertDescription ?? this.alertDescription,
      alertTime: alertTime ?? this.alertTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alertTitle': alertTitle,
      'alertDescription': alertDescription,
      'alertTime': alertTime,
    };
  }

  factory AlertModel.fromMap(Map<String, dynamic> map) {
    return AlertModel(
      alertTitle: map['alertTitle'] as String,
      alertDescription: map['alertDescription'] as String,
      alertTime: map['alertTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlertModel.fromJson(String source) => AlertModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AlertModel(alertTitle: $alertTitle, alertDescription: $alertDescription, alertTime: $alertTime)';

  @override
  bool operator ==(covariant AlertModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.alertTitle == alertTitle &&
      other.alertDescription == alertDescription &&
      other.alertTime == alertTime;
  }

  @override
  int get hashCode => alertTitle.hashCode ^ alertDescription.hashCode ^ alertTime.hashCode;
}


