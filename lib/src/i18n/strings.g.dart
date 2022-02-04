
/*
 * Generated file. Do not edit.
 *
 * Locales: 2
 * Strings: 38 (19.0 per locale)
 *
 * Built on 2022-02-03 at 16:25 UTC
 */

import "package:flutter/widgets.dart";

const AppLocale _baseLocale = AppLocale.en;
AppLocale _currLocale = _baseLocale;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale {
	en, // 'en' (base locale, fallback)
	br, // 'br'
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn _t = _currLocale.translations;
_StringsEn get t => _t;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget.translations;
	}
}

class LocaleSettings {
	LocaleSettings._(); // no constructor

	/// Uses locale of the device, fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale useDeviceLocale() {
		final locale = AppLocaleUtils.findDeviceLocale();
		return setLocale(locale);
	}

	/// Sets locale
	/// Returns the locale which has been set.
	static AppLocale setLocale(AppLocale locale) {
		_currLocale = locale;
		_t = _currLocale.translations;

		if (WidgetsBinding.instance != null) {
			// force rebuild if TranslationProvider is used
			_translationProviderKey.currentState?.setLocale(_currLocale);
		}

		return _currLocale;
	}

	/// Sets locale using string tag (e.g. en_US, de-DE, fr)
	/// Fallbacks to base locale.
	/// Returns the locale which has been set.
	static AppLocale setLocaleRaw(String rawLocale) {
		final locale = AppLocaleUtils.parse(rawLocale);
		return setLocale(locale);
	}

	/// Gets current locale.
	static AppLocale get currentLocale {
		return _currLocale;
	}

	/// Gets base locale.
	static AppLocale get baseLocale {
		return _baseLocale;
	}

	/// Gets supported locales in string format.
	static List<String> get supportedLocalesRaw {
		return AppLocale.values
			.map((locale) => locale.languageTag)
			.toList();
	}

	/// Gets supported locales (as Locale objects) with base locale sorted first.
	static List<Locale> get supportedLocales {
		return AppLocale.values
			.map((locale) => locale.flutterLocale)
			.toList();
	}
}

/// Provides utility functions without any side effects.
class AppLocaleUtils {
	AppLocaleUtils._(); // no constructor

	/// Returns the locale of the device as the enum type.
	/// Fallbacks to base locale.
	static AppLocale findDeviceLocale() {
		final String? deviceLocale = WidgetsBinding.instance?.window.locale.toLanguageTag();
		if (deviceLocale != null) {
			final typedLocale = _selectLocale(deviceLocale);
			if (typedLocale != null) {
				return typedLocale;
			}
		}
		return _baseLocale;
	}

	/// Returns the enum type of the raw locale.
	/// Fallbacks to base locale.
	static AppLocale parse(String rawLocale) {
		return _selectLocale(rawLocale) ?? _baseLocale;
	}
}

// context enums

// interfaces generated as mixins

// translation instances

late _StringsEn _translationsEn = _StringsEn.build();
late _StringsBr _translationsBr = _StringsBr.build();

// extensions for AppLocale

extension AppLocaleExtensions on AppLocale {

	/// Gets the translation instance managed by this library.
	/// [TranslationProvider] is using this instance.
	/// The plural resolvers are set via [LocaleSettings].
	_StringsEn get translations {
		switch (this) {
			case AppLocale.en: return _translationsEn;
			case AppLocale.br: return _translationsBr;
		}
	}

	/// Gets a new translation instance.
	/// [LocaleSettings] has no effect here.
	/// Suitable for dependency injection and unit tests.
	///
	/// Usage:
	/// final t = AppLocale.en.build(); // build
	/// String a = t.my.path; // access
	_StringsEn build() {
		switch (this) {
			case AppLocale.en: return _StringsEn.build();
			case AppLocale.br: return _StringsBr.build();
		}
	}

	String get languageTag {
		switch (this) {
			case AppLocale.en: return "en";
			case AppLocale.br: return "br";
		}
	}

	Locale get flutterLocale {
		switch (this) {
			case AppLocale.en: return const Locale.fromSubtags(languageCode: "en");
			case AppLocale.br: return const Locale.fromSubtags(languageCode: "br");
		}
	}
}

extension StringAppLocaleExtensions on String {
	AppLocale? toAppLocale() {
		switch (this) {
			case "en": return AppLocale.en;
			case "br": return AppLocale.br;
			default: return null;
		}
	}
}

// wrappers

GlobalKey<_TranslationProviderState> _translationProviderKey = GlobalKey<_TranslationProviderState>();

class TranslationProvider extends StatefulWidget {
	TranslationProvider({required this.child}) : super(key: _translationProviderKey);

	final Widget child;

	@override
	_TranslationProviderState createState() => _TranslationProviderState();

	static _InheritedLocaleData of(BuildContext context) {
		final inheritedWidget = context.dependOnInheritedWidgetOfExactType<_InheritedLocaleData>();
		if (inheritedWidget == null) {
			throw 'Please wrap your app with "TranslationProvider".';
		}
		return inheritedWidget;
	}
}

class _TranslationProviderState extends State<TranslationProvider> {
	AppLocale locale = _currLocale;

	void setLocale(AppLocale newLocale) {
		setState(() {
			locale = newLocale;
		});
	}

	@override
	Widget build(BuildContext context) {
		return _InheritedLocaleData(
			locale: locale,
			child: widget.child,
		);
	}
}

class _InheritedLocaleData extends InheritedWidget {
	final AppLocale locale;
	Locale get flutterLocale => locale.flutterLocale; // shortcut
	final _StringsEn translations; // store translations to avoid switch call

	_InheritedLocaleData({required this.locale, required Widget child})
		: translations = locale.translations, super(child: child);

	@override
	bool updateShouldNotify(_InheritedLocaleData oldWidget) {
		return oldWidget.locale != locale;
	}
}

// pluralization feature not used

// helpers

final _localeRegex = RegExp(r"^([a-z]{2,8})?([_-]([A-Za-z]{4}))?([_-]?([A-Z]{2}|[0-9]{3}))?$");
AppLocale? _selectLocale(String localeRaw) {
	final match = _localeRegex.firstMatch(localeRaw);
	AppLocale? selected;
	if (match != null) {
		final language = match.group(1);
		final country = match.group(5);

		// match exactly
		selected = AppLocale.values
			.cast<AppLocale?>()
			.firstWhere((supported) => supported?.languageTag == localeRaw.replaceAll("_", "-"), orElse: () => null);

		if (selected == null && language != null) {
			// match language
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.startsWith(language) == true, orElse: () => null);
		}

		if (selected == null && country != null) {
			// match country
			selected = AppLocale.values
				.cast<AppLocale?>()
				.firstWhere((supported) => supported?.languageTag.contains(country) == true, orElse: () => null);
		}
	}
	return selected;
}

// translations

// Path: <root>
class _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build();

	/// Access flat map
	dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	late final _StringsEn _root = this;

	// Translations
	late final _StringsHomeScreenEn homeScreen = _StringsHomeScreenEn._(_root);
	late final _StringsCreationScreenEn creationScreen = _StringsCreationScreenEn._(_root);
	late final _StringsLocalesEn locales = _StringsLocalesEn._(_root);
}

// Path: homeScreen
class _StringsHomeScreenEn {
	_StringsHomeScreenEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get title => "Your cards";
	String get createButton => "Create new card";
	String get dataRevealedButton => "Data revealed";
	String get dataHiddenButton => "Data hidden";
	String get hiddenCard => "Nothing to see here ;)";
	String get noCardFound => "No card available :(";
	String get creditCard => "Credit";
	String get debitCard => "Debit";
	String get englishButton => "EN";
	String get portugueseButton => "PT";
}

// Path: creationScreen
class _StringsCreationScreenEn {
	_StringsCreationScreenEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get title => "New card";
	String get creditButton => "Credit";
	String get debitButton => "Debit";
	String get nameForm => "Name on card";
	String get numberForm => "Card number";
	String get cancelButton => "Cancel";
	String get createButton => "Create";
}

// Path: locales
class _StringsLocalesEn {
	_StringsLocalesEn._(this._root);

	// ignore: unused_field
	final _StringsEn _root;

	// Translations
	String get en => "English";
	String get br => "Português";
}

// Path: <root>
class _StringsBr implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsBr.build();

	/// Access flat map
	@override dynamic operator[](String key) => _flatMap[key];

	// Internal flat map initialized lazily
	@override
  late final Map<String, dynamic> _flatMap = _buildFlatMap();

	// ignore: unused_field
	@override late final _StringsBr _root = this;

	// Translations
	@override late final _StringsHomeScreenBr homeScreen = _StringsHomeScreenBr._(_root);
	@override late final _StringsCreationScreenBr creationScreen = _StringsCreationScreenBr._(_root);
	@override late final _StringsLocalesBr locales = _StringsLocalesBr._(_root);
}

// Path: homeScreen
class _StringsHomeScreenBr implements _StringsHomeScreenEn {
	_StringsHomeScreenBr._(this._root);

	// ignore: unused_field
	@override final _StringsBr _root;

	// Translations
	@override String get title => "Seus cartões";
	@override String get createButton => "Criar novo cartão";
	@override String get dataRevealedButton => "Dados revelados";
	@override String get dataHiddenButton => "Dados ocultados";
	@override String get hiddenCard => "Nada para ver aqui ;)";
	@override String get noCardFound => "Nenhum cartão disponível :(";
	@override String get creditCard => "Crédito";
	@override String get debitCard => "Débito";
	@override String get englishButton => "EN";
	@override String get portugueseButton => "PT";
}

// Path: creationScreen
class _StringsCreationScreenBr implements _StringsCreationScreenEn {
	_StringsCreationScreenBr._(this._root);

	// ignore: unused_field
	@override final _StringsBr _root;

	// Translations
	@override String get title => "Novo cartão";
	@override String get creditButton => "Crédito";
	@override String get debitButton => "Débito";
	@override String get nameForm => "Nome presente no cartão";
	@override String get numberForm => "Número do cartão";
	@override String get cancelButton => "Cancelar";
	@override String get createButton => "Criar";
}

// Path: locales
class _StringsLocalesBr implements _StringsLocalesEn {
	_StringsLocalesBr._(this._root);

	// ignore: unused_field
	@override final _StringsBr _root;

	// Translations
	@override String get en => "English";
	@override String get br => "Português";
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	Map<String, dynamic> _buildFlatMap() {
		return {
			"homeScreen.title": "Your cards",
			"homeScreen.createButton": "Create new card",
			"homeScreen.dataRevealedButton": "Data revealed",
			"homeScreen.dataHiddenButton": "Data hidden",
			"homeScreen.hiddenCard": "Nothing to see here ;)",
			"homeScreen.noCardFound": "No card available :(",
			"homeScreen.creditCard": "Credit",
			"homeScreen.debitCard": "Debit",
			"homeScreen.englishButton": "EN",
			"homeScreen.portugueseButton": "PT",
			"creationScreen.title": "New card",
			"creationScreen.creditButton": "Credit",
			"creationScreen.debitButton": "Debit",
			"creationScreen.nameForm": "Name on card",
			"creationScreen.numberForm": "Card number",
			"creationScreen.cancelButton": "Cancel",
			"creationScreen.createButton": "Create",
			"locales.en": "English",
			"locales.br": "Português",
		};
	}
}

extension on _StringsBr {
	Map<String, dynamic> _buildFlatMap() {
		return {
			"homeScreen.title": "Seus cartões",
			"homeScreen.createButton": "Criar novo cartão",
			"homeScreen.dataRevealedButton": "Dados revelados",
			"homeScreen.dataHiddenButton": "Dados ocultados",
			"homeScreen.hiddenCard": "Nada para ver aqui ;)",
			"homeScreen.noCardFound": "Nenhum cartão disponível :(",
			"homeScreen.creditCard": "Crédito",
			"homeScreen.debitCard": "Débito",
			"homeScreen.englishButton": "EN",
			"homeScreen.portugueseButton": "PT",
			"creationScreen.title": "Novo cartão",
			"creationScreen.creditButton": "Crédito",
			"creationScreen.debitButton": "Débito",
			"creationScreen.nameForm": "Nome presente no cartão",
			"creationScreen.numberForm": "Número do cartão",
			"creationScreen.cancelButton": "Cancelar",
			"creationScreen.createButton": "Criar",
			"locales.en": "English",
			"locales.br": "Português",
		};
	}
}
