class CategoryModel{
  String name;

  CategoryModel({
    required this.name
});
  CategoryModel.fromSnapshot(snapshot)
      : name = snapshot.data()['name'];
}