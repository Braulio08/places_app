import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationHelper {
  static String generateLocationPreviewImage({required double latitude, required double longitude}) {
    String? apiKey = dotenv.env['MAPS_API_KEY'];
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7C$latitude,$longitude&key=$apiKey';
  }
}
