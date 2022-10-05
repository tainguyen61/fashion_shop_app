class PanelModel{
  String img;

  PanelModel({required this.img});

  PanelModel.fromSnapshot(snapshot)
      : img = snapshot.data()['img'];
}