# TheseArentTheDroidsYoureLookingFor

## Overview

[TheseArentTheDroidsYoureLookingFor][1] is a repository for bash scripts that adjust the android /system/build.prop to make a device appear to Google Play Services as a different device. This file can only be edited whilst running as root, either in normal mode or under a custom recovery such as [TWRP][2].

## Motivation

Occasionally there are times when an android device cannot install an APK from the Google Play Store because it is deemed to be [incompatible][3]. If you know the application really is compatible with your device and you are determined, you can still install such an application by downloading the APK from a [reputable source][4] and [sideloading][5] it.

This didn't suit me so well - sideloading an APK results in no market link being created and so the application will not receive updates. The APK I needed is frequently updated and so no updates was a dealbreaker. Modifying the android build.prop to fool Google Play Services to allow the APK to install and update worked out as a good alternative for me.

## Warning!

Modifying the android build.prop file could make your device unbootable. I am not responsible for bricked devices as a result of running these scripts - use at your own risk!

## License

[Apache License, Version 2.0][6]

  [1]: https://github.com/sjwood/TheseArentTheDroidsYoureLookingFor
  [2]: https://twrp.me
  [3]: https://developer.android.com/guide/practices/compatibility.html
  [4]: https://www.apkmirror.com
  [5]: https://en.wikipedia.org/wiki/Sideloading
  [6]: https://raw.githubusercontent.com/sjwood/TheseArentTheDroidsYoureLookingFor/master/LICENSE
