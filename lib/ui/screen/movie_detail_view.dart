import 'package:flutter/material.dart';

import '../../model/movie.dart';

class MovieDetailView extends StatelessWidget {
  final Movie? movie;
  final String mainUrl = 'https://image.tmdb.org/t/p/w500';
  const MovieDetailView({this.movie, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Detail'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 280,
              height: 400,
              child: Image.network(
                "$mainUrl${movie!.posterPath}",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                child: Row(children: [
                  const Icon(Icons.star),
                  Text('${movie!.voteAverage}')
                ]),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                child: Row(children: [
                  const Icon(Icons.person),
                  Text('${movie!.voteCount}')
                ]),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                child: Row(
                  children: [
                    const Icon(Icons.timelapse_rounded),
                    Text('${movie!.releaseDate}')
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90,
              child: Text(
                '${movie!.overview}',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: const TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
