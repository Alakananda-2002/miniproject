import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<News> newsList = [
    News(
      title: 'News 1',
      description: 'This is news 1 description.',
      imageUrl:
          'https://images.freeimages.com/images/large-previews/292/healing-field-flags-5-1420195.jpg',
    ),
    News(
      title: 'News 2',
      description: 'This is news 2 description.',
      imageUrl:
          'https://media.istockphoto.com/id/1141484375/photo/fresh-tea-bud-and-leaves.jpg?s=612x612&w=0&k=20&c=7YTXFfNF6y2yBed8SfeVdSKobvw1orughjHXJA0z-QE=',
    ),
    News(
      title: 'News 3',
      description: 'This is news 3 description.',
      imageUrl:
          'https://media.istockphoto.com/id/1141484374/photo/growing-tea-leaves.jpg?s=612x612&w=0&k=20&c=5Am_QuCEftHA3ZPeOHRFXX8WReXGrI_xqcV9RM4D83w=',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(newsList[index].imageUrl),
            title: Text(newsList[index].title),
            subtitle: Text(newsList[index].description),
          );
        },
      ),
    );
  }
}

class News {
  final String title;
  final String description;
  final String imageUrl;

  News({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
