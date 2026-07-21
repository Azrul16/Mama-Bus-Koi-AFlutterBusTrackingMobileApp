# Built-in Kotlin compatibility patch

This directory vendors `maplibre_gl` 0.26.2 from pub.dev.

Its Android Gradle configuration follows Flutter's plugin-author migration for
Flutter 3.44 and Android Gradle Plugin 9:

- plugin-owned Kotlin and Android Gradle Plugin classpaths were removed;
- `apply plugin: 'kotlin-android'` was removed;
- `kotlinOptions` was replaced by the built-in `kotlin.compilerOptions` DSL;
- minimum Flutter and Dart SDK versions now document the real requirement.

The implementation code is otherwise unchanged. Replace this path dependency
with pub.dev after upstream releases built-in Kotlin support.
