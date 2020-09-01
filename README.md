# Flavoring Flutter

This sample code has two defined flavors: `dev` and `qa`.

To run a specific flavor from the command line tou can use `flutter run --flavor qa`.

On Android Studio you can edit your run target and add the flavor flag there.


# Cheatsheet

Here is a quick cheatsheet on what has been done to change the app name, bundle id and colors based on the flavor:

## Android Flavors

The falvors on android are declared in `android/app/build.grade`.

`defaultConfig` object declares the default values for all app builds, everything that you can
configure here you can override inside a flavor.

`productFlavors` declares our `dev` and `qa` flavors setting up a single app name and bundle id for each flavor. 
For the app name setting to take effect, make sure the `AndroidManifest.xml` is using the resource `app_name` as the application label.

## iOS Flavos

iOS is bit trickier, everything must be done through the xcode UI.

First we need to create the build configurations, for each flavor we need one Debug and Release configuration, so for `dev` flavor we need a `Debug-dev` and `Release-dev` configurations. You can duplicate the original `Debug` and `Release` configs and jsut rename it.
You do this by going to the project info configuration on xcode.

Next we need to create **schemas**, those are the actual flavors of iOS. On the top menu `product -> schemes -> manage schemes...`. Here we duplicate the default `Runner` scheme and name it as `dev` and for each tab we change the configuration to our `Debug-dev` and `Release-dev` configs.

With that the project already build with flavors.
To change the buindle ID we go to target build settings configurations. There you can see a `Product Bundle Identifier`, expanding it shows all our configs, so we can set any ID for any configuration.

To change the app name per flavor, on target build settings configurations, add an user defined setting and call it `APP_DISPLAY_NAME`. Now if you expande it you can see the setting for each flavor, so you can set whatever name you want for each flavor.
Then go to `Info.plist` and set the `Bundle display name` to be `$(APP_DISPLAY_NAME)`.

## Flutter Flavors

On the flutter side, most people create one `main.dart` per flavor, so we would have `main_dev.dart` and `main_qa.dart`. We choose to have only one entry point and check for the package id to identify which flavor we are running, and then we configure the app accordingly.
