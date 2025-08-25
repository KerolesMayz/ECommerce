sealed class Result<T> {}

class Success<T> extends Result<T> {
  T data;

  Success({required this.data});
}

class ServerError<T> extends Result<T> {
  String code;
  String message;

  ServerError({required this.code, required this.message});
}

class ConnectivityError<T> extends Result<T> {
  String message = 'No Internet Connection';
}

class GeneralException<T> extends Result<T> {
  Exception exception;

  GeneralException({required this.exception});
}
