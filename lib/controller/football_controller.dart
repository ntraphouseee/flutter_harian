import 'package:get/get.dart';

class Player {
  final String name;
  final String team;
  final String position;
  final String image;

  Player({
    required this.name,
    required this.team,
    required this.position,
    required this.image,
  });

  Player copyWith({
    String? name,
    String? team,
    String? position,
    String? image,
  }) {
    return Player(
      name: name ?? this.name,
      team: team ?? this.team,
      position: position ?? this.position,
      image: image ?? this.image,
    );
  }
}

class FootballController extends GetxController {
  var players = <Player>[
    Player(
      name: 'Lamine Yamal',
      team: 'Barcelona',
      position: 'Forward',
      image: 'https://images2.minutemediacdn.com/image/upload/c_crop,w_3970,h_2233,x_300,y_60/c_fill,w_1440,ar_16:9,f_auto,q_auto,g_auto/images/voltaxMediaLibrary/mmsport/si/01jb59znv8hdqbj7bnkc.jpg',
    ),
    Player(
      name: 'Cristiano Ronaldo',
      team: 'Al Nassr',
      position: 'Forward',
      image: 'assets/images/placeholder.jpeg',
    ),
    Player(
      name: 'Neymar Jr',
      team: 'Al Hilal',
      position: 'Forward',
      image: 'assets/images/placeholder.jpeg',
    ),
  ].obs;
}
