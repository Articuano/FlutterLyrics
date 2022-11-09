import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:untitled2/LyricsPage.dart';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    required this.track,
  });

  Track track;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    track: Track.fromJson(json["track"]),
  );

  Map<String, dynamic> toJson() => {
    "track": track.toJson(),
  };
}

class Track {
  Track({
    required this.trackId,
    required this.trackName,
    required this.trackNameTranslationList,
    required this.trackRating,
    required this.commontrackId,
    required this.instrumental,
    required this.explicit,
    required this.hasLyrics,
    required this.hasSubtitles,
    required this.hasRichsync,
    required this.numFavourite,
    required this.albumId,
    required this.albumName,
    required this.artistId,
    required this.artistName,
    required this.trackShareUrl,
    required this.trackEditUrl,
    required this.restricted,
    required this.updatedTime,
    required this.primaryGenres,
  });

  int trackId;
  String trackName;
  List<TrackNameTranslationList> trackNameTranslationList;
  int trackRating;
  int commontrackId;
  int instrumental;
  int explicit;
  int hasLyrics;
  int hasSubtitles;
  int hasRichsync;
  int numFavourite;
  int albumId;
  String albumName;
  int artistId;
  String artistName;
  String trackShareUrl;
  String trackEditUrl;
  int restricted;
  DateTime updatedTime;
  PrimaryGenres primaryGenres;

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    trackId: json["track_id"],
    trackName: json["track_name"],
    trackNameTranslationList: List<TrackNameTranslationList>.from(json["track_name_translation_list"].map((x) => TrackNameTranslationList.fromJson(x))),
    trackRating: json["track_rating"],
    commontrackId: json["commontrack_id"],
    instrumental: json["instrumental"],
    explicit: json["explicit"],
    hasLyrics: json["has_lyrics"],
    hasSubtitles: json["has_subtitles"],
    hasRichsync: json["has_richsync"],
    numFavourite: json["num_favourite"],
    albumId: json["album_id"],
    albumName: json["album_name"],
    artistId: json["artist_id"],
    artistName: json["artist_name"],
    trackShareUrl: json["track_share_url"],
    trackEditUrl: json["track_edit_url"],
    restricted: json["restricted"],
    updatedTime: DateTime.parse(json["updated_time"]),
    primaryGenres: PrimaryGenres.fromJson(json["primary_genres"]),
  );

  Map<String, dynamic> toJson() => {
    "track_id": trackId,
    "track_name": trackName,
    "track_name_translation_list": List<dynamic>.from(trackNameTranslationList.map((x) => x.toJson())),
    "track_rating": trackRating,
    "commontrack_id": commontrackId,
    "instrumental": instrumental,
    "explicit": explicit,
    "has_lyrics": hasLyrics,
    "has_subtitles": hasSubtitles,
    "has_richsync": hasRichsync,
    "num_favourite": numFavourite,
    "album_id": albumId,
    "album_name": albumName,
    "artist_id": artistId,
    "artist_name": artistName,
    "track_share_url": trackShareUrl,
    "track_edit_url": trackEditUrl,
    "restricted": restricted,
    "updated_time": updatedTime.toIso8601String(),
    "primary_genres": primaryGenres.toJson(),
  };
}

class PrimaryGenres {
  PrimaryGenres({
    required this.musicGenreList,
  });

  List<MusicGenreList> musicGenreList;

  factory PrimaryGenres.fromJson(Map<String, dynamic> json) => PrimaryGenres(
    musicGenreList: List<MusicGenreList>.from(json["music_genre_list"].map((x) => MusicGenreList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "music_genre_list": List<dynamic>.from(musicGenreList.map((x) => x.toJson())),
  };
}

class MusicGenreList {
  MusicGenreList({
    required this.musicGenre,
  });

  MusicGenre musicGenre;

  factory MusicGenreList.fromJson(Map<String, dynamic> json) => MusicGenreList(
    musicGenre: MusicGenre.fromJson(json["music_genre"]),
  );

  Map<String, dynamic> toJson() => {
    "music_genre": musicGenre.toJson(),
  };
}

class MusicGenre {
  MusicGenre({
    required this.musicGenreId,
    required this.musicGenreParentId,
    required this.musicGenreName,
    required this.musicGenreNameExtended,
    required this.musicGenreVanity,
  });

  int musicGenreId;
  int musicGenreParentId;
  String musicGenreName;
  String musicGenreNameExtended;
  String musicGenreVanity;

  factory MusicGenre.fromJson(Map<String, dynamic> json) => MusicGenre(
    musicGenreId: json["music_genre_id"],
    musicGenreParentId: json["music_genre_parent_id"],
    musicGenreName: json["music_genre_name"],
    musicGenreNameExtended: json["music_genre_name_extended"],
    musicGenreVanity: json["music_genre_vanity"],
  );

  Map<String, dynamic> toJson() => {
    "music_genre_id": musicGenreId,
    "music_genre_parent_id": musicGenreParentId,
    "music_genre_name": musicGenreName,
    "music_genre_name_extended": musicGenreNameExtended,
    "music_genre_vanity": musicGenreVanity,
  };
}

class TrackNameTranslationList {
  TrackNameTranslationList({
    required this.trackNameTranslation,
  });

  TrackNameTranslation trackNameTranslation;

  factory TrackNameTranslationList.fromJson(Map<String, dynamic> json) => TrackNameTranslationList(
    trackNameTranslation: TrackNameTranslation.fromJson(json["track_name_translation"]),
  );

  Map<String, dynamic> toJson() => {
    "track_name_translation": trackNameTranslation.toJson(),
  };
}

class TrackNameTranslation {
  TrackNameTranslation({
    required this.language,
    required this.translation,
  });

  String language;
  String translation;

  factory TrackNameTranslation.fromJson(Map<String, dynamic> json) => TrackNameTranslation(
    language: json["language"],
    translation: json["translation"],
  );

  Map<String, dynamic> toJson() => {
    "language": language,
    "translation": translation,
  };
}


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  List _items = [];
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;
  Timer? timer;
  @override
  void initState(){
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) => getConnectivity());
    getConnectivity();
    readJson();
  }

  getConnectivity() =>
  subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async{
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if(!isDeviceConnected && isAlertSet == false){
        showDialogBox();
        setState(() => isAlertSet = true);

      }
    },
  );

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/generated.json');
    final data = await json.decode(response);
    setState(() {
      for(var data2 in data) {
        _items.add(data2);
      }
      _items.forEach((element) => print("Name: ${element["track"]["track_name"]}"));
    });
  }

  @override
  void dispose(){
    timer?.cancel();
    subscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
      _items.length == 0? Center(
        child: CircularProgressIndicator(),
      ):showMyUI(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  showDialogBox() => showCupertinoDialog(context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text("No Connection"),
        content: const Text("Please ensure you are connected to the internet."),
        actions: <Widget>[
          TextButton(onPressed: () async{
            isDeviceConnected = await InternetConnectionChecker().hasConnection;
            if(isDeviceConnected){
              Navigator.pop(context,"Cancel");
            }
            setState(() => isAlertSet = false);
            if(!isDeviceConnected){
              setState(() => isAlertSet = true);
            }
          }, child: const Text("OK"))
        ],
      ),
  );

  Widget showMyUI() {
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4.5),
            child: Card(
              elevation: 10.0,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WelcomePage(TrackID: _items[index]["track"]["track_id"].toString())));
                },
                child: Container(
                  padding: EdgeInsets.all(35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.0)),
                      Text('Track Name : ${_items[index]["track"]["track_name"]}', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 18),),
                       const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                       Container(
                         width: double.infinity,
                         padding: EdgeInsets.all(15),
                         decoration: BoxDecoration(
                           color: Colors.black87,
                           borderRadius: BorderRadius.circular(10)
                         ),
                           child: Column(
                         children: [
                           Text("Album: ${_items[index]["track"]["album_name"]}", style: TextStyle(color: Colors.white)),
                           const Padding(padding: EdgeInsets.symmetric(vertical: 4.5)),
                           Text("By: ${_items[index]["track"]["artist_name"]}",  style: TextStyle(color: Colors.white)),
                         ],
                       )),

                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
