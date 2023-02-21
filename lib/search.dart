import 'package:flutter/material.dart';
import 'package:quotes/list.dart';

class CustomSearchDelegate extends SearchDelegate {

  List<String> searchTerms = [
    "Inspirational",
    "Freedom",
    "Leadership",
    "Alone",
    "Sad",
    "Attitude",
    "Smile",
    "Birthday",
    "Romantic",
    "Success",
    "Failure",
    "Love",
    "Family",
    "Friends",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear,color: Color(0xff1B1C1E)),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back,color: Color(0xff1B1C1E)),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: InkWell(onTap: () {
              if(result=='Inspirational')
              {
                Navigator.pushNamed(context, 'data',arguments: inspirational);
              }
              if(result=='Freedom')
              {
                Navigator.pushNamed(context, 'data',arguments: freedom);
              }
              if(result=='Leadership')
              {
                Navigator.pushNamed(context, 'data',arguments: leadership);
              }
              if(result=='Alone')
              {
                Navigator.pushNamed(context, 'data',arguments: alone);
              }
              if(result=='Sad')
              {
                Navigator.pushNamed(context, 'data',arguments: sad);
              }
              if(result=='Attitude')
              {
                Navigator.pushNamed(context, 'data',arguments: attitude);
              }
              if(result=='Smile')
              {
                Navigator.pushNamed(context, 'data',arguments: smile);
              }
              if(result=='Birthday')
              {
                Navigator.pushNamed(context, 'data',arguments: birth);
              }
              if(result=='Romantic')
              {
                Navigator.pushNamed(context, 'data',arguments: roma);
              }
              if(result=='Success')
              {
                Navigator.pushNamed(context, 'data',arguments: success);
              }
              if(result=='Fail')
              {
                Navigator.pushNamed(context, 'data',arguments: fail);
              }
              if(result=='Love')
              {
                Navigator.pushNamed(context, 'data',arguments: love);
              }
              if(result=='Family')
              {
                Navigator.pushNamed(context, 'data',arguments: family);
              }
              if(result=='Friends')
              {
                Navigator.pushNamed(context, 'data',arguments: friends);
              }
            },child: Text(result,style: TextStyle(color: Colors.white),)),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: InkWell(onTap: () {
              if(result=='Inspirational')
              {
                Navigator.pushNamed(context, 'data',arguments: inspirational);
              }
              if(result=='Freedom')
              {
                Navigator.pushNamed(context, 'data',arguments: freedom);
              }
              if(result=='Leadership')
              {
                Navigator.pushNamed(context, 'data',arguments: leadership);
              }
              if(result=='Alone')
              {
                Navigator.pushNamed(context, 'data',arguments: alone);
              }
              if(result=='Sad')
              {
                Navigator.pushNamed(context, 'data',arguments: sad);
              }
              if(result=='Attitude')
              {
                Navigator.pushNamed(context, 'data',arguments: attitude);
              }
              if(result=='Smile')
              {
                Navigator.pushNamed(context, 'data',arguments: smile);
              }
              if(result=='Birthday')
              {
                Navigator.pushNamed(context, 'data',arguments: birth);
              }
              if(result=='Romantic')
              {
                Navigator.pushNamed(context, 'data',arguments: roma);
              }
              if(result=='Success')
              {
                Navigator.pushNamed(context, 'data',arguments: success);
              }
              if(result=='Fail')
              {
                Navigator.pushNamed(context, 'data',arguments: fail);
              }
              if(result=='Love')
              {
                Navigator.pushNamed(context, 'data',arguments: love);
              }
              if(result=='Family')
              {
                Navigator.pushNamed(context, 'data',arguments: family);
              }
              if(result=='Friends')
              {
                Navigator.pushNamed(context, 'data',arguments: friends);
              }
            },child: Text(result,style: TextStyle(color: Colors.white),)),
          );
        },
      ),
    );
  }
}