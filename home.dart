import 'package:flutter/material.dart';
import 'imageGallery.dart';
import 'imageCamera.dart';
import 'videoGallery.dart';
import 'videoCamera.dart';
import 'music.dart';
import 'youtubeVideo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    ImageGallery(),
    ImageCamera(),
    VideoGallery(),
    VideoCamera(),
    Musik(), 
    YoutubeVideo(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cam App+"),
        backgroundColor: const Color.fromRGBO(255, 212, 229, 2),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 212, 229, 2),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/K-ON3!.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    left: 16.0,
                    child: Text(
                      '-',
                      style: TextStyle(
                        // color: const Color.fromRGBO(254, 247, 221, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        // backgroundColor: const Color.fromRGBO(254, 247, 221, 1).withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: Text('Image Gallery'),
              onTap: () => _onItemTapped(0),
            ),
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () => _onItemTapped(1),
            ),
            ListTile(
              leading: Icon(Icons.video_camera_back),
              title: Text('Video Gallery'),
              onTap: () => _onItemTapped(2),
            ),
            ListTile(
              leading: Icon(Icons.video_camera_front),
              title: Text('Video Camera'),
              onTap: () => _onItemTapped(3),
            ),
            ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Music'),
              onTap: () => _onItemTapped(4),
            ),
            ListTile(
              leading: Icon(Icons.play_arrow),
              title: Text('Youtube Video'),
              onTap: () => _onItemTapped(5),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
