import 'package:demo1/players_view.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import './players.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AutoComplete(),
      ),
    );
  }
}

class AutoComplete extends StatefulWidget {
  @override
  _AutoCompleteState createState() => new _AutoCompleteState();
}

class _AutoCompleteState extends State<AutoComplete> {
  AutoCompleteTextField searchTextField;
  TextEditingController controller = new TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<Players>> key = new GlobalKey();

  _AutoCompleteState();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() async {
    await PlayersViewModel.loadPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Auto Complete List Demo'),
        ),
        body: new Center(
            child: new Column(children: <Widget>[
          new Column(children: <Widget>[
            //AutoCompleteTextField code here
            searchTextField = AutoCompleteTextField<Players>(
              suggestions: PlayersViewModel.players,
              key: key,
              itemFilter: (item, query) {
                return item.autocompleteterm
                    .toLowerCase()
                    .startsWith(query.toLowerCase());
              },
              itemSorter: (a, b) {
                return a.autocompleteterm.compareTo(b.autocompleteterm);
              },
              itemSubmitted: (item) {
                setState(() => searchTextField.textField.controller.text =
                    item.autocompleteterm);
              },
              itemBuilder: (context, item) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      item.autocompleteterm,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                    ),
                    Text(
                      item.country,
                    )
                  ],
                );
              },
              style: new TextStyle(color: Colors.black, fontSize: 16.0),
              decoration: new InputDecoration(
                  suffixIcon: Container(
                    width: 85.0,
                    height: 60.0,
                  ),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                  filled: true,
                  hintText: 'Search Player Name',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
          ]),
        ])));
  }
}
