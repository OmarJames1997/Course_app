import 'package:course_app/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{
  late final SharedPreferences _preferences;

  // This to be called in global dart file
  Future<StorageService> getStorageService()async{
    // Initialize the variable with instance to share globally
    _preferences=await SharedPreferences.getInstance();
    return this;
  }

  Future<bool>setBool(String key,bool value)async {

    return await _preferences.setBool(key, value);
  }

  //This function to add to the Bool for logging in memory
  Future<bool>setString(String key,String value)async {

    return await _preferences.setString(key, value);
  }

  // To save the Bool if User first Opened the Application or not
  bool getDeviceFirstOpen(){
    return _preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME)?? false;
  }

  // To save the Bool if User  Logged in to the Application or not
  bool getIsLoggedIn(){

    return _preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }

  Future<bool> remove(String key){
    return _preferences.remove(key);
  }
}