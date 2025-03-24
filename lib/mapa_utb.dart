import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapaUTB(),
    );
  }
}

class MapaUTB extends StatefulWidget {
  @override
  _MapaUTBState createState() => _MapaUTBState();
}

class _MapaUTBState extends State<MapaUTB> {
  late GoogleMapController mapController;

  final LatLng _coordenadasUTB = LatLng(10.370313895625339, -75.46561924377788);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mapa UTB')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _coordenadasUTB,
          zoom: 18.0,
        ),
        mapType: MapType.satellite,
        markers: {
          Marker(
            markerId: MarkerId('utb'),
            position: _coordenadasUTB,
            infoWindow: InfoWindow(title: 'Universidad UTB'),
          ),
        },
      ),
    );
  }
}
