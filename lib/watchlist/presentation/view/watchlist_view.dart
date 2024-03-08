import 'package:flutter/material.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/presentation/components/vertical_listview_card.dart';
import 'package:movie_app/core/resources/app_strings.dart';
import 'package:movie_app/core/resources/app_values.dart';

class WatchListView extends StatelessWidget {
  const WatchListView({super.key});

  @override
  Widget build(BuildContext context) {
    const media = Media(tmdbID: 1072790, title: 'Land of Bad', posterUrl: '/h27WHO2czaY5twDmV3Wfx5IdqoE.jpg', backdropUrl: '/oBIQDKcqNxKckjugtmzpIIOgoc4.jpg', voteAverage: 3, releaseDate: '2024-01-25', overview: 'lorem', isMovie: true);
    final list = [media, media];
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.watchlist)),
      backgroundColor: Colors.blue,
      body: Scaffold(
        body: WatchlistWidget(items: list,),
      ),
    );
  }
}

class WatchlistWidget extends StatelessWidget {
  const WatchlistWidget({super.key, required this.items});
  final List<Media> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: items.length,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16, vertical: AppPadding.p8),
      itemBuilder: (context, index) {
        return VerticalListviewCard(media: items[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSize.s10,
      ),
    );
  }
}
