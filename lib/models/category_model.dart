import 'dart:convert';
import 'dart:ffi';

class CategoryModel{
  String name;

  CategoryModel({
    required this.name
});


  CategoryModel.fromJson(Map<String,Object?> json)
  :this(
    name: json['name']! as String,
  );

  Map<String, Object?> toJson() {
    return {
      'name': name,
    };
  }

  CategoryModel.fromSnapshot(snapshot)
      : name = snapshot.data()['name'];
  
}