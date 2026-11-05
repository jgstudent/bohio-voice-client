# Customer Softphone Step 1 Acceptance

## Objective

Establish a separate, proprietary, security-first client repository without
prematurely importing a SIP SDK or implementing calling behavior.

## Accepted outputs

- separate `bohio-voice-client` repository;
- explicit separation from the Bohio Voice administrator control plane;
- Windows, macOS, Linux, Android, and iOS product targets;
- Liblinphone recorded as a preferred but unapproved SDK candidate;
- proprietary-license gate documented;
- native Android Telecom and Apple CallKit/PushKit obligations documented;
- secure enrollment and mobile push paths identified as future server work;
- Version 1 scope and deferred features documented;
- logging, credential, tenant, device-storage, and TLS boundaries documented;
  and
- no SDK, source code, binary, credential, customer data, or calling code added.

## Exit gates

Step 1 is complete only when:

1. all repository files pass a credential and private-key scan;
2. the repository is committed with a clean working tree;
3. the owner accepts the platform targets, proprietary licensing direction,
   Version 1 scope, and separate-repository boundary; and
4. no public remote is created until repository visibility and access policy
   are deliberately selected.

## Next step

Step 2 is a FreePBX interoperability laboratory using an approved existing
softphone and a dedicated non-production extension. It validates signaling,
media, codec, DTMF, hold, transfer, voicemail, caller ID, VPN, and NAT behavior
before Bohio client code is written.
