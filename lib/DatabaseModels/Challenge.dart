import 'dart:ffi';

class Challenge {
  String? charityName;
  String? ownerID;
  String? challengeType;
  double? approxAmount;
  double? currentlyRaised;
  List<String>? participants;
  bool? finished;
  DateTime? createdAt;

  Challenge();

  Map<String, dynamic> toJson() => {
        'charityName': charityName,
        'ownerID': ownerID,
        'challengeType': challengeType,
        'approxAmount': approxAmount,
        'currentlyRaised': currentlyRaised,
        'participants': participants,
        'finished': finished,
        'createdAt': createdAt,
      };

  Challenge.fromSnapshot(snapshot)
      : charityName = snapshot.data()['charityName'],
        ownerID = snapshot.data()['ownerID'],
        challengeType = snapshot.data()['challengeType'],
        approxAmount = snapshot.data()['approxAmount'] as double,
        currentlyRaised = snapshot.data()['currentlyRaised'] as double,
        participants = List<String>.from(snapshot.data()['participants']),
        finished = snapshot.data()['finished'],
        createdAt = snapshot.data()['createdAt'].toDate();
}
