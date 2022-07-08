import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:movie_array/model/movie.dart';
import 'package:movie_array/ui/screen/movie_list/movie_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  late ScrollController _scrollController;
  late MovieListViewModel _viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _viewModel.removeListner();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MovieListViewModel>.reactive(
      onModelReady: (model) {
        _viewModel = model;
        model.firstLoad();
        model.setScrollController(_scrollController);
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('MovieArray'),
        ),

        body: model.isBusy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: model.movieList.length,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: _movieTile(
                            model: model, movie: model.movieList[index]),
                      ),
                    ),
                  ),

                  // when the _loadMore function is running
                  if (model.isLoadMoreRunning == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),

                  // When nothing else to load
                  if (model.hasNextPage == false)
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 40),
                      color: Colors.amber,
                      child: const Center(
                        child: Text('You have fetched all of the content'),
                      ),
                    ),
                ],
              ),
      ),
      viewModelBuilder: () => MovieListViewModel(),
    );
  }

  Widget _movieTile({MovieListViewModel? model, Movie? movie}) {
    return InkWell(
      onTap: () => model!.showDetail(movie!),
      child: Row(
        children: [
          SizedBox(
            width: 180,
            height: 250,
            child: Image.network(
              "${model!.mainUrl}${movie!.posterPath}",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 190,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white.withOpacity(0.5), Colors.grey],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.topLeft,
                    height: 80,
                    child: Text(
                      '${movie.title}',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Divider(thickness: 2),
                  SizedBox(
                    height: 90,
                    child: Text(
                      '${movie.overview}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: Row(
                      children: [
                        const Icon(Icons.timelapse_rounded),
                        Text('${movie.releaseDate}')
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        child: Row(children: [
                          const Icon(Icons.star),
                          Text('${movie.voteAverage}')
                        ]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        child: Row(children: [
                          const Icon(Icons.person),
                          Text('${movie.voteCount}')
                        ]),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
