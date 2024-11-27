// import 'package:connect_guide/domain/entities/review.dart';
// import 'package:flutter/material.dart';

// class RatingAndReviewTab extends StatefulWidget {
//   final List<ReviewEntity> reviews;

//   const RatingAndReviewTab({
//     super.key,
//     required this.reviews,
//   });

//   @override
//   _RatingAndReviewTabState createState() => _RatingAndReviewTabState();
// }

// class _RatingAndReviewTabState extends State<RatingAndReviewTab> {
//   void _showAddRatingReviewSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//           ),
//           child: AddRatingReviewContent(
//             nameController: TextEditingController(),
//             reviewController: TextEditingController(),
//             onAddReview: (review) {
//               setState(() {
//                 widget.reviews.add(review);
//               });
//               Navigator.pop(context);
//             },
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double averageRating = widget.reviews.isNotEmpty
//         ? widget.reviews.map((review) => review.rating ?? 0.0).reduce((a, b) => a + b) / widget.reviews.length
//         : 0.0;

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: const Color.fromRGBO(120, 94, 246, 0.1),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '${averageRating.toStringAsFixed(1)} Rating',
//                         style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       Row(
//                         children: List.generate(5, (index) {
//                           return Icon(
//                             index < averageRating.floor() ? Icons.star : Icons.star_border,
//                             color: Colors.purple,
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Text(
//                   '${widget.reviews.length} Reviews',
//                   style: const TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 16),
//           const Text(
//             'Reviews',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: ListView.builder(
//               itemCount: widget.reviews.length,
//               itemBuilder: (context, index) {
//                 return ReviewTile(review: widget.reviews[index]);
//               },
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () => _showAddRatingReviewSheet(context),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromRGBO(120, 94, 246, 1.0),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               padding: const EdgeInsets.symmetric(vertical: 16),
//             ),
//             child: const Center(
//               child: Text(
//                 'Add Rate and Review',
//                 style: TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Define AddRatingReviewContent widget
// class AddRatingReviewContent extends StatelessWidget {
//   final TextEditingController nameController;
//   final TextEditingController reviewController;
//   final Function(ReviewEntity) onAddReview;

//   const AddRatingReviewContent({
//     super.key,
//     required this.nameController,
//     required this.reviewController,
//     required this.onAddReview,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           TextField(
//             controller: nameController,
//             decoration: const InputDecoration(labelText: 'Name'),
//           ),
//           TextField(
//             controller: reviewController,
//             decoration: const InputDecoration(labelText: 'Review'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final review = ReviewEntity(
//                 name: nameController.text,
//                 review: reviewController.text,
//                 rating: 5.0, // Example rating
//               );
//               onAddReview(review);
//             },
//             child: const Text('Submit'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Define ReviewTile widget
// class ReviewTile extends StatelessWidget {
//   final ReviewEntity review;

//   const ReviewTile({
//     super.key,
//     required this.review,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(review.name ?? 'Anonymous'),
//       subtitle: Text(review.review ?? ''),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: List.generate(5, (index) {
//           return Icon(
//             index < (review.rating ?? 0) ? Icons.star : Icons.star_border,
//             color: Colors.purple,
//           );
//         }),
//       ),
//     );
//   }
// }

import 'package:connect_guide/domain/entities/review.dart';
import 'package:flutter/material.dart';

class RatingAndReviewTab extends StatefulWidget {
  final List<ReviewEntity> reviews;

  const RatingAndReviewTab({
    super.key,
    required this.reviews,
  });

  @override
  State<RatingAndReviewTab> createState() => _RatingAndReviewTabState();
}

class _RatingAndReviewTabState extends State<RatingAndReviewTab> {
  void _showAddRatingReviewSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddRatingReviewContent(
            nameController: TextEditingController(),
            reviewController: TextEditingController(),
            onAddReview: (review) {
              setState(() {
                widget.reviews.add(review);
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double averageRating = widget.reviews.isNotEmpty
        ? widget.reviews
                .map((review) => review.rating ?? 0.0)
                .reduce((a, b) => a + b) /
            widget.reviews.length
        : 0.0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(120, 94, 246, 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${averageRating.toStringAsFixed(1)} Rating',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < averageRating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.purple,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${widget.reviews.length} Reviews',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Reviews',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: widget.reviews.length,
              itemBuilder: (context, index) {
                return ReviewTile(review: widget.reviews[index]);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => _showAddRatingReviewSheet(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(120, 94, 246, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Center(
              child: Text(
                'Add Rate and Review',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Define AddRatingReviewContent widget
class AddRatingReviewContent extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController reviewController;
  final Function(ReviewEntity) onAddReview;

  const AddRatingReviewContent({
    super.key,
    required this.nameController,
    required this.reviewController,
    required this.onAddReview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: reviewController,
            decoration: const InputDecoration(labelText: 'Review'),
          ),
          ElevatedButton(
            onPressed: () {
              final review = ReviewEntity(
                name: nameController.text,
                review: reviewController.text,
                rating: 5.0, // Example rating
              );
              onAddReview(review);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

// Define ReviewTile widget
class ReviewTile extends StatelessWidget {
  final ReviewEntity review;

  const ReviewTile({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(review.name ?? 'Anonymous'),
      subtitle: Text(review.review ?? ''),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            index < (review.rating ?? 0) ? Icons.star : Icons.star_border,
            color: Colors.purple,
          );
        }),
      ),
    );
  }
}
