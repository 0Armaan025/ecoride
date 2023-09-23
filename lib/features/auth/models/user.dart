// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String name;
  final String uid;
  final String email;
  final String ecoCoins;
  final String userType;
  UserModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.ecoCoins,
    required this.userType,
  });

  UserModel copyWith({
    String? name,
    String? uid,
    String? email,
    String? ecoCoins,
    String? userType,
  }) {
    return UserModel(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      email: email ?? this.email,
      ecoCoins: ecoCoins ?? this.ecoCoins,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'email': email,
      'ecoCoins': ecoCoins,
      'userType': userType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uid: map['uid'] as String,
      email: map['email'] as String,
      ecoCoins: map['ecoCoins'] as String,
      userType: map['userType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(name: $name, uid: $uid, email: $email, ecoCoins: $ecoCoins, userType: $userType)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.uid == uid &&
        other.email == email &&
        other.ecoCoins == ecoCoins &&
        other.userType == userType;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        uid.hashCode ^
        email.hashCode ^
        ecoCoins.hashCode ^
        userType.hashCode;
  }
}
