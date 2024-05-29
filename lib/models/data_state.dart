class DataState<T> {
  final Map<int, T> data;
  final String? errorMessage;
  final bool isLoading;

  factory DataState.initial() {
    return DataState(
      {},
      null,
      false,
    );
  }

  DataState(
    this.data,
    this.errorMessage,
    this.isLoading,
  );

  DataState<T> copyWith({
    Map<int, T>? data,
    String? errorMessage,
    bool? isLoading,
  }) {
    return DataState<T>(
      data ?? this.data,
      // If data is non-null, we wipe any previous error message
      data != null ? null : errorMessage ?? this.errorMessage,
      isLoading ?? this.isLoading,
    );
  }

  // @override
  // int get hashCode => hashValues(data, errorMessage, isLoading);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is DataState<T> &&
            data == other.data &&
            errorMessage == other.errorMessage &&
            isLoading == other.isLoading);
  }
}
