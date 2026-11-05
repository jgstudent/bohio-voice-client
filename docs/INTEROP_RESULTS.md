# FreePBX Interoperability Results

Status: **Completed**

This file contains sanitized test outcomes only. Do not enter extension
numbers, phone numbers, names, usernames, SIP URIs, passwords, tokens, IP
addresses other than documentation ranges, raw SIP/SDP/RTP, or packet captures.

## Laboratory boundary

| Field | Value |
|---|---|
| Test date | 2026-11-05 |
| Client application/version | Official Linphone desktop; version not recorded |
| Client operating system | Windows; version not recorded |
| PBX product/version | FreePBX 17.0.33 |
| Transport class | SIP over UDP on the private LAN |
| Network path | Local LAN |
| Production records changed | No |

## Test matrix

| ID | Test | Result | Sanitized evidence |
|---|---|---|---|
| INT-01 | Dedicated account registers | Pass | Client displayed registered/available state |
| INT-02 | Registration recovers after application restart | Pass | Registration returned and an internal call completed without re-entering credentials |
| INT-03 | Outbound internal call connects | Pass | Completed private-LAN call to approved internal test endpoint |
| INT-04 | Outbound call has two-way audio | Pass | Operator confirmed bidirectional audio and clean hangup |
| INT-05 | Inbound internal call connects | Pass | Accepted private-LAN call from approved internal test endpoint |
| INT-06 | Inbound call has two-way audio | Pass | Operator confirmed bidirectional audio and clean hangup |
| INT-07 | DTMF reaches approved internal target | Pass | Receiving internal endpoint detected the bounded test sequence |
| INT-08 | Mute and unmute | Pass | Microphone suppression and bidirectional audio restoration confirmed |
| INT-09 | Hold and resume preserves two-way audio | Pass | Hold, resume, restored bidirectional audio, and clean hangup confirmed |
| INT-10 | Blind transfer | Not Run | — |
| INT-11 | Attended transfer | Not Run | — |
| INT-12 | Generic caller identity is correct | Not Run | — |
| INT-13 | Voicemail access | Not Run | — |
| INT-14 | Network interruption recovers registration | Pass | Registration and bidirectional internal calling recovered without re-entering credentials |
| INT-15 | VPN calling baseline | Not Run | — |

## Acceptance summary

- Core registration: Pass
- Core inbound calling: Pass
- Core outbound calling: Pass
- Core media: Pass for baseline inbound and outbound audio
- Core controls: Pass
- Recovery: Pass
- Overall: Pass

## Follow-ups

- Record the installed Linphone and Windows versions before a future release
  qualification run.
- Blind transfer, attended transfer, caller identity, voicemail, and VPN remain
  optional follow-up tests and were not required for this local-LAN baseline.
- Keep the dedicated laboratory account isolated from production use.
