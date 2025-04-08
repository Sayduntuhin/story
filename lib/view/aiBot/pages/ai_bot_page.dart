import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:story_always/view/widgets/custom_appbar.dart';

class AIBotPage extends StatefulWidget {
  @override
  _AIBotPageState createState() => _AIBotPageState();
}

class _AIBotPageState extends State<AIBotPage> {
  // List of books
  final List<String> _books = ["My Book", "Mother book"];
  String? _selectedBook;

  // Fixed list of episodes (for all books)
  final List<String> _episodes = ["Childhood", "Family", "Friend", "Love"];
  String? _selectedEpisode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Ai bot"),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, and welcome!  ",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ), Text(
              "I'm here to help you create a beautiful memoir of your life. 😄",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            Text(
              "Select a book",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.h),

            // Book Selection Dropdown
            DropdownButton<String>(
              value: _selectedBook,
              hint: Text("Select a book"),
              onChanged: (value) {
                setState(() {
                  _selectedBook = value;
                  _selectedEpisode = null; // Reset episode when changing book
                });
              },
              items: _books.map((book) {
                return DropdownMenuItem<String>(
                  value: book,
                  child: Text(book),
                );
              }).toList(),
            ),
            SizedBox(height: 20.h),

            // Episode Dropdown (only visible when a book is selected)
            if (_selectedBook != null) ...[
              Text(
                "Select an episode",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),

              DropdownButton<String>(
                value: _selectedEpisode,
                hint: Text("Select an episode"),
                onChanged: (value) {
                  setState(() {
                    _selectedEpisode = value;
                  });
                },
                items: _episodes.map((episode) {
                  return DropdownMenuItem<String>(
                    value: episode,
                    child: Text(episode),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
