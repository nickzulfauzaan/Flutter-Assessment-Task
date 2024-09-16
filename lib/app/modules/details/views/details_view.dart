import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/novel_model.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    // Get the arguments as a Map
    final Map<String, dynamic> novelData =
        Get.arguments as Map<String, dynamic>;

    // Create a Novel object from the Map
    final Novel novel = Novel.fromJson(novelData);

    return Scaffold(
      appBar: AppBar(
        title: Text(novel.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (novel.cover?.formats?.medium?.url != null)
              Center(
                child: Image.network(
                  'https://test-api.kacs.my${novel.cover!.formats!.medium!.url}',
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 16),
            Text(
              novel.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            Text(
              'Author: ${novel.author}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 8),
            if (novel.publication != null)
              Text(
                'Publication Date: ${novel.publication!.toLocal().toString().split(' ')[0]}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            SizedBox(height: 8),
            if (novel.genre != null)
              Text(
                'Genre: ${novel.genre}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            SizedBox(height: 8),
            if (novel.ratings != null)
              Text(
                'Ratings: ${novel.ratings}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            SizedBox(height: 16),
            Text(
              'Summary:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 8),
            Text(
              novel.summary ?? 'No summary available.',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
