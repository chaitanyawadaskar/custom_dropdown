<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

This Package lets you make customized drodown without any hassle. Just pass the list and selected value and you're done. You can add styling and decorate easily. For More info read the docs below.

## Features

Add this package to your flutter app to:
  - to add dropdown easyly
  - to make it customize without long code
  - to make search functionality in one to two lines of code
  - and many more things

## Usage

```dart
 CustomDropDown(
                            hintText: 'Please select',
                            list: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            selectedValue: values,
                            onChange: (val) {
                             
                            })
```

