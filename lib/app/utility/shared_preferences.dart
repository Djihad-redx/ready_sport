


class Shared{
  static final Shared _singleton = Shared._internal();

  factory Shared() {
    return _singleton;
  }

  Shared._internal();
  //
  // static Future<String> getFromShared(String key) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getString("$key") ?? "";
  // }
  //
  // static void setInShared(String key,String value) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.setString("$key", value);
  // }

}