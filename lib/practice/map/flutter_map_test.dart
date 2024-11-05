import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterMapTest extends StatefulWidget {
  const FlutterMapTest({super.key});

  @override
  State<FlutterMapTest> createState() => _FlutterMapTestState();
}

class _FlutterMapTestState extends State<FlutterMapTest> {
  // Error-handling method for URL launching
  Future<void> _launchAttributionUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open attribution URL')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Map Example'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(
                11.283146296659249, 75.8159646775016), // London coordinates
            initialZoom: 15.2,
            maxZoom: 18.0,
            minZoom: 3.0,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSM tiles
              userAgentPackageName: 'com.example.app',
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(
                  'OpenStreetMap contributors',
                  onTap: () => _launchAttributionUrl(
                    'https://openstreetmap.org/copyright',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Future implementation for map reset/zoom control
        },
        label: const Text('Zoom Controls'),
        icon: const Icon(Icons.zoom_in),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
