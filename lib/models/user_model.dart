part of 'objects.dart';

@JsonSerializable()
class UserModel {
  final String uid;
  final String name;
  final String email;

  UserModel(this.uid, this.name, this.email);

//--------------- Second way from Flutter packages- auto genarated
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

// ------------ Manual way from Flutter packages- auto genarated

//   //Bind Json data to User model
//   UserModel.fromJson(Map<String, dynamic> json)
//       : uid = json['uid'],
//         name = json['name'],
//         email = json['email'];

// //Convert user model into Json Object
//   Map<String, dynamic> toJson() => {
//         'uid': uid,
//         'name': name,
//         'email': email,
//       };
}
