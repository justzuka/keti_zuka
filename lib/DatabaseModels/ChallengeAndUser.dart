import 'dart:ffi';

class ChallengeAndUser {
  String? userID;
  String? challengeID;
  double? currentryRaised;
  String? challengeType;
  String? leetcodeUsername;
  int? easy;
  int? medium;
  int? hard;
  bool? exited;
  DateTime? createdAt;

  ChallengeAndUser();

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'challengeID': challengeID,
        'currentryRaised': currentryRaised,
        'challengeType': challengeType,
        'leetcodeUsername': leetcodeUsername,
        'easy': easy,
        'medium': medium,
        'hard': hard,
        'exited': exited,
        'createdAt': createdAt,
      };

  ChallengeAndUser.fromSnapshot(snapshot)
      : userID = snapshot.data()['userID'],
        challengeID = snapshot.data()['challengeID'],
        currentryRaised = snapshot.data()['currentryRaised'] as double,
        challengeType = snapshot.data()['challengeType'],
        leetcodeUsername = snapshot.data()['leetcodeUsername'],
        easy = snapshot.data()['easy'] as int,
        medium = snapshot.data()['medium'] as int,
        hard = snapshot.data()['hard'] as int,
        exited = snapshot.data()['exited'],
        createdAt = snapshot.data()['createdAt'].toDate();
}
