import 'dart:ffi';

class LeetcodeProfile {
  final int easy;
  final int medium;
  final int hard;

  LeetcodeProfile(
      {required this.easy, required this.medium, required this.hard});

  factory LeetcodeProfile.fromJson(json) {
    return LeetcodeProfile(
      easy: json['easySolved'],
      medium: json['mediumSolved'],
      hard: json['hardSolved'],
    );
  }
}
