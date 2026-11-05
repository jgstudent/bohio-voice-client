# Customer Softphone Step 2 — FreePBX Interoperability Laboratory

## Objective

Prove the existing Bohio FreePBX laboratory can register and exchange reliable
one-to-one audio calls with an established third-party SIP client before Bohio
client calling code is written.

This is a controlled interoperability test, not a production deployment and
not authorization to expose SIP services to the public Internet.

## Approved test client

Use an official Linphone desktop release obtained from:

- https://www.linphone.org/en/download/
- https://www.linphone.org/en/docs/login-sip-account/

Select **Third-Party SIP Account**. Do not create or use a free Linphone SIP
service account for this test. The account under test belongs to the Bohio
FreePBX laboratory.

## Required laboratory assets

1. Existing FreePBX at the private laboratory address.
2. One new, dedicated, non-production PJSIP extension named clearly for the
   Bohio softphone laboratory.
3. A separate known-working internal extension or telephone for two-way calls.
4. A generated SIP secret stored only in the operator's password manager and
   the authorized softphone configuration.
5. The actual PBX transport, port, domain/address, NAT, codec, and RTP settings
   read from FreePBX rather than inferred from defaults.

Do not reuse a customer's extension, the validated Cisco phone's extension, an
administrator password, or a trunk credential.

## Safety controls

- Keep the extension internal-only during the initial test when FreePBX policy
  permits that restriction.
- Do not paste the SIP secret into chat, tickets, screenshots, shell history,
  source control, or the results document.
- Do not enable public firewall access, port forwarding, anonymous SIP,
  automatic answer, call recording, video, or remote administration.
- Do not alter the working Cisco provisioning template or device assignment.
- Do not change PBX-wide SIP transports, certificates, codec order, RTP range,
  NAT policy, or firewall zones during baseline testing.
- Keep Linphone diagnostic logs disabled unless a specific failed test requires
  a time-bounded private diagnostic capture.
- Store private captures outside the repository and delete them after the
  incident is resolved.

## Phase A — Record the existing PBX boundary

Record these values in a private operator worksheet, not in Git:

- test extension number and authentication username;
- PBX private address or approved FQDN;
- PJSIP transport and listening port;
- outbound proxy, if required;
- enabled audio codecs and order;
- RTP port range;
- local networks and external-address/NAT policy;
- FreePBX firewall zone that contains the test workstation; and
- test partner extension.

Do not record the SIP password in the worksheet.

## Phase B — Confirm network reachability

From Windows PowerShell, run the repository check with the actual PBX address,
transport, and configured SIP port:

```powershell
./scripts/Test-LabConnectivity.ps1 `
  -PbxAddress "192.168.40.109" `
  -SipPort 5060 `
  -Transport UDP
```

The example port is not a claim about the live PBX. Replace it with the value
read from FreePBX. A UDP reachability check cannot prove that a UDP service is
open; successful SIP registration is the authoritative application-level test.

## Phase C — Configure the official softphone

1. Install the official Linphone desktop application.
2. Choose **Third-Party SIP Account**.
3. Enter the dedicated extension identity, authentication username, PBX
   address/domain, approved transport/port, and SIP secret directly in the app.
4. Disable video, chat, recording, and automatic answer for the baseline.
5. Select only the audio codecs approved by the PBX if the client exposes codec
   selection.
6. Confirm the account reaches Registered without disabling certificate
   validation or weakening PBX security.

## Phase D — Functional test order

Run one test at a time and update `docs/INTEROP_RESULTS.md` without entering
phone numbers, names, secrets, SIP URIs, or raw logs.

1. Registration and recovery after application restart.
2. Outbound internal call and two-way audio.
3. Inbound internal call and two-way audio.
4. DTMF to a safe internal target such as voicemail or an approved test IVR.
5. Mute and unmute.
6. Hold and resume, verifying audio in both directions afterward.
7. Blind transfer to the approved test extension.
8. Attended transfer to the approved test extension.
9. Caller-ID presentation using only a generic test identity.
10. Voicemail access if enabled for the laboratory extension.
11. Application restart and re-registration.
12. Workstation network interruption and recovery.
13. VPN test only after the local-LAN baseline passes.

Do not place external PSTN calls until internal calling is accepted and an
operator explicitly approves a bounded outbound test.

## Phase E — Evidence and cleanup

- Record Pass, Fail, Blocked, or Not Run for each test.
- Record only bounded timestamps, test IDs, symptoms, and non-sensitive error
  codes.
- Confirm FreePBX and Bohio Voice administrative logs contain no exposed
  credentials.
- Confirm no Cisco device, production extension, trunk, route, or provisioning
  record changed.
- Remove any temporary packet capture and securely retain the SIP secret only
  if the dedicated extension will be used in the next approved step.

## Completion gate

Step 2 completes only after registration, inbound and outbound two-way audio,
DTMF, mute, hold/resume, application restart, and network recovery pass. A
failed transfer or VPN test may remain a documented follow-up only when it does
not compromise the core calling baseline and the owner explicitly accepts the
limitation.
