import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/common/component/custom_text_form_field.dart';
import 'package:kbuddy_flutter/common/component/login_button.dart';
import 'package:kbuddy_flutter/common/component/text.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';
import 'package:kbuddy_flutter/common/const/typo.dart';
import 'package:kbuddy_flutter/common/view/bottom_navbar.dart';
import 'package:kbuddy_flutter/common/view/top_appbar.dart';

class PostQnaScreen extends ConsumerStatefulWidget {
  PostQnaScreen({super.key});

  @override
  ConsumerState<PostQnaScreen> createState() => _PostQnaScreenState();
}

class _PostQnaScreenState extends ConsumerState<PostQnaScreen> {
  final TextEditingController contentController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController hashController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FlexText(
            content: 'New Question',
            textStyle: title100Light,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              children: [
                Container(
                  height: 2,
                  color: Color(0xFFE6E6E6),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Title of a question",
                            style: title300Medium,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      CustomTextFormField(
                          length: 20,
                          label: "Type here",
                          controller: titleController),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 150,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Strat writing a question here...",
                            labelStyle: TextStyle(color: Color(0xff909090)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          controller: contentController,
                          maxLength: 200,
                          maxLines: 10,
                          minLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 8,
                  color: Color(0xFFE6E6E6),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hashtags ",
                                style: title300Medium,
                              ),
                              Icon(
                                Icons.info,
                                size: 20,
                              )
                            ],
                          ),
                          Text(
                            "Optional",
                            style: body200Light,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subheading",
                            style: body200Light,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "ex) #hospital, #picnic",
                          border: OutlineInputBorder(),
                        ),
                        controller: hashController,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 2,
                  color: Color(0xFFE6E6E6),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GestureDetector(
                      child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PRIMARY_COLOR),
                    child: Center(
                        child: FlexText(
                      content: "Post",
                      textStyle: body200Medium,
                      fontColor: Colors.white,
                    )),
                  )),
                )
              ],
            ),
          ),
        ));
  }
}
