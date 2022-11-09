import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:meta/meta.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.message,
  });

  Message message;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    message: Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
  };
}

class Message {
  Message({
    required this.header,
    required this.body,
  });

  Header header;
  Body body;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    header: Header.fromJson(json["header"]),
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "header": header.toJson(),
    "body": body.toJson(),
  };
}

class Body {
  Body({
    required this.track,
  });

  Track track;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
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
  List<dynamic> trackNameTranslationList;
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
    trackNameTranslationList: List<dynamic>.from(json["track_name_translation_list"].map((x) => x)),
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
    "track_name_translation_list": List<dynamic>.from(trackNameTranslationList.map((x) => x)),
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

class Header {
  Header({
    required this.statusCode,
    required this.executeTime,
  });

  int statusCode;
  double executeTime;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
    statusCode: json["status_code"],
    executeTime: json["execute_time"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "execute_time": executeTime,
  };
}



class WelcomePage extends StatefulWidget {
  String TrackID;

  WelcomePage({required this.TrackID});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String respBody = "none";
  List Real = [];
  String TrackName = "";
  String TrackLyrics = "";
  String ArtistName = "";
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  initState(){
    getConnectivity();
    print("ok");
    LoadData();
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

  LoadData() async{
    final response = await http.get(Uri.parse("https://api.musixmatch.com/ws/1.1/track.get?track_id=${widget.TrackID}&apikey=ef3436e420a8c0e3858b81616c7504b7"));
    final data = await json.decode(response.body)["message"]["body"]["track"];
    final response2 = await http.get(Uri.parse("https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=${widget.TrackID}&apikey=ef3436e420a8c0e3858b81616c7504b7"));
    String data2 = await json.decode(response2.body)["message"]["body"]["lyrics"]["lyrics_body"];
    Real.add(data);
    Real.add(data2);
    print("${Real[0]}");
    setState(() {
      TrackName = Real[0]["track_name"];
      ArtistName = Real[0]["artist_name"];
      TrackLyrics = Real[1];
    });
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

  @override
  void dispose(){
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Track Details"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            Text("Name: ${TrackName}", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, decoration: TextDecoration.underline), textAlign: TextAlign.center,),
            Text("By: ${ArtistName}"),
            const Padding(padding: EdgeInsets.symmetric(vertical: 7.5)),
            Container(
              padding: EdgeInsets.only(top: 7.5),
              decoration: BoxDecoration(color: Colors.indigoAccent, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text("Lyrics", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                  Container(
                    width: 350,
                    height: 400,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.black87,
                    borderRadius: BorderRadius.circular(10)),
                      child: SingleChildScrollView(child: Text("${TrackLyrics}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),))
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
