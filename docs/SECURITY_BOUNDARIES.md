# Security Boundaries

## Non-negotiable boundaries

- A customer client must never receive Bohio administrator, database, carrier,
  FreePBX API, Stripe, APNs, FCM server, or code-signing credentials.
- A client-provided organization, extension, user, or device identifier is not
  authorization. The server must derive access from the authenticated identity
  and active organization membership.
- Enrollment grants must be short lived, single use, narrowly scoped, and
  invalid after successful redemption or revocation.
- SIP credentials must be unique per customer/device policy and must not be
  shared across organizations.
- Production signaling and enrollment require validated TLS. Media encryption
  policy must be explicitly selected and interoperability-tested before launch.
- Secrets stored on a device must use the platform-protected keystore or
  keychain and must never be written to ordinary preferences, logs, crash
  reports, analytics, clipboard, or screenshots.

## Logging policy

Permitted diagnostic fields include bounded timestamps, application version,
platform version, anonymized device reference, call state, transport state,
codec name, non-sensitive error code, and correlation ID.

Logs must redact or omit:

- passwords, authorization headers, enrollment grants, refresh tokens, and SIP
  digest material;
- private keys, certificates containing private keys, push tokens, and signing
  material;
- full SIP URIs when they identify a customer;
- phone numbers, contact names, message content, voicemail content, and call
  recordings; and
- raw SIP, SDP, RTP, HTTP bodies, or packet captures in production builds.

## Application controls

- Fail closed when configuration, identity, certificate validation, or tenant
  context is missing.
- Require explicit microphone and notification permissions; explain why each
  permission is needed.
- Provide account removal and local-data erasure.
- Support remote device revocation and credential rotation.
- Prevent production builds from trusting user-installed debugging endpoints or
  disabling certificate validation.
- Separate development, test, and production application identifiers and push
  environments.

## Deferred decisions

The laboratory must determine the supported SIP transport, SRTP mode, codec
set, NAT traversal policy, TURN requirement, certificate trust model, push SIP
proxy, token-retention period, call-history retention, and privacy/export
requirements before production implementation.
