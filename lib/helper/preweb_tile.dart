import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../views/article_view.dart';

class PrewebTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  const PrewebTile({
    super.key,
    required this.imgUrl,
    required this.desc,
    required this.title,
    required this.content,
    required this.posturl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(6),
            bottomLeft: Radius.circular(6),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              title,
              maxLines: 4,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              desc,
              overflow: TextOverflow.visible,
              style: const TextStyle(
                fontSize: 14.0,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              // SingleChildScrollView contains a
              // single child which is scrollable
              child: SingleChildScrollView(
                // for Vertical scrolling
                scrollDirection: Axis.vertical,
                child: Text(
                  content,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.lightBlue),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleView(postUrl: posturl),
                  ),
                );
              },
              child: const Text(
                "Read more in source",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
