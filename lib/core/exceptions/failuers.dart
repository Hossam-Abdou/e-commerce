abstract class Failures {
  String message;

  Failures(this.message);

  @override
  String toString() {
    return message;
  }
}

class LocalFailures extends Failures {
  LocalFailures(super.message);

  @override
  String toString() {
    return super.message;
  }
}

class RemoteFailures extends Failures {
  RemoteFailures(super.message);

  @override
  String toString() {
    return super.message;
  }
}

class InvalidCredtionalFailures extends Failures {
  InvalidCredtionalFailures(super.message);

  @override
  String toString() {
    return super.message;
  }
}
