import 'package:flutter/material.dart';
import '/toast_message.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with ToastMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 111, 253, 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Info Toast Message'),
                  ),
                ),
                onTap: () {
                  showToast(
                    context: context,
                    title: 'Info',
                    description: 'Description. Lorem ipsum dolor sit amet.',
                    type: EnumToastMessage.info,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 111, 253, 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Success Toast Message'),
                  ),
                ),
                onTap: () {
                  showToast(
                      context: context,
                      title: 'Success',
                      description: 'Description. Lorem ipsum dolor sit amet.',
                      type: EnumToastMessage.success);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 111, 253, 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Error Toast Message'),
                  ),
                ),
                onTap: () {
                  showToast(
                    context: context,
                    title: 'Error',
                    description: 'Description. Lorem ipsum dolor sit amet.',
                    type: EnumToastMessage.error,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 111, 253, 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('Warning Toast Message'),
                  ),
                ),
                onTap: () {
                  showToast(
                    context: context,
                    title: 'Warning',
                    description: 'Description. Lorem ipsum dolor sit amet.',
                    type: EnumToastMessage.warning,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
