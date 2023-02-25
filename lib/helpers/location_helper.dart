import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    String? apiKey = dotenv.env['MAPS_API_KEY'];
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7C$latitude,$longitude&key=$apiKey';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    String? apiKey = dotenv.env['MAPS_API_KEY'];
    var url = Uri.https(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      {
        'latlng': '$lat,$lng',
        'key': apiKey,
      },
    );
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
