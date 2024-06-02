import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class LocalStorage {
  bool isLoggedIn = false;

  Future<bool> autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? logged_in = prefs.getBool('logged_in') ?? false;
    final String access_token = prefs.getString('access_token') ?? "";

    if (logged_in == true && access_token.isNotEmpty) {
      isLoggedIn = true;
    }
    return isLoggedIn;
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('logged_in');
    prefs.remove('id');

    prefs.clear();
    prefs.commit();
  }

  Future<String> getValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? logged_in = prefs.getBool('logged_in');

    String localValue = "";
    if (logged_in == true) {
      localValue = prefs.getString(key) ?? "";
    }
    return localValue.toString();
  }

  Future<bool?> updateValue(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<bool?> updateBoolValue(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<Null> loginUser(UserModel? user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', user!.id.toString());
    prefs.setString('first_name', user.firstName!);
    prefs.setString('last_name', user.lastName!);
    prefs.setString('empNum', user.empNum!);
    prefs.setString('mobileNo', user.mobileNo!);
    prefs.setString('rankId', user.rankId.toString());
    prefs.setString('access_token', user.authKey.toString());
    prefs.setBool('logged_in', true);
  }

  Future<Null> tourComplete(String? tourSeen) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('tourDone', tourSeen.toString());
  }

  Future<String> getLoginUserID(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String localValue = "";

    localValue = prefs.getString(id).toString();

    return localValue;
  }

  Future<Null> StoreCart(String cartData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('cartData', cartData);
  }

  Future<Null> storeDefaultPayment(String PaymentType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('PaymentType', PaymentType);
  }

  Future<Null> storeDefaultCard(
      String last4, String id, String customer) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('last4', last4);
    prefs.setString('cardId', id);
    prefs.setString('customer', customer);
  }

  Future<Null> StoreFCMToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String> getFCMToken(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String localValue = "";

    localValue = prefs.getString(key).toString();

    return localValue;
  }
}
