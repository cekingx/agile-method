---
name: prd-generation
description: Generate Product Requirements Documents (PRDs) following a customized Agile methodology for smart contract and blockchain development. Use this skill when the user provides a problem statement, BOD requirement, or feature request and needs it structured into epics and user stories with acceptance criteria and technical specifications. Triggers include requests like "create a PRD for", "write a requirements document", "break down this feature", or "document this requirement".
---

# PRD Generation

Generate comprehensive PRDs following a customized Agile methodology adapted for smart contract and backend development.

## When to Use This Skill

Use when user provides:
- BOD requirements or ideas
- Feature requests needing structure
- Problems that need to be broken down into epics and user stories
- Requests to create or update a PRD

## Core Methodology

Read the full methodology in [references/agile-methodology.md](references/agile-methodology.md) before generating PRDs.

**Key principles:**
- **Epics**: Large features from BOD with deadlines
- **User Stories**: Smallest functionality delivering user value (2-5 days each)
- **Format**: "As a [user type], I want [goal] so that [benefit]"
- **Critical**: PRDs contain ONLY epics and user stories, never tasks

## Generation Process

### 1. Understand the Requirement
- Clarify the BOD's objective and deadline
- Identify the problem being solved or opportunity captured
- Determine the scope and constraints

### 2. Define Epics
- Break down the requirement into major features
- Each epic should represent a significant product capability
- Note the deadline for each epic

### 3. Break Down into User Stories
Ask: "What value does the user get?"
- Write from user perspective
- Each story must deliver tangible value
- Keep stories sized to 2-5 days
- Use the format: "As a [user type], I want [goal] so that [benefit]"

**Test**: If a user story is complete, the user should be able to do something they couldn't do before.

### 4. Add Details
For each user story:
- **Acceptance Criteria**: Testable conditions (use checkboxes)
- **Technical Specifications**: Endpoints, smart contracts, database changes
- **Implementation Notes**: Technical emphasis or special considerations
- **Priority**: High/Medium/Low
- **Estimate**: Days required

### 5. Use the Template
Copy structure from [assets/prd-template.md](assets/prd-template.md) and fill it with generated content.

## Output Format

Always output as a markdown file following the PRD template structure:
1. Document Overview (goal, deadline, status)
2. Epics with descriptions and business value
3. User Stories with full details
4. Technical Implementation Summary
5. Appendix (if needed)

## Smart Contract Context

For blockchain/smart contract features, common user story patterns:
- Token operations (transfer, approve, stake, unstake)
- Viewing balances and states
- Claiming rewards or benefits
- Managing permissions
- Interacting with other protocols

Technical specifications should include:
- Smart contract functions needed
- Events to emit
- Access control requirements
- Gas optimization considerations

## Quality Checklist

Before finalizing:
- [ ] Every user story delivers clear user value
- [ ] User stories follow "As a..., I want..., so that..." format
- [ ] Acceptance criteria are testable
- [ ] Estimates are realistic (2-5 days per story)
- [ ] Technical specifications are complete
- [ ] No tasks are included (tasks belong in task tracking, not PRD)
- [ ] Epic deadlines are noted
- [ ] Business value is clearly articulated

## Example User Stories

**Good:**
- "As a token holder, I want to stake my tokens so that I can earn rewards"
- "As a user, I want to see my transaction history so that I can track my activity"

**Bad (these are tasks, not user stories):**
- "Implement staking function" (no user perspective)
- "Write unit tests" (no user value)
- "Deploy to testnet" (technical task)
