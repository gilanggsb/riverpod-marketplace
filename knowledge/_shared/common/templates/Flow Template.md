# Flow Template

status: template
tags: flow, template

## Metadata

```
title: [Flow Name]
status: proposed
tags: flow, [domain]
```

## Overview

[Describe what this flow does and when it's triggered]

## Sequence

```
Actor          System              Data
------         ------              ----
User           App                 Database
  │                │                    │
  │── action 1 ──>│                    │
  │                │── fetch ──────────>│
  │                │<── data ───────────│
  │<── result ────│                    │
  │                │                    │
```

## User Flow

1. [Step 1]
2. [Step 2]
3. [Step 3]

## Entry Point

[What triggers this flow? User action? System event?]

## Exit Point

[What happens when flow completes? What is the final state?]

## Error Handling

| Scenario | Handling |
|---|---|
| [Error 1] | [Response] |
| [Error 2] | [Response] |

## Related Flows

- `knowledge/flows/<related-flow-1>.md`
- `knowledge/flows/<related-flow-2>.md`

## Related Features

- `knowledge/features/<related-feature>.md`
