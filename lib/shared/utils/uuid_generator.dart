import 'package:uuid/uuid.dart';

class UuIdGenerator {
  static String generateV4() {
    Uuid uuid = const Uuid();
    return uuid.v4();
  }
}
