import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/add_place_screen.dart';
import '../providers/places_provider.dart';
import '../screens/place_detail_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dynamic appBar = AppBar(
      title: const Text('Your places'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
          icon: const Icon(Icons.add),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: FutureBuilder(
        future: Provider.of<PlacesProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<PlacesProvider>(
                child: const Center(
                    child: Text('Got no places yet, start adding some')),
                builder: (context, placesProvider, child) => placesProvider
                        .items.isEmpty
                    ? child!
                    : ListView.builder(
                        itemCount: placesProvider.items.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                FileImage(placesProvider.items[index].image),
                          ),
                          title: Text(placesProvider.items[index].title),
                          subtitle: Text(
                            placesProvider.items[index].location!.address
                                .toString(),
                          ),
                          onTap: () => Navigator.of(context).pushNamed(
                              PlaceDetailsScreen.routeName,
                              arguments: placesProvider.items[index]),
                        ),
                      ),
              ),
      ),
    );
  }
}
