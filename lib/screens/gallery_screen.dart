import 'package:flutter/material.dart';
import 'package:gallery_app/model/pixabay_image.dart';
import 'package:gallery_app/network/request_maker.dart';
import 'package:gallery_app/screens/full_screen_view.dart';
import 'package:go_router/go_router.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  static const routeName = '/';

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final ValueNotifier<GalleryScreenState> screenStatenotifier =
      ValueNotifier(GalleryScreenLoading());
  final requestMaker = RequestMaker();

  @override
  void initState() {
    super.initState();
    getImages();
  }

  Future<void> getImages() async {
    final result = await requestMaker.getImagesFromApi();
    if (result == null) {
      screenStatenotifier.value = GalleryScreenError();
    } else {
      screenStatenotifier.value = GalleryScreenReady(images: result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Art Gallery'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder<GalleryScreenState>(
          valueListenable: screenStatenotifier,
          builder: (context, state, child) {
            if (state is GalleryScreenLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GalleryScreenError) {
              return const Center(
                child: Text('Something went wrong!'),
              );
            }
            final st = state as GalleryScreenReady;
            return GridView.builder(
              itemCount: st.images.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 1,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final image = st.images[index];
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(FullScreenView.routeName, extra: image);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        child: Hero(
                          tag: image.id,
                          child: Image.network(
                            image.largeImageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          // Text('Likes: ${image.likes}'),
                          buildInfoRow(
                            icon: Icons.visibility_outlined,
                            text: image.views.toString(),
                          ),
                          buildInfoRow(
                            icon: Icons.favorite,
                            text: image.likes.toString(),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  buildInfoRow({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: [
        Icon(icon,size: 12,),
        Text(text),
      ],
    );
  }
}

abstract class GalleryScreenState {}

class GalleryScreenLoading extends GalleryScreenState {}

class GalleryScreenReady extends GalleryScreenState {
  final List<PixabayImage> images;

  GalleryScreenReady({required this.images});
}

class GalleryScreenError extends GalleryScreenState {}
