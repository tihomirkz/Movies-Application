enum ResultStatus {
  success, error
}

class Result<T, E> {
  final E? error;
  final T? value;
  final ResultStatus status;

  const Result.success(this.value)
      : status = ResultStatus.success,
        error = null;

  const Result.error(this.error)
      : status = ResultStatus.error,
        value = null;

}
