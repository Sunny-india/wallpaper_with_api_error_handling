class MyException implements Exception {
  MyException({required this.title, required this.body});
  String title;
  String body;
  // just because we're implementing this class from Exception class;
  // It's mandatory to override all the functions mentioned in that. So be it.

  @override
  String toString() {
    return '$title: $body';
  }
}

// Now based on what all types of error code API response might bring;
// we would create our classes, and have them extended by MyException class;
// Further, because we're extending a subclass with a superclass which has
// a parameterised body; we need to take it in child class and pass it to
// its super-class through super constructor. This is the whole logic behind this
// all.

/// when status code is 500, means this error happens due to
/// internet connectivity;
class FetchDataException extends MyException {
  // brings body with it; when called; but we don't need to make use of
  // that here, so did not take any String body parameter here
  // instead we passed that to its super constructor.
  FetchDataException({required String body})
      : super(title: 'Data Communication Error', body: body);
}

///===status code error is 400===///
/// means when there is any error in API itself ///
class BadRequestException extends MyException {
  BadRequestException({required String body})
      : super(title: 'Bad Request Error', body: body);
}

///=== status code error is 401 and 403===///
/// means when you're not even authorised to use this request.///
class UnauthorisedException extends MyException {
  UnauthorisedException({required String body})
      : super(title: 'Unauthorised Error', body: body);
}

///=== status code error is ??===///
/// means when API is correct, but any input we send in that API is not
/// correct, like any  key: value pair is not correct in query.
class InvalidInputException extends MyException {
  InvalidInputException({required String body})
      : super(title: 'Invalid Input Error', body: body);
}
