---
name: task-generation
description: Generate task breakdowns for user stories following a customized Agile methodology for smart contract and blockchain development. Use this skill when the user provides a user story and needs it broken down into concrete technical tasks (approximately 1 day each). Triggers include requests like "break down this user story into tasks", "create tasks for", "what tasks are needed", or "generate task list".
---

# Task Generation

Generate detailed task breakdowns for user stories following a customized Agile methodology for smart contract and backend development.

## When to Use This Skill

Use when user provides:
- A user story that needs task breakdown
- Request to generate implementation tasks
- Need for work breakdown structure
- Request for technical task list

## Core Principles

Read [references/task-guidelines.md](references/task-guidelines.md) for complete guidelines.

**Key principles:**
- **Size**: Each task ~1 day of work (4-8 hours)
- **Nature**: Technical implementation work
- **Separation**: Tasks are NOT in PRD, they're for personal tracking
- **Complete**: Include development, testing, documentation, deployment

## Task Generation Process

### 1. Analyze the User Story
- Understand what user value is being delivered
- Identify technical components needed
- Consider dependencies and order

### 2. Break Down by Category

**Development Tasks:**
- Design/architecture
- Core functionality implementation
- Error handling
- Input validation
- Code cleanup

**Testing Tasks:**
- Unit tests
- Integration tests
- Manual testing
- Testnet deployment and testing
- Security testing

**Documentation Tasks:**
- Code comments
- API documentation
- Technical documentation

**Deployment Tasks:**
- Environment configuration
- Deploy to testnet
- Deploy to mainnet
- Post-deployment verification

**Review Tasks:**
- Code review
- Security review
- Performance optimization

### 3. Size Appropriately
- If task > 1 day, break it down further
- Each task should have clear deliverable
- Note dependencies between tasks

### 4. Use the Template
Copy structure from [assets/task-template.md](assets/task-template.md) and fill with generated tasks.

## Output Format

Generate markdown following the task template:
- User Story header with No, estimate, status
- Each task with:
  - Number (X.Y format, e.g., 1.1, 1.2)
  - Estimate in hours
  - Status
  - Dependencies
  - What to do (checkbox list)
  - Implementation Notes (concise syntax that matters, do not include the full codebase)
  - Notes section

## Smart Contract Task Patterns

For smart contract user stories, common tasks include:
- Design contract architecture
- Implement core functions (stake, unstake, claim, etc.)
- Add access control/modifiers
- Implement events
- Add input validation
- Write unit tests
- Write integration tests
- Deploy to testnet
- Gas optimization
- Add NatSpec comments
- Security audit preparation

## Backend Task Patterns

For backend user stories, common tasks include:
- Design API endpoints
- Implement business logic
- Add input validation
- Add error handling
- Write unit tests
- Write integration tests
- Add authentication/authorization
- Update database schema
- Add logging
- Write API documentation

## Quality Checklist

Before finalizing:
- [ ] Each task is sized to ~1 day max
- [ ] Tasks cover development, testing, documentation, deployment
- [ ] Dependencies are noted
- [ ] Estimates are realistic
- [ ] Tasks are technical (not user stories)
- [ ] Checkboxes break down each task into steps

## Example Task Breakdown

**User Story**: "As a token holder, I want to stake my tokens so that I can earn rewards"

**Tasks**:

### Task: Design Staking Contract Architecture
**No**: 1.1 | **Estimate**: 4 hrs
- [ ] Define state variables needed
- [ ] Design staking/unstaking flow
- [ ] Plan reward calculation mechanism
- [ ] Identify security considerations

**Implementation Notes**:

```solidity
uint256 stakeAmount;
```

### Task: Implement Stake Function
**No**: 1.2 | **Estimate**: 4 hrs | **Depends on**: 1.1
- [ ] Create stake() function signature
- [ ] Add balance checks
- [ ] Implement token transfer logic
- [ ] Emit Staked event

**Implementation Notes**:

```solidity
function stake(uint256 amount) payable {}
function unstake(uint256 amount) {}
function rewardAmount(address user) {}

```

### Task: Write Unit Tests
**No**: 1.3 | **Estimate**: 3 hrs | **Depends on**: T-1.2
- [ ] Test successful staking
- [ ] Test insufficient balance
- [ ] Test zero amount staking
- [ ] Test event emission

## Task Numbering

Use two-level numbering: X.Y
- X = User Story number
- Y = Task number within that story
- Example: 1.1, 1.2, 1.3 (tasks for User Story 1)
