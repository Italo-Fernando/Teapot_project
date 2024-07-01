import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:pullebyte/keys/api_keys.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_gl/mapbox_gl.dart' as mapbox;

class Mapa extends StatefulWidget {
  final String stadiumName;
  const Map({super.key, required this.stadiumName});

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
    final String url = 'https://api.distancematrix.ai/maps/api/geocode/json?key=${String.fromEnvironment("GEO_ACCESS_TOKEN")}&address=$stadiumName';
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
          : MapboxMap(
              accessToken: const String.fromEnvironment("ACCESS_TOKEN"),
              styleString: 'mapbox://styles/mapbox/streets-v12',
              initialCameraPosition: CameraPosition(target: mapbox.LatLng(stadiumLatitude!, stadiumLongitude!), zoom: 16.58, tilt: 60),
            ),
    );
  }
}

 
