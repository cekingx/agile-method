# Task Generation Guidelines

## What are Tasks?

Tasks are technical work items needed to implement a user story. They represent the "how" of implementation.

## Task Characteristics

- **Size**: Approximately one day of work
- **Nature**: Technical implementation work (not user-facing by itself)
- **Relationship**: Multiple tasks combine to complete a user story
- **Tracking**: Kept separate from PRD in personal task management tools

## Common Task Categories

### Development Tasks
- Design/Architecture
- Implement core functionality
- Add error handling
- Add input validation
- Code cleanup/refactoring

### Testing Tasks
- Write unit tests
- Write integration tests
- Manual testing
- Test on testnet
- Security testing

### Documentation Tasks
- Code comments
- API documentation
- Technical documentation

### Deployment Tasks
- Environment configuration
- Deploy to testnet
- Deploy to mainnet
- Post-deployment verification

### Review Tasks
- Code review
- Security review
- Performance review

## Smart Contract Development Tasks

Common tasks for smart contract user stories:
- Design contract architecture
- Implement core functions
- Add access control
- Implement events
- Add input validation
- Write unit tests
- Write integration tests
- Deploy to testnet
- Security audit preparation
- Gas optimization
- Add NatSpec comments

## Backend Development Tasks

Common tasks for backend user stories:
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

## Task Breakdown Principles

1. **One day max**: If a task takes more than one day, break it down further
2. **Clear deliverable**: Each task should have a clear output
3. **Dependencies**: Note which tasks depend on others
4. **Testable**: Include testing as separate tasks
5. **Complete**: Don't forget documentation, deployment, and review tasks

## Example Breakdown

**User Story**: "As a token holder, I want to stake my tokens so that I can earn rewards"

**Tasks**:
1. Design staking smart contract architecture (4 hrs)
2. Implement stake() function (4 hrs)
3. Implement unstake() function (4 hrs)
4. Implement reward calculation logic (6 hrs)
5. Write unit tests for staking (3 hrs)
6. Write integration tests (3 hrs)
7. Deploy to testnet (2 hrs)
8. Add NatSpec documentation (2 hrs)
9. Gas optimization review (3 hrs)
10. Create backend API endpoints (4 hrs)

Total estimate: ~35 hours (~4.5 days)
