import 'dart:ffi';

class Challenge {
  String? charityName;
  String? ownerID;
  String? challengeType;
  double? approxAmount;
  double? currentlyRaised;
  bool? finished;
  String? description;
  DateTime? createdAt;

  Challenge();

  Map<String, dynamic> toJson() => {
        'charityName': charityName,
        'ownerID': ownerID,
        'challengeType': challengeType,
        'approxAmount': approxAmount,
        'currentlyRaised': currentlyRaised,
        'finished': finished,
        'description': description,
        'createdAt': createdAt,
      };

  Challenge.fromSnapshot(snapshot)
      : charityName = snapshot.data()['charityName'],
        ownerID = snapshot.data()['ownerID'],
        challengeType = snapshot.data()['challengeType'],
        approxAmount = snapshot.data()['approxAmount'] as double,
        currentlyRaised = snapshot.data()['currentlyRaised'] as double,
        finished = snapshot.data()['finished'],
        description = snapshot.data()['description'],
        createdAt = snapshot.data()['createdAt'].toDate();
}
