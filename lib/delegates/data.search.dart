import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSearch extends SearchDelegate<String> {

  @override
  ThemeData appBarTheme(BuildContext context){
    return Theme.of(context).copyWith(
      brightness: Brightness.dark,
      primaryColor: Colors.black87,
      hintColor: Colors.grey,

      inputDecorationTheme: InputDecorationTheme(
        border: InputBorder.none,

      ),

      textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear, color: Colors.grey,),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
        color: Colors.grey,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

  suggestions(String search) async {
    http.Response response = await http.get(
      Uri.parse("http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json")
    );
  }
}
