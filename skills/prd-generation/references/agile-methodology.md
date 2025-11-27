# My Agile Method

## Overview

This is a customized Agile methodology adapted for smart contract and backend development in a non-Agile organization where requirements come from the Board of Directors (BOD) with fixed deadlines.

## Three-Level Hierarchy

### 1. Epic

**Definition:** A collection of related user stories that represents a larger feature or BOD initiative.

**Characteristics:**
- Originates from BOD ideas and requirements
- Too large to complete in a single sprint
- Has an associated deadline from BOD
- Represents a significant product feature or capability

**Examples:** "Token Staking Platform", "Multi-signature Wallet Feature", "NFT Marketplace Integration"

### 2. User Story

**Definition:** The smallest functionality that brings value to the end user.

**Characteristics:**
- Delivers clear, tangible value to users
- Can typically be completed in 2-5 days
- Written from user perspective
- Follows the format: "As a [user type], I want [goal] so that [benefit]"

**Key Rule:** If a user story is complete, the user should be able to do something they couldn't do before or have a better experience.

**Examples:**
- "As a token holder, I want to transfer tokens to another wallet so that I can send funds to others"
- "As a user, I want to see my token balance so that I know how many tokens I have"
- "As a staker, I want to stake my tokens so that I can earn rewards"

### 3. Task

**Definition:** Technical work items needed to implement a user story.

**Characteristics:**
- Expected to be completed in approximately one day
- Technical in nature (not user-facing by itself)
- Represents specific implementation work
- Multiple tasks combine to complete a user story

**Examples:** Write smart contract function, Create backend API endpoint, Add unit tests, Deploy to testnet, Write integration tests, Add error handling, Update documentation

## PRD and Task Separation

**Critical:** The Product Requirements Document (PRD) should only include **Epics** and **User Stories**. Tasks are implementation details and should be tracked separately.

**Why this separation?**
- PRD focuses on **what** needs to be built and **why** (business value and user perspective)
- Tasks focus on **how** to build it (technical implementation)
- PRD is for stakeholders and documentation
- Tasks are for personal work management

## Key Principles

### Focus on User Value
Every user story must deliver something meaningful to the end user. If it doesn't provide user value, it's a task, not a user story.

### Break Down Large Work
Big ideas from BOD are broken down into manageable pieces that can be estimated, tracked, and delivered incrementally.

### Build in Buffers
Always include time for: code review, testing and bug fixes, unexpected complexity, deployment and configuration, documentation.

## Example Structure

```
Epic: Token Staking Platform (Deadline: 6 weeks)
│
├── User Story: As a token holder, I want to stake my tokens so that I can earn rewards
│   ├── Task: Design staking smart contract architecture
│   ├── Task: Implement staking function
│   └── Task: Write unit tests
│
├── User Story: As a staker, I want to view my staking rewards so that I know how much I've earned
│   ├── Task: Implement reward calculation logic
│   └── Task: Create rewards query function
│
└── User Story: As a staker, I want to claim my rewards so that I can receive my earned tokens
    ├── Task: Implement claim function in smart contract
    └── Task: Create claim API endpoint
```
