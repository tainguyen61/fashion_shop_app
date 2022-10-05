import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_shop_app/models/panel_model.dart';
import 'package:flutter/material.dart';

class PanelState extends ChangeNotifier{
  List<PanelModel> panelList = [];

  void getCategoryList() async {
    var data = await FirebaseFirestore.instance.collection('panel').get();
    panelList = List.from(data.docs.map((doc) =>PanelModel.fromSnapshot(doc)));
    notifyListeners();
  }

  PanelState({required this.panelList});
}

final panelState = PanelState(panelList: <PanelModel>[]);