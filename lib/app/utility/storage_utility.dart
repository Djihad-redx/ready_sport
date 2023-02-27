import 'package:fit_cube/utilities/consts.dart';
import 'package:get_storage/get_storage.dart';

class StorageUtility {
  StorageUtility._();

  static final box = GetStorage();

  static void cleanStorage() {
     storage.forEach((key, value) {
       removeKey(key);
     });
  }

  static void saveInStorage(String key, String value) {
    box.write(key, value);
  }

  static Future<String?> readFromStorage(String key) async {
    return box.read(key);
  }


  static void removeKey(String key) {
    box.remove(key);
  }
}
