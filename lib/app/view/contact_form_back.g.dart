// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_form_back.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactFormBack on _ContactFormBack, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_ContactFormBack.isValid'))
      .value;

  late final _$listAtom = Atom(name: '_ContactFormBack.list', context: context);



  late final _$_nameIsValidAtom =
      Atom(name: '_ContactFormBack._nameIsValid', context: context);

  @override
  bool get _nameIsValid {
    _$_nameIsValidAtom.reportRead();
    return super._nameIsValid;
  }

  @override
  set _nameIsValid(bool value) {
    _$_nameIsValidAtom.reportWrite(value, super._nameIsValid, () {
      super._nameIsValid = value;
    });
  }

  late final _$_emailIsValidAtom =
      Atom(name: '_ContactFormBack._emailIsValid', context: context);

  @override
  bool get _emailIsValid {
    _$_emailIsValidAtom.reportRead();
    return super._emailIsValid;
  }

  @override
  set _emailIsValid(bool value) {
    _$_emailIsValidAtom.reportWrite(value, super._emailIsValid, () {
      super._emailIsValid = value;
    });
  }

  late final _$_phoneIsValidAtom =
      Atom(name: '_ContactFormBack._phoneIsValid', context: context);

  @override
  bool get _phoneIsValid {
    _$_phoneIsValidAtom.reportRead();
    return super._phoneIsValid;
  }

  @override
  set _phoneIsValid(bool value) {
    _$_phoneIsValidAtom.reportWrite(value, super._phoneIsValid, () {
      super._phoneIsValid = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_ContactFormBack.save', context: context);

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_ContactFormBackActionController =
      ActionController(name: '_ContactFormBack', context: context);


  @override
  String? validateName(String? name) {
    final _$actionInfo = _$_ContactFormBackActionController.startAction(
        name: '_ContactFormBack.validateName');
    try {
      return super.validateName(name);
    } finally {
      _$_ContactFormBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validateEmail(String? email) {
    final _$actionInfo = _$_ContactFormBackActionController.startAction(
        name: '_ContactFormBack.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_ContactFormBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? validatePhone(String? phone) {
    final _$actionInfo = _$_ContactFormBackActionController.startAction(
        name: '_ContactFormBack.validatePhone');
    try {
      return super.validatePhone(phone);
    } finally {
      _$_ContactFormBackActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isValid: ${isValid}
    ''';
  }
}
