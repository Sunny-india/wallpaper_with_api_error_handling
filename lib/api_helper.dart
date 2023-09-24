import 'dart:convert';

import 'package:http/http.dart' as http;

String basicUrl = 'https://api.pexels.com/v1/';
String trendingPhotos = '${basicUrl}curated';
String searchPhotos = '${basicUrl}search';

class APIHelper {
  void fetchAPI(String url, Map<String, String>? mHeader) async {
    var res = await http.get(Uri.parse(url),
        headers: mHeader ??
            {
              'Authorization':
                  'zniJvGPGePLscmLk7ixnLyhOIWq0QYJxvC8R32kH50Xmjkh4Bzjict80'
            });
    if (res.statusCode == 200) {
      jsonDecode(res.body);
    } else {
      //todo: The main Error handling code would be written here
    }
  }
}
