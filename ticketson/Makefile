configure_android_qa:
	cd lib && \
	flutter pub run environment_config:generate \
		--appENV=qa \
		--apiBaseUrl='' \
		--sentryDSN=''

flutter_build_qa:
	flutter clean && flutter pub get

build_apk:
	flutter build apk


build_android_qa: flutter_build_qa build_apk
