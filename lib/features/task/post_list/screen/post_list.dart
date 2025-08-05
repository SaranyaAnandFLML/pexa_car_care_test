import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pexa_carcare_test/features/task/post_list/controller/post_controller.dart';
import '../../../../core/common/error_text.dart';
import '../../../../core/common/loader.dart';
import '../../../../core/common/variables.dart';
import '../../../../theame/palette.dart';

class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Post List',
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600
        ),
      ),),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(w*0.06, w*0.03, w*0.06, w*0.06),
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final data = ref.watch(getPostsProvider); // Watch API state
            return data.when(
              data: (objects) {
                return objects.isEmpty
                    ? const Center(child: Text('NO DATA FOUND'))
                    : ListView.builder(
                  itemCount: objects.length,
                  itemBuilder: (context, index) {
                    final post = objects[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.title,
                              style: TextStyle(
                                fontSize: w*0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: w*0.01),
                            Text(
                              post.body,
                              style: TextStyle(
                                fontSize: w*0.035,
                                color: Pallete.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },

              // On error
              error: (error, stack) {
                if (kDebugMode) {
                  print(error);
                  return ErrorText(error: error.toString());
                } else {
                  // Show a GIF (loading or error animation) in release mode
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Something went wrong!',style: TextStyle(color: Pallete.purple,fontWeight: FontWeight.bold,fontSize: w*0.04),)
                      ],
                    ),
                  );
                }
              },

              // While loading
              loading: () {
                return Loader();
              },
            );
          },
        ),
      ),
    );
  }
}
