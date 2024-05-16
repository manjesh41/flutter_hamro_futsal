import 'package:flutter/material.dart';

class AdminReview extends StatefulWidget {
  const AdminReview({Key? key}) : super(key: key);

  @override
  _AdminReviewState createState() => _AdminReviewState();
}

class _AdminReviewState extends State<AdminReview> {
  List<String> reviews = [
    'Great product!',
    'Nice service!',
    'Amazing experience!',
  ];

  TextEditingController commentController = TextEditingController();

  void addReview() {
    if (commentController.text.isNotEmpty) {
      setState(() {
        reviews.add(commentController.text);
        commentController.clear();
      });
    }
  }

  void deleteReview(int index) {
    if (index < reviews.length) {
      setState(() {
        reviews.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Review'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              child: const Text('Add Review'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Reviews:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];

                return ListTile(
                  title: Text(review),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteReview(index),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
