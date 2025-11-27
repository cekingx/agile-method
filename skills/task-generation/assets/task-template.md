# Task Tracking Template

## User Story: [Story Title]

---

### X.Y: [Task Name]

**ID**: T-X.Y | **Estimate**: [X hrs]
**Status**: To Do / In Progress / Blocked / Done
**Depends on**: [Task ID or N/A]

**What to do**:
- [ ] Step 1
- [ ] Step 2
- [ ] Step 3

**Notes**: [Blockers, decisions, or learnings]

---

### X.Y: [Task Name]

**ID**: T-X.Y | **Estimate**: [X hrs] |
**Status**: To Do / In Progress / Blocked / Done  
**Depends on**: [Task ID or N/A]

**What to do**:
- [ ] Step 1
- [ ] Step 2

**Notes**: [Blockers, decisions, or learnings]

---

## Example

### 1.1: Implement Staking Function

**ID**: T-1.1 | **Estimate**: 4 hrs
**Status**: Done
**Depends on**: N/A

**What to do**:
- [x] Define function signature
- [x] Implement balance checks and transfer logic
- [x] Add reentrancy guard and emit event
- [x] Add NatSpec comments

**Notes**: Used SafeMath, added reentrancy protection. Extra time for gas optimization.

---

### 1.2: Write Unit Tests

**ID**: T-1.2 | **Estimate**: 3 hrs
**Status**: Done
**Depends on**: T-1.1

**What to do**:
- [x] Test successful staking and edge cases
- [x] Test insufficient balance and zero amount
- [x] Test event emission and reentrancy

**Notes**: Found bug during testing (now fixed).
