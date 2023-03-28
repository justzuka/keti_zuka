import 'dart:ffi';

class MyUser {
  String? username;
  String? email;
  String? profilePicture;
  double? helpTotal;
  double? donorTotal;
  DateTime? createdAt;

  MyUser();

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'profilePicture': profilePicture,
        'helpTotal': helpTotal,
        'donorTotal': donorTotal,
        'createdAt': createdAt,
      };

  MyUser.fromSnapshot(snapshot)
      : username = snapshot.data()['username'],
        email = snapshot.data()['email'],
        profilePicture = snapshot.data()['profilePicture'],
        helpTotal = snapshot.data()['helpTotal'] as double,
        donorTotal = snapshot.data()['donorTotal'] as double,
        createdAt = snapshot.data()['createdAt'].toDate();
}
