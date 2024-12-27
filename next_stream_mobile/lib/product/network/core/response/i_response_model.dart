/// Interface for all responses from the API
abstract interface class IResponseModel {
  /// Converts the object to a json map.
  dynamic toJson();

  /// Converts the JSON map to an object. Used via sample models registered
  /// in the init function of the network manager.
  IResponseModel fromJson(dynamic json);
}
