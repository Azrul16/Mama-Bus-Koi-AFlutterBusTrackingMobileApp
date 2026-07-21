# Built-in Kotlin compatibility patch

This directory vendors `firebase_database` 12.4.6 from pub.dev. Its Android
script no longer applies `kotlin-android`; compiler settings use the modern
`kotlin.compilerOptions` DSL. Application of the compatibility KGP on Flutter
3.44 is owned by Flutter itself, and future Flutter/AGP versions can compile the
same source with built-in Kotlin.

Replace this path dependency with pub.dev after upstream ships an equivalent
migration.
