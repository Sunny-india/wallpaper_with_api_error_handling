import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:wallpaper_with_bloc/api/my_exception.dart';

// created global variables here

String basicUrl = 'https://api.pexels.com/v1/';
String trendingPhotos = '${basicUrl}curated';
String searchPhotos = '${basicUrl}search';

class APIHelper {
  Future<dynamic> fetchAPI(
      {required String url, Map<String, String>? mHeader}) async {
    Future mData;
    try {
      http.Response res = await http.get(Uri.parse(url),
          headers: mHeader ??
              {
                'Authorization':
                    'zniJvGPGePLscmLk7ixnLyhOIWq0QYJxvC8R32kH50Xmjkh4Bzjict80'
              });
      mData = responseFromNet(res);
    } on SocketException {
      throw FetchDataException(body: 'No Internet Available');
    }
    // the catch method is not used here;
    // Why? because this is what we would call in our bloc.
    // And all these exceptions would be handled in catch method.
    return mData;
  }

  Future<dynamic> responseFromNet(http.Response res) {
    //todo: The main Error handling code would be written here

    // the beauty of Dart is, it allows you to
    // throw you a whole class as an exception.

    // Just because this brings an internet related exception,
    // it means it does not have any body; So would handle that way

    switch (res.statusCode) {
      /// When you get the data from API successfully.
      case 200:
        return jsonDecode(res.body);

      ///===status code error is 400===///
      /// means when there is any error in API itself ///
      // sourced from https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
      // The server cannot or will not process the request due to something
      // that is perceived to be a client error
      // (e.g., malformed request syntax, invalid request message framing,
      // or deceptive request routing).
      case 400:
        throw BadRequestException(body: res.body.toString());

      ///=== status code error is 401 and 403===///
      /// means when you're not even authorised to use this request.///
      /// sourced from https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
      //401 Unauthorized
      // The HyperText Transfer Protocol (HTTP) 401 Unauthorized response status code
      // indicates that the client request has not been completed
      // because it lacks valid authentication credentials for the requested resource.
      // This status code is sent with an HTTP WWW-Authenticate response header
      // that contains information on how the client can request
      // for the resource again after prompting the user for authentication credentials.
      ///
      // This status code is similar to the 403 Forbidden status code,
      // except that in situations resulting in this status code,
      // user authentication can allow access to the resource.
      case 401:
      case 403:
        throw UnauthorisedException(body: res.body.toString());

      /// when status code is 500, means this error happens due to
      /// internet connectivity;
      /// sourced from https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
      // 500 Internal Server Error
      // The HyperText Transfer Protocol (HTTP)
      // 500 Internal Server Error
      // server error response code indicates that
      // the server encountered an unexpected condition
      // that prevented it from fulfilling the request.
      // This error response is a generic "catch-all" response.
      // Usually, this indicates the server cannot find a better 5xx error code
      // to response. Sometimes, server administrators log error responses like
      // the 500 status code with more details about the request
      // to prevent the error from happening again in the future.
      case 500:
      default:
        // it won't bring any body; coz it's an internet related exception. So
        // would define its body on our own
        throw FetchDataException(body: 'Internet Error');
    }
  }

  // if (res.statusCode == 200) {
  //   return jsonDecode(res.body);
  // } else if (res.statusCode == 400) {
  //   //todo: The main Error handling code would be written here
  //   // the beauty of Dart is, it allows you to
  //   // throw you a whole class as an exception.
  //   throw BadRequestException(body: res.body.toString());
  // } else if (res.statusCode == 401 || res.statusCode == 403) {
  //   //todo: The main Error handling code would be written here
  //   // the beauty of Dart is, it allows you to
  //   // throw you a whole class as an exception.
  //
  //   throw UnauthorisedException(body: res.body.toString());
  // } else if (res.statusCode == 500) {
  //   //todo: The main Error handling code would be written here
  //   // the beauty of Dart is, it allows you to
  //   // throw you a whole class as an exception.
  //
  //   // Just because this brings an internet related exception,
  //   // it means it does not have any body; So would handle that way
  //   throw FetchDataException(body: 'Internet Communicating Error');
  // }
}
