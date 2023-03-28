import 'dart:convert';
import 'package:http/http.dart' as http;

import 'DatabaseModels/LeetcodeProfile.dart';

String API = "https://leetcode-stats-api.herokuapp.com/";
Future getLeetcodeData(String username) async {
  var response = await http.get(Uri.parse(API + username));

  if (jsonDecode(response.body)['status'] == 'error') {
    return null;
  }
  LeetcodeProfile leetcodeProfile =
      LeetcodeProfile.fromJson(jsonDecode(response.body));
  //decode response.body to Json
  return leetcodeProfile;
}
