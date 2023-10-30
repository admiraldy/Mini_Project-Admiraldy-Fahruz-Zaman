import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> fetchDriverDetails(String driverName, String team) async {
  const apiKey = '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';
  const endpoint =
      'https://api.openai.com/v1/engines/davinci-codex/completions';

  final response = await http.post(
    Uri.parse(endpoint),
    headers: {
      'Authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'prompt':
          'Create a profile for $driverName, a Formula One driver from the $team team. Include key details about their career and achievements.',
      'max_tokens': 100,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['choices'][0]['text'];
  } else {
    throw Exception('Failed to fetch driver details');
  }
}
