import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/enums.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movies_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constants.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MovieState>(
        buildWhen: (previous, current) =>
            previous.popularMoviesState != current.popularMoviesState,
        builder: (context, state) {
          print("bloc builder popular component");
          switch (state.popularMoviesState) {
            case RequestStates.loading:
              return const SizedBox(
                height: 400.0,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case RequestStates.loaded:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.popularMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.popularMovies[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                          onTap: () {
                            /// TODO : NAVIGATE TO  MOVIE DETAILS
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            child: CachedNetworkImage(
                              width: 120.0,
                              fit: BoxFit.cover,
                              imageUrl:
                                  ApiConstants.imageUrl(movie.backdropPath),
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[850]!,
                                highlightColor: Colors.grey[800]!,
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            case RequestStates.error:
              return SizedBox(
                height: 400,
                child: Center(child: Text(state.popularMoviesMessage)),
              );
          }
        });
  }
}
