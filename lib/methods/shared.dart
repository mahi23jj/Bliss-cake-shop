// // import 'dart:convert';

// // import 'package:coffee/methods/class.dart';
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class car extends ChangeNotifier {
// //   List<coffee> cof=[];
  

// //   void save()async{
// //     final pref= await SharedPreferences.getInstance();
// //     final coff=cof.map((e) => jsonEncode(e.tojson()),).toList();
// //     await pref.setStringList('coffee', coff);
// //   }
// //   void add(coffee value){
// //     cof.add(value);
// //     save();
// //     notifyListeners();
// //   }

// //   void delete(int i){
// //     cof.remove(cof[i]);
// //     save();
// //    notifyListeners();
// //   }

// //   Future<List<coffee>> retrive()async{
// //      final pref= await SharedPreferences.getInstance();
// //      final bean=pref.getStringList('coffee');
// //      if (bean!=null) {
// //      return bean.map((e) => coffee.from(jsonDecode(e)),).toList();
// //      }else{
// //       return [];
// //      }
// //   }
  
// // }
// import 'package:coffee/methods/class.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class car extends ChangeNotifier {
//  late Box _cofBox;

//   car(){
//     _initHive();
//   }
//   List<coffee> cof=[];

//   void _initHive() async {
//     await Hive.initFlutter();
//     Hive.registerAdapter(CoffeeAdapter());
//    _cofBox = await Hive.openBox('coffeeBox');
//    //  _cofBox=Hive.box('coffeeBox');
//   }

//   void save() {
//    // final coff = cof.map((e) => e).toList();
//     _cofBox.put('coffee', cof);
//   }

//   void add(coffee value) {
  
//     cof.add(value);
//     save();
//     notifyListeners();
//   }

//   void delete(int i) {
//     cof.removeAt(i);
//     save();
//     notifyListeners();
//   }

// void ret(){
//   notifyListeners();
// }
  

// }
// class CoffeeAdapter extends TypeAdapter<coffee> {
//   @override
//   final typeId = 0;

//   @override
//   coffee read(BinaryReader reader) {
//     return coffee(
//       img: reader.read(),
//       name: reader.read(),
//       prc: reader.read(),
//     );
//   }

//   @override
//   void write(BinaryWriter writer, coffee obj) {
//     writer.write(obj.img);
//     writer.write(obj.name);
//     writer.write(obj.prc);
//   }
// }
