import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:algolia/algolia.dart';

void main() {
  runApp(MyApp());
}

class SearchHit {
  final String name;
  final String image;

  SearchHit(this.name, this.image);

  static SearchHit fromJson(Map<String, dynamic> json) {
    return SearchHit(json['name'], json['image_urls'][0]);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Algolia & Flutter',
      home: MyHomePage(title: 'Algolia & Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Algolia _algoliaClient = Algolia.init(
      applicationId: "latency", apiKey: "927c3fe76d4b52c5a2912973f35a3077");

  String _searchText = "";
  List<SearchHit> _hitsList = [];
  TextEditingController _textFieldController = TextEditingController();

  Future<void> _getSearchResult(String query) async {
    AlgoliaQuery algoliaQuery = _algoliaClient.instance
        .index("STAGING_native_ecom_demo_products")
        .query(query);
    AlgoliaQuerySnapshot snapshot = await algoliaQuery.getObjects();
    final rawHits = snapshot.toMap()['hits'] as List;
    final hits =
        List<SearchHit>.from(rawHits.map((hit) => SearchHit.fromJson(hit)));
    setState(() {
      _hitsList = hits;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Algolia & Flutter'),
        ),
        body: Column(children: <Widget>[
          Container(
              height: 44,
              child: TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a search term',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: _searchText.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _textFieldController.clear();
                              });
                            },
                            icon: Icon(Icons.clear),
                          )
                        : null),
              )),
          Expanded(
              child: _hitsList.isEmpty
                  ? Center(child: Text('No results'))
                  : ListView.builder(
                      itemCount: _hitsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            color: Colors.white,
                            height: 80,
                            padding: EdgeInsets.all(8),
                            child: Row(children: <Widget>[
                              Container(
                                  width: 50,
                                  child: Image.network(
                                      '${_hitsList[index].image}')),
                              SizedBox(width: 20),
                              Expanded(child: Text('${_hitsList[index].name}'))
                            ]));
                      }))
        ]));
  }

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      if (_searchText != _textFieldController.text) {
        setState(() {
          _searchText = _textFieldController.text;
        });
        _getSearchResult(_searchText);
      }
    });
    _getSearchResult('');
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}
