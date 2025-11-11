import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_assign/core/widgets/network_image.dart';

class AppCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final double height;
  final Duration autoScrollDuration;
  final Duration animationDuration;

  const AppCarousel({
    super.key,
    required this.imageUrls,
    this.height = 500,
    this.autoScrollDuration = const Duration(seconds: 3),
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  State<AppCarousel> createState() => _AutoScrollCarouselViewState();
}

class _AutoScrollCarouselViewState extends State<AppCarousel> {
  final CarouselSliderController _controller = CarouselSliderController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final images = widget.imageUrls;

    if (images.isEmpty) return const SizedBox();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: widget.height,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayAnimationDuration: widget.animationDuration,
            autoPlayInterval: widget.autoScrollDuration,
            onPageChanged: (index, _) {
              if (mounted) {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
          ),
          items: List.generate(images.length, (index) {
            final image = AppNetworkImage(
              imageUrl: images[index],
              fit: BoxFit.cover,
              width: double.infinity,
              height: widget.height,
            );
            return image;
          }),
        ),

        Positioned(
          bottom: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 6,
                width: _currentIndex == index ? 18 : 6,
                decoration: BoxDecoration(
                  color: _currentIndex == index ? Colors.white : Colors.white.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
