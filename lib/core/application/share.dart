import 'package:flutter/material.dart';

class GenericValueNotifier<T> extends ValueNotifier<T> {
  GenericValueNotifier(T value) : super(value);

  @override
  set value(T newValue) {
    super.value = newValue;
  }
}
