import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Bookmarkcalendar/Bookmarkpage/Index.dart';
import 'package:http/http.dart' as http;
import 'news.dart';

class BeritaPage extends StatefulWidget {
  @override
  _BeritaPageState createState() => _BeritaPageState();
}

class _BeritaPageState extends State<BeritaPage> {
  bool _isLoading = false;
  List<News> _newsList = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=90061ed66efc49149b27f7687e0ad6f7');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final articles = data['articles'] as List<dynamic>;
      final List<News> loadedNews = [];

      for (var article in articles) {
        loadedNews.add(News.fromJson(article));
      }

      setState(() {
        _newsList = loadedNews;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to fetch news'),
        duration: Duration(seconds: 3),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita'),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Bookmark(),
                ),
              );
            },
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _newsList.length,
              itemBuilder: (ctx, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _newsList[index].imageUrl.isNotEmpty
                          ? Image.network(_newsList[index].imageUrl)
                          : SizedBox.shrink(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _newsList[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(_newsList[index].description),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
