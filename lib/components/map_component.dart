import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final List<Marker> _markers = [
    Marker(
      width: 70,
      height: 60,
      point: LatLng(34.0522, -118.2437),
      builder: (ctx) => GestureDetector(
          onTap: () {
            _showMarkerDialog(ctx, "Los Angeles", "This is Los Angeles.");
          },
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFFFC9E12),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
              child: Text("12.95ms"),
            ),
          )),
    ),
    Marker(
      width: 70,
      height: 60,
      point: LatLng(36.1699, -115.1398), // Las Vegas
      builder: (ctx) => GestureDetector(
        onTap: () {
          _showMarkerDialog(ctx, "Las Vegas", "This is Las Vegas.");
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFC9E12),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text("13.45ms"),
          ),
        ),
      ),
    ),
    // Santa Fe marker
    Marker(
      width: 70,
      height: 60,
      point: LatLng(35.6870, -105.9378), // Santa Fe
      builder: (ctx) => GestureDetector(
        onTap: () {
          _showMarkerDialog(ctx, "Santa Fe", "This is Santa Fe.");
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFC9E12),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text("14.30ms"),
          ),
        ),
      ),
    ),
    Marker(
      width: 70,
      height: 60,
      point: LatLng(40.7608, -111.8910), // Salt Lake City
      builder: (ctx) => GestureDetector(
        onTap: () {
          _showMarkerDialog(ctx, "Salt Lake City", "This is Salt Lake City.");
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFC9E12),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text("15.10ms"),
          ),
        ),
      ),
    ),
    Marker(
      width: 70,
      height: 60,
      point: LatLng(43.6150, -116.2023), // Boise
      builder: (ctx) => GestureDetector(
        onTap: () {
          _showMarkerDialog(ctx, "Boise", "This is Boise.");
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFFC9E12),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Text("12.75ms"),
          ),
        ),
      ),
    ),
    Marker(
      width: 70,
      height: 60,
      point: LatLng(37.7745, -122.4190),
      builder: (ctx) => GestureDetector(
          onTap: () {
            _showMarkerDialog(ctx, "Nearby Location 4", "Close-by point.");
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFFC9E12),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Center(
              child: Text("6.95ms"),
            ),
          )),
    ),
  ];

  static void _showMarkerDialog(
      BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(36.7783, -119.4179),
        zoom: 6.0,
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://cartodb-basemaps-{s}.global.ssl.fastly.net/dark_all/{z}/{x}/{y}{r}.png",
          subdomains: ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: _markers,
        ),
      ],
    );
  }
}
