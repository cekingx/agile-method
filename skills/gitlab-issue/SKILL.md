---
name: gitlab-issue
description: Generate GitLab issues with detailed technical specifications for implementing user stories. Use this skill when the user provides a Taiga user story and needs it broken down into detailed technical implementation tasks for GitLab. Triggers include requests like "create GitLab issues for", "break down this user story into tasks", "generate implementation tasks", or "create technical tasks for GitLab".
---

# GitLab Issue Generation

Generate detailed GitLab issues with technical specifications for implementing Taiga user stories, following a customized Agile methodology for smart contract and backend development.

## When to Use This Skill

Use when user provides:
- Taiga user story that needs technical breakdown
- Request to create GitLab issues or implementation tasks
- Need for detailed technical specifications
- Request to decompose high-level tasks into concrete work items

## Core Methodology

Read the full methodology in [references/agile-methodology.md](references/agile-methodology.md) before generating GitLab issues.

**Key principles:**
- **GitLab Issues**: Detailed technical tasks with full specifications
- **One Issue Per Layer**: Create separate issues for Smart Contract, Backend, and Frontend work
- **Technical Focus**: Include endpoints, function signatures, schemas, components
- **Link to Taiga**: Every GitLab issue must reference the parent Taiga user story
- **Critical**: GitLab contains detailed "how" information that Taiga does not have

## Generation Process

### 1. Understand the User Story

- Read the complete user story from Taiga
- Understand the user value being delivered
- Identify acceptance criteria
- Determine which technology layers are needed (Smart Contract, Backend, Frontend)

### 2. Identify Implementation Layers

For each user story, determine which layers need work:
- **Smart Contract**: Blockchain logic, token operations, state management
- **Backend**: APIs, event listeners, database operations, business logic
- **Frontend**: UI components, state management, API integration, user interactions

### 3. Create One Issue Per Layer

**Important**: Create **separate GitLab issues** for each technology layer, even if they're part of the same user story.

Example for "As a user, I want to stake tokens":
- GitLab Issue #101: Implement Staking Smart Contract
- GitLab Issue #102: Create Staking Backend API
- GitLab Issue #103: Build Staking Frontend UI

### 4. Add Technical Specifications

For each GitLab issue, include detailed technical requirements:

**For Smart Contract Issues:**
- Function signatures with parameters and return types
- Events to emit
- Access control requirements
- State variables needed
- Gas optimization considerations
- Security considerations (reentrancy, overflow, etc.)

**For Backend Issues:**
- API endpoints with full request/response schemas
- Database schema changes or migrations
- Event listeners needed
- Business logic specifications
- Error handling requirements

**For Frontend Issues:**
- Components to create or modify
- State management approach
- API integration details
- UI/UX requirements
- Responsive design needs
- Accessibility requirements

### 5. Add Implementation Notes

Include technical context that helps developers:
- Dependencies on other work
- Performance considerations
- Security considerations
- Third-party libraries to use
- Known gotchas or edge cases
- Architecture decisions

### 6. Create Implementation Tasks

Break down the work into concrete tasks (without time estimates):
- Design/architecture review
- Core implementation
- Error handling and validation
- Testing (unit, integration)
- Code review and fixes
- Documentation updates

### 7. Link Back to Taiga

Every GitLab issue must include:
- Link to parent Taiga user story
- Clear indication of which layer (Backend/Frontend/Smart Contract)
- Reference to the user story text for context

### 8. Use the Template

Copy structure from [assets/gitlab-issue-template.md](assets/gitlab-issue-template.md) and fill it with generated content.

## Output Format

Always output as markdown files following the GitLab issue template structure:
1. Issue header with Taiga link and layer
2. User story context (copied from Taiga)
3. Technical requirements (detailed specs)
4. Implementation notes
5. Implementation tasks checklist
6. Related issues and dependencies

## Smart Contract Specifications

When creating smart contract issues, include:

```solidity
// Function signature
function stake(uint256 amount) external returns (bool)

// Events
event Staked(address indexed user, uint256 amount, uint256 timestamp)

// Access control
modifier onlyStaker() { ... }
```

## Backend API Specifications

When creating backend issues, include:

```
POST /api/v1/stake
Request:
{
  "amount": "1000000000000000000",
  "userAddress": "0x..."
}

Response (200):
{
  "status": "success",
  "transactionHash": "0x...",
  "stakedAmount": "1000000000000000000"
}

Error (400):
{
  "status": "error",
  "message": "Insufficient balance"
}
```

## Frontend Component Specifications

When creating frontend issues, include:

```jsx
// Components needed
- StakingForm.jsx
- StakingBalance.jsx
- StakingConfirmation.jsx

// State management
- stakedAmount (number)
- isStaking (boolean)
- stakingError (string | null)

// API calls
- POST /api/v1/stake
- GET /api/v1/staking/balance
```

## Quality Checklist

Before finalizing:
- [ ] Each layer (Smart Contract/Backend/Frontend) has its own separate issue
- [ ] Every issue links back to the Taiga user story
- [ ] Technical specifications are complete and detailed
- [ ] Implementation tasks are concrete and actionable
- [ ] Dependencies and related issues are noted
- [ ] Security and performance considerations are included
- [ ] No time estimates in tasks (sizing flexibility)

## Common Patterns

### Pattern 1: Full-Stack User Story

User Story: "As a user, I want to stake tokens"

Creates 3 GitLab issues:
1. **Smart Contract Issue**: Implement staking functions
2. **Backend Issue**: Create staking API endpoints
3. **Frontend Issue**: Build staking UI

### Pattern 2: Backend-Only User Story

User Story: "As a system, I want to process rewards daily"

Creates 1 GitLab issue:
1. **Backend Issue**: Implement daily reward calculation cron job

### Pattern 3: Frontend-Only User Story

User Story: "As a user, I want to see my transaction history"

Creates 2 GitLab issues:
1. **Backend Issue**: Create transaction history API (if not exists)
2. **Frontend Issue**: Build transaction history component

## Example Structure

```
User Story: As a token holder, I want to stake my tokens

├── GitLab Issue #101: Implement Staking Smart Contract
│   - Function: stake(uint256 amount)
│   - Function: unstake(uint256 amount)
│   - Event: Staked(address, uint256)
│   - Security: Reentrancy protection
│
├── GitLab Issue #102: Create Staking Backend API
│   - POST /api/v1/stake
│   - POST /api/v1/unstake
│   - GET /api/v1/staking/balance
│   - Event listeners for staking events
│
└── GitLab Issue #103: Build Staking Frontend UI
    - StakingForm component
    - Balance display component
    - Integration with wallet
    - Error handling and loading states
```

## Relationship to Taiga

**Flow:**
1. Taiga user story created (product layer)
2. Taiga tasks created (Smart Contract/Backend/Frontend categories)
3. GitLab issues generated (detailed technical specs) ← **This skill**
4. GitLab issues linked back to Taiga tasks
5. Developers work in GitLab
6. Taiga updated when GitLab issues complete

**Separation principle**: 
- Taiga = What and Why (user value, acceptance criteria)
- GitLab = How (technical specifications, implementation details)

## Tips for Quality Issues

1. **Be Specific**: Include exact function signatures, endpoint paths, component names
2. **Include Examples**: Show request/response schemas, code snippets
3. **Note Dependencies**: Call out if one issue blocks another
4. **Security First**: Always include security considerations for contracts
5. **Think Full-Stack**: Consider how layers interact (contract → backend → frontend)
6. **Error Handling**: Specify error cases and validation requirements
