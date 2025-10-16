# My Agile Method

## Overview

This is a customized Agile methodology adapted for smart contract and backend development in a non-Agile organization where requirements come from the Board of Directors (BOD) with fixed deadlines.

## Purpose

To bring structure and manageability to top-down product requirements while maintaining focus on delivering user value incrementally.

## Three-Level Hierarchy

### 1. Epic

**Definition:** A collection of related user stories that represents a larger feature or BOD initiative.

**Characteristics:**

- Originates from BOD ideas and requirements
- Too large to complete in a single sprint
- Has an associated deadline from BOD
- Represents a significant product feature or capability

**Example:**

- "Token Staking Platform"
- "Multi-signature Wallet Feature"
- "NFT Marketplace Integration"

---

### 2. User Story

**Definition:** The smallest functionality that brings value to the end user.

**Characteristics:**

- Delivers clear, tangible value to users
- Can typically be completed in 2-5 days
- Written from user perspective
- Follows the format: "As a [user type], I want [goal] so that [benefit]"

**Examples:**

- "As a token holder, I want to transfer tokens to another wallet so that I can send funds to others"
- "As a user, I want to see my token balance so that I know how many tokens I have"
- "As a staker, I want to stake my tokens so that I can earn rewards"

**Key Rule:** If a user story is complete, the user should be able to do something they couldn't do before or have a better experience.

---

### 3. Task

**Definition:** Technical work items needed to implement a user story.

**Characteristics:**

- Expected to be completed in approximately one day
- Technical in nature (not user-facing by itself)
- Represents specific implementation work
- Multiple tasks combine to complete a user story

**Examples:**

- Write smart contract function
- Create backend API endpoint
- Add unit tests
- Deploy to testnet
- Write integration tests
- Add error handling
- Update documentation

---

## Workflow

### When BOD Provides an Idea/Requirement

1. **Define the Epic**
   - Capture the BOD's idea as an Epic
   - Note the deadline
   - Clarify the overall objective

2. **Break Down into User Stories**
   - Ask: "What value does the user get?"
   - Identify all the user-facing functionalities needed
   - Write each as a user story from the user's perspective

3. **Decompose User Stories into Tasks**
   - For each user story, list all technical work needed
   - Ensure each task is sized to approximately one day
   - Include testing, deployment, and documentation tasks

4. **Estimate and Communicate**
   - Sum up task estimates to get user story estimates
   - Sum up user story estimates to get epic estimate
   - Compare total estimate against BOD deadline
   - Push back with data if deadline is unrealistic
   - Build in buffer time for code review, testing, and unexpected issues

5. **Execute and Track**
   - Work through tasks systematically
   - Mark completed tasks, user stories, and epics
   - Communicate progress regularly
   - Adjust estimates based on actual completion time

---

## Key Principles

### Focus on User Value

Every user story must deliver something meaningful to the end user. If it doesn't provide user value, it's a task, not a user story.

### Break Down Large Work

Big ideas from BOD are broken down into manageable pieces that can be estimated, tracked, and delivered incrementally.

### Maintain Visibility

Keep a visible backlog (Trello, Notion, spreadsheet) to track progress and communicate status to stakeholders.

### Build in Buffers

Always include time for:

- Code review
- Testing and bug fixes
- Unexpected complexity
- Deployment and configuration
- Documentation

### Adapt as Needed

This method is flexible. Adjust the process based on what works and what doesn't. The goal is to deliver value effectively, not to follow rules rigidly.

---

## Benefits of This Approach

- **Structure:** Brings order to top-down requirements
- **Clarity:** Clear separation between business value (user stories) and technical work (tasks)
- **Communication:** Provides a framework to discuss scope and timelines with BOD
- **Manageability:** Large projects become manageable through decomposition
- **Tracking:** Easy to track progress at multiple levels
- **Flexibility:** Can adapt to changing priorities while maintaining structure

---

## Tools and Tracking

Recommended tools for managing this workflow:

- Trello (visual kanban board)
- Notion (flexible database and documentation)
- Jira (if available, though may be overkill for solo work)
- Simple spreadsheet (lightweight and quick to set up)

**Minimum tracking needed:**

- Epic name and deadline
- List of user stories with status
- List of tasks with time estimates and status
- Actual time spent vs. estimated time (for improving future estimates)

---

## Example Structure

```text
Epic: Token Staking Platform (Deadline: 6 weeks)
│
├── User Story: As a token holder, I want to stake my tokens so that I can earn rewards
│   ├── Task: Design staking smart contract architecture
│   ├── Task: Implement staking function
│   ├── Task: Implement unstaking function
│   ├── Task: Write unit tests
│   ├── Task: Deploy to testnet
│   └── Task: Create backend API endpoints
│
├── User Story: As a staker, I want to view my staking rewards so that I know how much I've earned
│   ├── Task: Implement reward calculation logic
│   ├── Task: Create rewards query function
│   ├── Task: Build backend API for rewards
│   └── Task: Add integration tests
│
└── User Story: As a staker, I want to claim my rewards so that I can receive my earned tokens
    ├── Task: Implement claim function in smart contract
    ├── Task: Add claim validation logic
    ├── Task: Create claim API endpoint
    ├── Task: Write tests for claim functionality
    └── Task: Deploy updated contract
```

---

**Note:** This document is the result of a collaboration between myself and Claude, an AI assistant by Anthropic, to develop a practical Agile methodology tailored to my work context as a smart contract and backend developer.
