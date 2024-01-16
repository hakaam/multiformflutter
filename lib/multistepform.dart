import 'package:flutter/material.dart';

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({super.key});

  @override
  State<MultiStepForm> createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailNameController = TextEditingController();
  final _phoneNameController = TextEditingController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiForm'),
      ),
      body: Stepper(
        steps: getSteps(),
        onStepCancel: () {
          if (_currentIndex > 0) {
            setState(() {
              _currentIndex--;
            });
          }
        },
        currentStep: _currentIndex,
        onStepContinue: () {
          final isLastStep = _currentIndex == getSteps().length - 1;
          if (isLastStep) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title:
                        Text('Form Submitted has been submitted successfully'),
                    content: Text('Your form has been submitted sucessfully'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'))
                    ],
                  );
                });
          } else {
            setState(() {
              _currentIndex++;
            });
          }
        },
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
          title: Text('Name Fields'),
          content: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                    labelText: 'First Name', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                    labelText: 'Last Name', border: OutlineInputBorder()),
              ),
            ],
          )),
      Step(
          title: Text('Email Fields'),
          content: Column(
            children: [
              TextFormField(
                controller: _emailNameController,
                decoration: InputDecoration(
                    labelText: 'email ', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _phoneNameController,
                decoration: InputDecoration(
                    labelText: 'phone', border: OutlineInputBorder()),
              ),
            ],
          )),
      Step(
          title: Text('Phone Number Field'),
          content: Column(
            children: [
              TextFormField(
                controller: _phoneNameController,
                decoration: InputDecoration(
                    labelText: 'phone number', border: OutlineInputBorder()),
              ),
            ],
          )),
    ];
  }
}
