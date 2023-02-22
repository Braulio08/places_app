import 'package:flutter/foundation.dart';
import '../models/place.dart';
import 'dart:io';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        image: image);
    _items.add(newPlace);
    notifyListeners();
  }
}
