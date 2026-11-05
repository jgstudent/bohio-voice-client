# SIP SDK Decision Matrix

Status: **Awaiting written vendor responses**

Do not enter prices, agreement text, personal contact information, or other
vendor-confidential material here. Store those records outside Git and enter
only Pass, Fail, Conditional, Unknown, or a brief sanitized conclusion.

## Mandatory gates

Any `Fail` in this table disqualifies a candidate until resolved in writing.

| Gate | Liblinphone | PJSIP |
|---|---|---|
| Closed-source proprietary distribution | Vendor response required | Vendor response required |
| Windows, macOS, Linux, Android, and iOS covered | Vendor response required | Vendor response required |
| Bohio white-label branding permitted | Vendor response required | Vendor response required |
| Required stores and direct distribution covered | Vendor response required | Vendor response required |
| CI, contractors, QA, backups, and symbols covered | Vendor response required | Vendor response required |
| Required binary/source redistribution covered | Vendor response required | Vendor response required |
| Third-party dependency inventory acceptable | Unknown | Unknown |
| Codec and patent obligations acceptable | Unknown | Unknown |
| Security maintenance and EOL terms acceptable | Unknown | Unknown |
| Mobile push and native call integration viable | Unknown | Unknown |
| No unresolved GPL/AGPL distribution obligation | Unknown | Unknown |

## Engineering comparison

| Area | Liblinphone | PJSIP |
|---|---|---|
| API level | Higher-level calling SDK | Lower-level SIP/media framework |
| Officially described platform reach | Five target platforms listed | Portable across the five target platforms |
| Language surface | C/C++, C#, Java/Kotlin, Swift, others | C/C++ with PJSUA/PJSUA2 bindings |
| Proven Bohio lab compatibility | Official Linphone client passed the FreePBX baseline | Not tested in the Bohio lab |
| Mobile product integration | Vendor capabilities and terms must be confirmed | More Bohio-owned native integration expected |
| Desktop strategy | Candidate for a shared product family | Candidate, but wrapper/UI effort must be estimated |
| Third-party review | Required; vendor identifies exclusions | Required; configuration-dependent libraries/codecs |
| Current preference | Preferred, pending acceptable written terms | Fallback, pending terms and technical spike |

## Commercial outcome

| Field | Liblinphone | PJSIP |
|---|---|---|
| Inquiry sent date | Not sent | Not sent |
| Response received date | Not received | Not received |
| Written scope complete | No | No |
| Commercial terms acceptable | Unknown | Unknown |
| Support terms acceptable | Unknown | Unknown |
| Owner decision | Pending | Pending |

## Decision record

- Selected engine: Pending
- Approved SDK version: Pending
- Approved build profile/codecs: Pending
- Decision date: Pending
- Accepted by: Pending
- Sanitized rationale: Pending
