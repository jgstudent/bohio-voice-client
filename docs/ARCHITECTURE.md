# Architecture

## Objective

Deliver a Bohio-branded customer softphone on Windows, macOS, Linux, Android,
and iOS while preserving a strict boundary between end-user calling and the
internal Bohio Voice administration platform.

## Proposed component model

### 1. Bohio Voice administration platform

The existing PHP application remains the operator control plane. It owns
organizations, locations, PBXs, extensions, devices, service metadata, audit
records, and future enrollment authorization. The customer client never logs
in to the administrator interface and never receives administrator database or
FreePBX API credentials.

### 2. Enrollment and client API

A future HTTPS service will exchange a short-lived, single-use enrollment
grant for device-specific client configuration. It will authenticate the
customer identity, enforce organization membership, record the device, support
revocation, and return only the minimum configuration required by that device.

The enrollment service is not implemented in Step 1.

### 3. SIP and media engine

Liblinphone is the preferred candidate because its official SDK covers the five
target operating systems and exposes C/C++, C#, Java/Kotlin, and Swift APIs.
It is not yet an approved dependency. Adoption requires a signed proprietary
license, a dependency inventory, codec review, and a laboratory interoperability
spike against Bohio's FreePBX environment.

### 4. Platform applications

- **Desktop:** one desktop product family for Windows, macOS, and Linux. The
  exact UI framework remains a Step 2 technical-spike decision; Qt/QML with the
  native SDK is the leading candidate because it covers all three desktops.
- **Android:** Kotlin application with native lifecycle, audio, notification,
  Bluetooth, permission, and Android Telecom/Core-Telecom integration.
- **iOS:** Swift application with native audio-session, CallKit, PushKit,
  notification, permission, and Keychain integration.

The SIP behavior contract should remain consistent across platforms, while
operating-system call handling stays native.

### 5. Mobile push path

Production mobile incoming calls require a server-side push-aware SIP path.
The design must associate device push tokens with the correct SIP identity,
wake the application through APNs or FCM, and permit the client to reconnect in
time to present the call. iOS VoIP pushes must be reported through CallKit.

This path is deliberately deferred until foreground SIP calling is validated.

## Initial call flow

1. An operator creates or authorizes a customer identity and extension.
2. The customer receives a short-lived enrollment grant through a future
   verified delivery channel.
3. The installed client redeems the grant over HTTPS.
4. The enrollment service validates organization and device policy.
5. The client stores device-specific configuration in the platform keystore.
6. The SIP engine registers through the approved SIP edge or laboratory PBX.
7. Signaling and media use the approved transport and encryption policy.

## Repository boundaries

This repository contains client source and client-specific documentation only.
The administrator platform, server-side enrollment implementation, SIP proxy,
push gateway, infrastructure definitions, signing material, and production
configuration belong in separately reviewed repositories or protected runtime
systems.
