import 'package:course_app/common/service/storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Global{

  static late StorageService storageService;

  static Future init() async{
    // Mandatory to test the Firebase
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();
    storageService=await StorageService().getStorageService();
  }
}