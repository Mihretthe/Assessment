class Exception{
  final String message;
  Exception({required this.message}); 
}

class ServerException extends Exception{
  final String message;
  ServerException({this.message = 'Server Error'}) : super(message: message);
}


class CacheException extends Exception{
  final String message;
  CacheException({this.message = 'Cache Error'}) : super(message: message);
}