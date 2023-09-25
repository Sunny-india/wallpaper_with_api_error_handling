import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_with_bloc/api/my_exception.dart';

String basicUrl = 'https://api.pexels.com/v1/';
String trendingPhotos = '${basicUrl}curated';
String searchPhotos = '${basicUrl}search';

class APIHelper {
  Future<dynamic> fetchAPI(String url, Map<String, String>? mHeader) async {
    var res = await http.get(Uri.parse(url),
        headers: mHeader ??
            {
              'Authorization':
                  'zniJvGPGePLscmLk7ixnLyhOIWq0QYJxvC8R32kH50Xmjkh4Bzjict80'
            });
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else if (res.statusCode == 400) {
      //todo: The main Error handling code would be written here
      throw BadRequestException(body: res.body.toString());
    } else if (res.statusCode == 401 || res.statusCode == 403) {
      //todo: The main Error handling code would be written here
      throw UnauthorisedException(body: res.body.toString());
    } else if (res.statusCode == 500) {
      //todo: The main Error handling code would be written here
      // Just because this brings an internet related exception,
      // it means it does not have any body; So would handle that way
      throw FetchDataException(body: 'Internet Communicating Error');
    } else {
      //todo: The main Error handling code would be written here
      // Just because this brings an internet related exception,
      // it means it does not have any body; So would handle that way
      throw FetchDataException(body: 'Internet Communicating Error');
    }
  }
}
