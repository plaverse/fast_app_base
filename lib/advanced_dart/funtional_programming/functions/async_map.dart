Future<List<R>> asyncMap<T, R>(
    Future<R> Function(T) asyncFunction,
    List<T> items,
    ) async {
  return await Future.wait(items.map(asyncFunction));
}
