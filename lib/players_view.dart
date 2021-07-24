import 'package:demo1/players.dart';

class PlayersViewModel {
  static List<Players> players;

  static Future loadPlayers() async {
    try {
      players = new List<Players>();
      players.add(Players(
          id: 1,
          autocompleteterm: 'Vikas Purohit',
          country: 'India',
          keyword: 'Vikas'));
      players.add(Players(
          id: 1,
          autocompleteterm: 'Dharmesh Mansata',
          country: 'India',
          keyword: 'Dharmesh'));
      players.add(Players(
          id: 1,
          autocompleteterm: 'Mushtaq Sayyed',
          country: 'India',
          keyword: 'Mushtaq'));
      players.add(Players(
          id: 1,
          autocompleteterm: 'Shukrani Bille',
          country: 'India',
          keyword: 'Shukrani'));
      players.add(Players(
          id: 1,
          autocompleteterm: 'Suresh Prajapati',
          country: 'India',
          keyword: 'Suresh'));

    } catch (e) {
      print(e);
    }
  }
}
