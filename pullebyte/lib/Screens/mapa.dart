import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pullebyte/keys/api_keys.dart';

class Mapa extends StatefulWidget {
  final String stadiumName;
  const Mapa({super.key, required this.stadiumName});

  @override
  _MapaState createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  bool isLoading = true;
  double? stadiumLatitude;
  double? stadiumLongitude;

  @override
  void initState() {
    super.initState();
    _fetchGeoMapData(widget.stadiumName);
  }

  Future<void> _fetchGeoMapData(String stadiumName) async {
    final String url = 'https://api.distancematrix.ai/maps/api/geocode/json?key=$geocodeApiKey&address=$stadiumName';
    final response = await http.get(Uri.parse(url));
    final data = json.decode(utf8.decode(response.bodyBytes));
    setState(() {
      stadiumLatitude = data['result'][0]['geometry']['location']['lat'].toDouble();
      stadiumLongitude = data['result'][0]['geometry']['location']['lng'].toDouble();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stadiumName),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(stadiumLatitude!, stadiumLongitude!),
                initialZoom: 16.58,
                initialRotation: 60.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://api.mapbox.com/styles/v1/luizefz/cly15xlez009301qr14tgf2t6/tiles/256/{z}/{x}/{y}{r}?access_token=$mapboxApiKey',
                  userAgentPackageName: 'com.pullebyte.app',
                ),
              ],
            ),
    );
  }
}