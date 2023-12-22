import 'package:flutter/material.dart';
import 'Movies.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movies>? moviesList = [];

  @override
  void initState() {
    super.initState();
    Movies divergent = Movies("Divergent", "2014", "4.5", "Action, Sci-Fi", "assets/images/Divergent.jpg");
    Movies aquaman = Movies("Aquaman", "2018", "4.0", "Action, Adventure", "assets/images/Aquaman.jpeg");
    Movies vicenzo = Movies("Vicenzo", "2021", "5.0", "Crime, Drama", "assets/images/Vicenzo.jpg");
    Movies yuruCamp = Movies("Laid-Back Camp Movie", "2022", "4.5", "Animation, Comedy", "assets/images/Yuru_Camp.jpg");
    Movies inception = Movies("Inception", "2010", "4.0", "Action, Adventure", "assets/images/inception.jpg");
    Movies joker = Movies("Joker", "2019", "3.0", "Crime, Drama", "assets/images/Joker.jpg");
    Movies starWars = Movies("Star Wars: Episode IV", "1977", "4.5", "Action, Adventure", "assets/images/Star_Wars.jpg");
    Movies toyStory = Movies("Toy Story", "1995", "5.0", "Animation, Adventure", "assets/images/Toy_Story.jpeg");
    Movies theShawshankRedemption = Movies("The Shawshank Redemption", "1994", "4.8", "Drama", "assets/images/The_Shawshank_Redemption.jpeg");

    moviesList?.addAll([divergent, aquaman, vicenzo, yuruCamp, inception, joker, starWars, toyStory, theShawshankRedemption]);
  }

  List<Movies>? getHighRatedMovies() {
    return moviesList?.where((movie) => double.parse(movie.rating) >= 4.5).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<Movies>? highRatedMovies = getHighRatedMovies();

    return Scaffold(
      appBar: AppBar(title: Text("List Movie")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Rating Terbaik',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: highRatedMovies != null ? highRatedMovies.length : 0,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Container(
                          width: 150,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(highRatedMovies![index].posterPath),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          highRatedMovies![index].nameMovie,
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: moviesList?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(moviesList![index].posterPath),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            moviesList![index].nameMovie,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Tahun Rilis: ${moviesList![index].tahunRilis}'),
                          Text('Genre: ${moviesList![index].genre}'),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Text(' ${moviesList![index].rating}'),
                              SizedBox(width: 8),
                              RatingBar.builder(
                                initialRating: double.parse(moviesList![index].rating),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20,
                                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  // Tangani perubahan peringkat jika diperlukan
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.info),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
