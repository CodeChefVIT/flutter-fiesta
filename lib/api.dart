import "dart:convert";

class GeminiApi {
  static const String apiKey = "AIzaSyC6kdF0Vah7dPmSxZa45ixLld59GOKQgHM";
  static const String url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static String queryText(String text) {
    return jsonEncode(jsonDecode('''
    {
      "contents": [{
        "parts":[{
          "text": "${text.trim()}"
          }]
        }]
      }
    '''));
  }

  static List<String> responseBodyText(Map<String, dynamic> jsonData) {
    List<dynamic> parts = jsonData['candidates'][0]['content']['parts'];
    List<String> responses =
        parts.map((part) => part['text'] as String).toList();
    return responses;
  }
}
