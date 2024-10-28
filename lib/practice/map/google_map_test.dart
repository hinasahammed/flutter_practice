import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWithDummyData extends StatefulWidget {
  const GoogleMapWithDummyData({super.key});

  @override
  _GoogleMapWithDummyDataState createState() => _GoogleMapWithDummyDataState();
}

class _GoogleMapWithDummyDataState extends State<GoogleMapWithDummyData> {
  GoogleMapController? mapController;

  // Set the initial position of the map
  final LatLng _initialPosition =
      const LatLng(37.7749, -122.4194); // San Francisco

  // Define some dummy markers
  final Set<Marker> _markers = {
    const Marker(
      markerId: MarkerId('dummy1'),
      position: LatLng(37.7749, -122.4194),
      infoWindow: InfoWindow(title: 'Dummy Location 1'),
    ),
    const Marker(
      markerId: MarkerId('dummy2'),
      position: LatLng(37.7849, -122.4094),
      infoWindow: InfoWindow(title: 'Dummy Location 2'),
    ),
    const Marker(
      markerId: MarkerId('dummy3'),
      position: LatLng(37.7649, -122.4294),
      infoWindow: InfoWindow(title: 'Dummy Location 3'),
    ),
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map with Dummy Data'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12,
        ),
        markers: _markers,
      ),
    );
  }
}
