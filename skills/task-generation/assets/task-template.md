# Task Tracking Template

## User Story: [Story Title]

---

### X.Y: [Task Name]

**No**: X.Y | **Estimate**: [X hrs]
**Status**: To Do / In Progress / Blocked / Done
**Depends on**: [Task No or N/A]

**What to do**:
- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

**Implementation Notes**:
- only implementation syntax that matter
- do not include the full codebase

**Notes**: [Blockers, decisions, or learnings]

---

### X.Y: [Task Name]

**No**: X.Y | **Estimate**: [X hrs]
**Status**: To Do / In Progress / Blocked / Done
**Depends on**: [Task No or N/A]

**What to do**:
- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

**Implementation Notes**:
- only implementation syntax that matter
- do not include the full codebase

**Notes**: [Blockers, decisions, or learnings]

---

## Example

### 1.1: Implement Staking Function

**No**: 1.1 | **Estimate**: 4 hrs
**Status**: Done
**Depends on**: N/A

**What to do**:
- [x] Define function signature
- [x] Implement balance checks and transfer logic
- [x] Add reentrancy guard and emit event
- [x] Add NatSpec comments

**Implementation Notes**:
- `function checkBalance(address user) external view returns (uint256)`

**Notes**: Used SafeMath, added reentrancy protection. Extra time for gas optimization.

---

### 1.2: Write Unit Tests

**No**: 1.2 | **Estimate**: 3 hrs
**Status**: Done
**Depends on**: 1.1

**What to do**:
- [x] Test successful staking and edge cases
- [x] Test insufficient balance and zero amount
- [x] Test event emission and reentrancy

**Implementation Notes**:

**Notes**: Found bug during testing (now fixed).
