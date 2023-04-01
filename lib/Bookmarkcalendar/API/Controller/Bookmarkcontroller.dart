import 'package:flutter_application_2/Bookmarkcalendar/API/Model/Bookmark.dart';
import 'package:http/http.dart' show Client;

class BookmarkController {
  final String baseUrl = "http://127.0.0.1:8000";
  Client client = Client();

  Future<List<Bookmarkmodel>> getAllbookmark() async {
    final response = await client.get(Uri.parse("$baseUrl/api/v1/bookmark/4"));
    if (response.statusCode == 200) {
      return BookmarkmodelFromJson(response.body);
    } else {
      return null;
    }
  }
}
