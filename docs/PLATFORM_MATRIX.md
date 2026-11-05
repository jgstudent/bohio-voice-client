# Platform Matrix

Last verified: 2026-11-05

| Platform | Product target | Native integration required | Initial delivery gate |
|---|---|---|---|
| Windows | Windows 10+, x64 | audio devices, notifications, secure storage, installer, signing | foreground lab call |
| macOS | macOS 13+, Apple silicon and x64 if supported | audio devices, permissions, Keychain, notarization, signing | foreground lab call |
| Linux | supported 64-bit desktop distribution | PipeWire/PulseAudio behavior, packaging, secure storage strategy | foreground lab call |
| Android | Android 9+ | Kotlin lifecycle, Core-Telecom, FCM, keystore, Bluetooth, foreground service | foreground call before push |
| iOS | iOS 15+ | Swift lifecycle, CallKit, PushKit/APNs, Keychain, audio session, signing | foreground call before push |

## Official platform constraints

- Linphone SDK documentation currently lists Android, iOS, Windows, macOS, and
  Linux support.
- Android recommends Telecom/Core-Telecom for calling applications:
  https://developer.android.com/develop/connectivity/telecom/voip-app
- Apple requires apps using modern VoIP PushKit notifications to report calls
  using CallKit:
  https://developer.apple.com/documentation/pushkit/responding-to-voip-notifications-from-pushkit

SDK minimums and store requirements change. Revalidate them before creating a
platform project and before every major release.
