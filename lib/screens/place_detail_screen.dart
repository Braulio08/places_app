import 'package:flutter/material.dart';
import '../models/place.dart';
import './map_screen.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen({super.key});
  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final Place selectedPlace =
        ModalRoute.of(context)!.settings.arguments as Place;
    final dynamic appBar = AppBar(
      title: Text(selectedPlace.title),
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                selectedPlace.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            selectedPlace.location!.address.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MapScreen(
                initialLocation: selectedPlace.location!,
                isSelecting: false,
              ),
            )),
            child: const Text('View on map'),
          )
        ],
      ),
    );
  }
}
