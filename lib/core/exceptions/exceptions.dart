abstract class Exceptions {
  String message;

  Exceptions(this.message);

  @override
  String toString() {
    return message;
  }
}

class LocalException extends Exceptions {
  LocalException(super.message);

  @override
  String toString() {
    return super.message;
  }
}

class RemoteException extends Exceptions {
  RemoteException(super.message);

  @override
  String toString() {
    return super.message;
  }
}
