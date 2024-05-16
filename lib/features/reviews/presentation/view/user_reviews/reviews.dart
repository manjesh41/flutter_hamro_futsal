import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/review_view_model.dart';

class ReviewPage extends ConsumerStatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends ConsumerState<ReviewPage> {
  List<String> reviews = [];
  final key = GlobalKey<FormState>();

  TextEditingController commentController = TextEditingController();

  bool isEditing = false;
  int editedReviewIndex = -1;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  // Function to reload the data when the user triggers a refresh.
  Future<void> _handleRefresh() async {
    // Implement the logic to reload the data here.
    ref.watch(reviewViewModelProvider.notifier).getAllReview();
  }

  @override
  Widget build(BuildContext context) {
    final reviewState = ref.watch(reviewViewModelProvider);
    void addReview() {
      if (commentController.text.isNotEmpty) {
        setState(() {
          if (isEditing) {
            // Update the existing review
            reviews[editedReviewIndex] = commentController.text;
            isEditing = false;
            editedReviewIndex = -1;
          } else {
            // Add a new review
            if (key.currentState!.validate()) {
              String review = commentController.text;

              ref.watch(reviewViewModelProvider.notifier).addReview(review);
            }
          }
          commentController.clear();
        });
      }
    }

    void editReview(int index) {
      if (index < reviews.length) {
        setState(() {
          isEditing = true;
          editedReviewIndex = index;
          commentController.text = reviews[index];
        });
      }
    }

    void deleteReview(int index) {
      if (index < reviews.length) {
        setState(() {
          reviews.removeAt(index);
          if (isEditing && editedReviewIndex == index) {
            isEditing = false;
            editedReviewIndex = -1;
            commentController.clear();
          }
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Page'),
        backgroundColor: Colors.green,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: commentController,
                  decoration: const InputDecoration(
                    labelText: 'Write a review',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: addReview,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(isEditing ? 'Update Review' : 'Add Review'),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Reviews',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: reviewState.reviews.length,
                    itemBuilder: (context, index) {
                      final review = reviewState.reviews[index].text;
                      final isEditable = index == editedReviewIndex;
                      final username = reviewState.reviews[index].user.fname;
                      print(username);

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          color: Colors.lightGreen,
                          elevation: 3.0,
                          child: ListTile(
                            title: Text(
                              '${reviewState.reviews[index].user.fname} ${reviewState.reviews[index].user.lname}',
                            ),
                            subtitle: Text(
                              review,
                              style: const TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                              // Set the font size to 18
                            ),
                            trailing: isEditable
                                ? IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => deleteReview(index),
                                  )
                                : null,
                            onTap: isEditable ? null : () => editReview(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
