import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/features/localizacao/domain/location_model.dart';
import 'package:latlong2/latlong.dart';

class Localizacao extends StatefulWidget {
  const Localizacao({super.key});

  @override
  State<Localizacao> createState() => _MapPageState();
}

class _MapPageState extends State<Localizacao> {
  late MapController mapController;
  LocationModel? currentLocation;

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    getCurrentLocation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Localização'),
          // actions: <Widget>[
          //   PopupMenuButton<int>(
          //     onSelected: (item) => actions.handleClick(item, context, ref),
          //     itemBuilder: (context) => [
          //       PopupMenuItem<int>(value: 0, child: Text(Strings.logout)),
          //       PopupMenuItem<int>(value: 1, child: Text(Strings.ajustes)),
          //     ],
          //   ),
          // ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Expanded(
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                  initialCenter: LatLng(
                    currentLocation?.latitude ?? 0.0,
                    currentLocation?.longitude ?? 0.0,
                  ),
                  initialZoom: 15.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                  MarkerLayer(
                    markers: [
                      if (currentLocation != null)
                        Marker(
                          point: LatLng(
                            currentLocation!.latitude,
                            currentLocation!.longitude,
                          ),
                          child: Icon(
                            Icons.location_pin,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(
                height: Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 + 30.0,
              ),
              padding: const EdgeInsets.all(6.0),
              color: Colors.blue[600],
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Latitude: ${currentLocation?.latitude ?? ''}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white)),
                    Text('Longitude: ${currentLocation?.longitude ?? ''}',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white)),
                  ]),
            ),
          ],
        ));
  }

  void getCurrentLocation(context) async {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Location Service Disabled'),
          content: Text('Please enable location services.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Location Permission Denied'),
            content: Text('Please grant location permission.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
    setState(() {
      currentLocation = LocationModel(
        latitude: position.latitude,
        longitude: position.longitude,
      );
      mapController.move(
        LatLng(currentLocation!.latitude, currentLocation!.longitude),
        15.0,
      );
    });
  }
}
