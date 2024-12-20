import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/signup_screen.dart';
import 'ui/screens/profile_screen.dart';
import 'ui/screens/chat_screen.dart';
import 'ui/screens/image_generation_screen.dart';
import 'ui/screens/video_generation_screen.dart';
import 'ui/screens/voice_generation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Core AI Studio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Core AI Studio Home Page'),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/profile': (context) => ProfileScreen(),
        '/chat': (context) => ChatScreen(),
        '/image-generation': (context) => ImageGenerationScreen(),
        '/video-generation': (context) => VideoGenerationScreen(),
        '/voice-generation': (context) => VoiceGenerationScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Text('Home Screen'),
    ChatScreen(),
    ProfileScreen(),
    ImageGenerationScreen(),
    VideoGenerationScreen(),
    VoiceGenerationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Image Gen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Video Gen',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.record_voice_over),
            label: 'Voice Gen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
