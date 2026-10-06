import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AssetsMediaPage extends StatefulWidget {
  const AssetsMediaPage({super.key});

  @override
  State<AssetsMediaPage> createState() => _AssetsMediaPageState();
}

class _AssetsMediaPageState extends State<AssetsMediaPage> {
  final AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  int _currentIndex = 0;

  void playAudio() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play(AssetSource('assets/audios/audio-toystory.mp3'));
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FC),

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        title: const Text(
          'Beranda Assets & Media',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF4D63D9),
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // =========================
      // DRAWER
      // =========================
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF4D63D9)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.account_circle, size: 55, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Menu Navigasi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // MENU VIDEO
            ListTile(
              leading: const Icon(
                Icons.video_library,
                color: Color(0xFF4D63D9),
              ),
              title: const Text(
                'Halaman Video',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: 'Data dari Halaman Beranda',
                );
              },
            ),

            // MENU BERANDA
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF4D63D9)),
              title: const Text(
                'Beranda',
                style: TextStyle(fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      // =========================
      // BOTTOM NAVIGATION BAR
      // =========================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF4D63D9),
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Jika memilih tab Video
          if (index == 1) {
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: 'Data dari Bottom Navigation',
            );
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Video',
          ),
        ],
      ),

      // =========================
      // BODY
      // =========================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // =========================
              // PROFILE
              // =========================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F5FB),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/foto-karinaa.jpeg',
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      'Karina Fitriamalia',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // =========================
              // AUDIO
              // =========================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F5FB),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Audio Motivasi',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE1E5FF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          // PLAY / PAUSE
                          CircleAvatar(
                            radius: 27,
                            backgroundColor: const Color(0xFF4D63D9),
                            child: IconButton(
                              onPressed: playAudio,
                              icon: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          // PROGRESS
                          const Expanded(
                            child: LinearProgressIndicator(
                              minHeight: 6,
                              backgroundColor: Color(0xFFC8CDEF),
                              valueColor: AlwaysStoppedAnimation(
                                Color(0xFF4D63D9),
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          // VOLUME
                          const Icon(Icons.volume_up, color: Color(0xFF202342)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
