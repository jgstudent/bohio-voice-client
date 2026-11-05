# Customer Softphone Step 3 — SDK Licensing and Technology Decision

Status: **In progress — written vendor terms required**

Last reviewed: 2026-11-05

## Objective

Select a legally distributable, supportable SIP and media engine for the
closed-source Bohio Voice Client on Windows, macOS, Linux, Android, and iOS.
No SDK source, package, binary, sample, or copied implementation may enter this
repository until the licensing gate is complete.

## Verified candidate boundary

### Liblinphone

Belledonne Communications documents Liblinphone as dual licensed under GNU
Affero GPLv3 or a paid proprietary license for closed-source applications. Its
official SDK materials list Android, iOS, Windows, macOS, and Linux support and
language wrappers including C/C++, C#, Java/Kotlin, and Swift.

Official sources:

- https://www.linphone.org/en/liblinphone-voip-sdk/
- https://www.linphone.org/en/faq/
- https://wiki.linphone.org/xwiki/wiki/public/view/Lib/
- https://wiki.linphone.org/xwiki/wiki/public/view/Linphone/Third%20party%20components%20/

The proprietary agreement does not automatically replace every third-party
component obligation. The exact binary configuration, codecs, attributions,
export declarations, and excluded components must be confirmed in writing.

### PJSIP

Teluu documents PJSIP under GPL version 2 or later and an alternative
proprietary license for applications that cannot comply with GPL. PJSIP offers
SIP, SDP, RTP, media, and NAT traversal APIs across desktop and mobile targets,
but Bohio would own more platform integration and product-layer behavior.

Official sources:

- https://www.pjsip.org/licensing.htm
- https://docs.pjsip.org/en/latest/overview/license_pjsip.html
- https://docs.pjsip.org/en/latest/overview/license_3rd_party.html
- https://www.pjsip.org/

Third-party codec and library obligations remain configuration dependent and
must be reviewed independently of the PJSIP alternative license.

## Required commercial scope

Written terms must cover:

1. one closed-source Bohio Voice customer application family;
2. Windows, macOS, Linux, Android, and iOS;
3. Bohio branding and white-label distribution;
4. Microsoft Store, Apple App Store, Google Play, direct desktop downloads,
   managed enterprise distribution, and laboratory builds;
5. production, staging, QA, CI, disaster-recovery, and developer environments;
6. employees and authorized contractors;
7. redistribution of every required binary and runtime dependency;
8. security fixes, supported versions, upgrade rights, and end-of-life notice;
9. audio calling, DTMF, hold/resume, transfer, NAT traversal, TLS/SRTP, mobile
   background calling, push integration, and native OS call integration;
10. source access, symbols, crash diagnostics, and escrow or continuity terms;
11. codec, patent, export-control, attribution, privacy, and store obligations;
12. pricing model, taxes, renewal, support, usage limits, and termination rights.

## Prohibited actions during Step 3

- Do not download or add either SDK to this repository.
- Do not accept click-through terms on behalf of Bohio Systems.
- Do not publish proprietary quotes, agreements, contact details, or account
  credentials in Git.
- Do not infer that a vendor license covers a third-party codec or library.
- Do not start an application implementation that would make the choice costly
  to reverse.

## Completion gate

Step 3 completes only when:

1. written responses are received from both vendors, or a missing response is
   explicitly accepted as a documented procurement risk;
2. legal and commercial terms are retained outside Git;
3. the sanitized decision matrix is completed;
4. the preferred candidate is accepted by the owner;
5. the exact approved SDK version and permitted build configuration are
   recorded;
6. a dependency and codec review finds no unresolved distribution blocker; and
7. the final decision is committed without proprietary material or secrets.

## Next operator action

Send the inquiries in `SDK_VENDOR_INQUIRIES.md` from an authorized Bohio
Systems business address. Store replies and attachments in the approved private
business record system, not in this repository. Record only sanitized outcomes
in `SDK_DECISION_MATRIX.md`.
