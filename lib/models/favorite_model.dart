class FavoriteModel{
  String idFavorite;
  String id;

  FavoriteModel({required this.idFavorite,required this.id});

  FavoriteModel.fromSnapshot(snapshot)
      : idFavorite = snapshot.id,
        id = snapshot.data()['id'];
}