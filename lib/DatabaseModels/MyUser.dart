import 'dart:ffi';

class MyUser {
  String? username;
  String? email;
  String? profilePicture;
  double? helpTotal;
  double? donorTotal;
  List<String>? recentChallenges;
  List<String>? donorChallenges;
  String? leetcodeUsername;
  DateTime? createdAt;

  MyUser();

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'profilePicture': profilePicture,
        'helpTotal': helpTotal,
        'donorTotal': donorTotal,
        'recentChallenges': recentChallenges,
        'donorChallenges': donorChallenges,
        'leetcodeUsername': leetcodeUsername,
        'createdAt': createdAt,
      };

  MyUser.fromSnapshot(snapshot)
      : username = snapshot.data()['username'],
        email = snapshot.data()['email'],
        profilePicture = snapshot.data()['profilePicture'],
        helpTotal = snapshot.data()['helpTotal'] as double,
        donorTotal = snapshot.data()['donorTotal'] as double,
        recentChallenges =
            List<String>.from(snapshot.data()['recentChallenges']),
        donorChallenges = List<String>.from(snapshot.data()['donorChallenges']),
        leetcodeUsername = snapshot.data()['leetcodeUsername'],
        createdAt = snapshot.data()['createdAt'].toDate();
}
