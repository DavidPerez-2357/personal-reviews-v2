
abstract interface class DbModel<T> {
  Map<String, dynamic> toJson();

  factory DbModel.fromJson(Map<String, dynamic> map) {
    throw UnimplementedError('fromJson must be implemented by subclasses');
  }
}