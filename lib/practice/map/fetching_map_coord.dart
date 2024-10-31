import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FetchingMapCoord extends StatefulWidget {
  const FetchingMapCoord({super.key});

  @override
  State<FetchingMapCoord> createState() => _FetchingMapCoordState();
}

class _FetchingMapCoordState extends State<FetchingMapCoord> {
  List<Marker> _markers = [];
  final LatLng _centerPoint =
      const LatLng(11.259341456786967, 75.79057566638929);
  final double _distanceThreshold = 1000;

  @override
  void initState() {
    super.initState();
    _addInitialCenterMarker();
    _fetchMarkers();
  }

  void _addInitialCenterMarker() {
    setState(() {
      _markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: _centerPoint,
          child: const Icon(Icons.location_on, color: Colors.blue),
        ),
      );
    });
  }

  Future<void> _fetchMarkers() async {
    const distanceCalculator = Distance();
    FirebaseFirestore.instance
        .collection("hospital")
        .snapshots()
        .listen((snapshot) {
      List<Marker> markers = [];

      markers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: _centerPoint,
          child: const Icon(
            Icons.location_on,
            color: Colors.red,
            size: 45,
          ),
        ),
      );

      for (var document in snapshot.docs) {
        var data = document.data();

        double lat = double.parse(data['lat'].toString());
        double lng = double.parse(data['lng'].toString());

        final point = LatLng(lat, lng);
        final distance =
            distanceCalculator.as(LengthUnit.Meter, _centerPoint, point);

        if (distance <= _distanceThreshold) {
          markers.add(
            Marker(
              width: 100.0,
              height: 100.0,
              point: point,
              child: const Icon(
                size: 40,
                Icons.sports_football,
                color: Colors.green,
              ),
            ),
          );
        }
      }

      setState(() {
        _markers = markers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map with Nearby Markers"),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: _centerPoint,
          initialZoom: 15.2,
          maxZoom: 18.0,
          minZoom: 3.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.place',
          ),
          MarkerLayer(markers: _markers),
        ],
      ),
    );
  }
}
