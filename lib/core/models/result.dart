sealed class Result<T> {
  const Result();
}

// 성공 여부 반환 (sealed)
class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class Failure<T> extends Result<T> {
  final Exception exception;
  const Failure(this.exception);
}
