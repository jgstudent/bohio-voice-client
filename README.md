# Bohio Voice Client

Bohio Voice Client is the planned customer communications application for
Windows, macOS, Linux, Android, and iOS. It is separate from the Bohio Voice
administration and provisioning platform.

## Current status

**FreePBX interoperability laboratory — no Bohio calling implementation is
present.**

This repository intentionally contains no SIP SDK, SIP account, password,
certificate, push credential, customer data, or executable calling code. A
closed-source SDK may only be added after Bohio Systems obtains and records an
appropriate proprietary license.

## Product boundary

- The existing Bohio Voice platform remains the internal administrative
  control plane.
- This client is installed on customer-owned desktop and mobile devices.
- A future enrollment service will issue device-specific configuration without
  exposing internal PBX administration.
- Version 1 is an audio business softphone, not a complete unified-
  communications suite.

## Target platforms

- Windows 10 or later
- macOS 13 or later
- supported 64-bit Linux desktop distributions
- Android 9 or later
- iOS 15 or later

These targets are product policy and must be revalidated against the selected
SDK before implementation and before every major release.

## Documentation

- [Architecture](docs/ARCHITECTURE.md)
- [Security boundaries](docs/SECURITY_BOUNDARIES.md)
- [Licensing decision](docs/LICENSING_DECISION.md)
- [Version 1 scope](docs/V1_SCOPE.md)
- [Platform matrix](docs/PLATFORM_MATRIX.md)
- [Step 1 acceptance](docs/STEP_1_ACCEPTANCE.md)
- [Step 2 FreePBX interoperability](docs/STEP_2_FREEPBX_INTEROPERABILITY.md)
- [Interoperability results](docs/INTEROP_RESULTS.md)

## Development rules

1. Never commit real credentials, provisioning packages, certificates, push
   keys, customer records, call records, or packet captures.
2. Never reuse Bohio administrator sessions or credentials in the client.
3. Do not add AGPL/GPL SIP code to this proprietary repository without written
   license approval.
4. Keep platform integrations native where background calling and operating-
   system call UI require it.
5. Add features incrementally and require an interoperability, security,
   accessibility, and rollback gate for every release.
