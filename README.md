# My Agile Method & Claude Code Tools

## Overview

This repository is a **personal documentation and tooling project** that combines:

1. **A customized Agile methodology** adapted for smart contract and blockchain development in non-Agile organizations with fixed BOD deadlines
2. **Claude Code tools** (skills and agents) that automate and streamline the methodology

What started as simple methodology documentation has evolved into a comprehensive toolkit that helps transform BOD requirements into structured PRDs and task breakdowns using AI-powered automation.

---

## Quick Start

### Using the Skills

With Claude Code, you can use these skills to automate your workflow:

```bash
# Generate a PRD from BOD requirements
/prd-generation

# Break down a user story into implementation tasks
/task-generation
```

### Using the Project Manager Agent

For complex planning and strategic project management:

```bash
# The project-manager agent will intelligently decide which skills to use
# and help you create comprehensive execution plans
```

The agent will:
- Analyze your requirements
- Ask clarifying questions
- Recommend whether to generate a PRD, task breakdown, or both
- Ask for your confirmation before generating any artifacts
- Create phased execution roadmaps with risk assessment

---

## The Agile Methodology

> For full methodology details, see [agile-method.md](agile-method.md)

### Three-Level Hierarchy

**1. Epic** - Large features from BOD with deadlines
- Originates from BOD ideas and requirements
- Too large to complete in a single sprint
- Example: "Token Staking Platform", "NFT Marketplace Integration"

**2. User Story** - Smallest functionality delivering user value (2-5 days)
- Written from user perspective: "As a [user type], I want [goal] so that [benefit]"
- Delivers clear, tangible value to users
- **Goes in PRD**
- Example: "As a token holder, I want to stake my tokens so that I can earn rewards"

**3. Task** - Technical implementation work (~1 day each)
- Technical in nature, not user-facing by itself
- Multiple tasks combine to complete a user story
- **NOT in PRD** - tracked separately in personal tools
- Example: "Implement staking function", "Write unit tests"

### Key Principle: PRD and Task Separation

**PRD** (Product Requirements Document):
- Contains ONLY Epics and User Stories
- Focuses on **what** needs to be built and **why**
- For stakeholders and documentation

**Tasks**:
- Tracked separately in your personal tool (Trello, Notion, etc.)
- Focus on **how** to build it
- For personal work management

### Workflow

```
BOD Requirement
     ↓
1. Define Epic (with deadline)
     ↓
2. Break into User Stories → Use prd-generation skill
     ↓
3. Create PRD (Epics + User Stories only)
     ↓
4. Decompose into Tasks → Use task-generation skill
     ↓
5. Estimate and Communicate with BOD
     ↓
6. Execute and Track
```

---

## Claude Code Tools

### Skills

#### 1. **prd-generation**

Generates comprehensive PRDs following the methodology.

**When to use:**
- You have a BOD requirement or feature request
- You need to structure requirements into epics and user stories
- You want to document what needs to be built and why

**What it does:**
- Breaks down requirements into epics
- Creates user stories from user perspective
- Adds acceptance criteria and technical specifications
- Generates properly formatted PRD documents

**Usage triggers:**
- "create a PRD for..."
- "write a requirements document for..."
- "break down this feature..."
- "document this requirement..."

#### 2. **task-generation**

Breaks down user stories into concrete technical tasks.

**When to use:**
- You have a user story that needs implementation planning
- You need to create a work breakdown structure
- You want to estimate implementation effort

**What it does:**
- Analyzes user stories to identify technical components
- Creates ~1 day tasks for development, testing, documentation, deployment
- Adds task dependencies and estimates
- Generates properly formatted task tracking documents

**Usage triggers:**
- "break down this user story into tasks..."
- "create tasks for..."
- "what tasks are needed..."
- "generate task list..."

### Agent

#### **project-manager**

An elite strategic planning agent for complex project management.

**When to use:**
- You need to plan how to execute a solution
- You have a complex initiative to break down
- You're unsure which skill to use or need both
- You need risk assessment and phased execution plans

**What it does:**
- Analyzes problems and scopes requirements
- Asks clarifying questions
- Decides which skill(s) to use (PRD, tasks, or both)
- Creates phased execution roadmaps
- Assesses risks and provides mitigation strategies
- Generates comprehensive project plans

**Decision framework:**
- Vague requirements → Uses prd-generation first
- Clear requirements needing breakdown → Uses task-generation
- Complex projects → Uses both skills sequentially
- Simple problems → Provides plan directly

---

## Project Structure

```
agile-method/
├── README.md                    # This file - overview and tool documentation
├── agile-method.md             # Detailed methodology reference
├── template-prd.md             # PRD template
├── template-tasks.md           # Task tracking template
│
├── skills/                     # Claude Code skills (source)
│   ├── prd-generation/
│   │   ├── SKILL.md           # Skill definition
│   │   ├── references/
│   │   │   └── agile-methodology.md
│   │   └── assets/
│   │       └── prd-template.md
│   └── task-generation/
│       ├── SKILL.md           # Skill definition
│       ├── references/
│       │   └── task-guidelines.md
│       └── assets/
│           └── task-template.md
│
├── compiled-skills/           # Compiled .skill files
│   ├── prd-generation.skill
│   └── task-generation.skill
│
├── agents/                    # Claude Code agents
│   └── project-manager.md
│
└── .claude/                   # Claude Code configuration
    ├── agents/                # Symlinked to ../agents
    └── skills/                # Symlinked to ../compiled-skills
```

### Key Directories

- **skills/**: Source files for Claude Code skills with references and templates
- **compiled-skills/**: Compiled .skill files ready for Claude Code to use
- **agents/**: Agent definitions for strategic planning
- **templates/**: PRD and task tracking templates
- **.claude/**: Configuration directory with symlinks to skills and agents

---

## Building Skills

Skills need to be compiled into `.skill` files (zip archives) before Claude Code can use them.

### Build All Skills

```bash
cd skills
./build-all.sh
```

This will:
- Automatically detect all skill directories
- Compile each skill into a `.skill` file
- Move compiled files to `compiled-skills/`
- Display build progress and summary

### Build Specific Skill

```bash
cd skills
./build-all.sh prd-generation
```

Build only a single skill instead of all skills.

### Clean and Rebuild

```bash
cd skills
./build-all.sh --clean
```

Removes all existing `.skill` files and rebuilds everything from scratch.

### Adding New Skills

When you create a new skill:

1. Create the skill directory structure in `skills/`:
   ```
   skills/your-new-skill/
   ├── SKILL.md
   ├── references/
   └── assets/
   ```

2. Run the build script:
   ```bash
   cd skills
   ./build-all.sh
   ```

The new skill will be automatically detected and compiled. No need to create a separate build script!

### Troubleshooting

**Build fails with "zip: command not found"**
- Install zip: `sudo apt-get install zip` (Ubuntu/Debian) or `brew install zip` (macOS)

**Permission denied when running script**
- Make the script executable: `chmod +x build-all.sh`

---

## Templates

### PRD Template (`template-prd.md`)

Structured format for documenting epics and user stories:
- Document overview (goal, deadline, status)
- Epic descriptions with business value
- User stories with:
  - "As a..., I want..., so that..." format
  - Acceptance criteria (testable conditions)
  - Technical specifications (endpoints, smart contracts, database)
  - Priority and estimates

### Task Template (`template-tasks.md`)

Structured format for tracking implementation tasks:
- User story header with ID and estimates
- Individual tasks with:
  - Task ID (T-X.Y format)
  - Time estimates and actuals
  - Status tracking
  - Dependencies
  - Step-by-step checklist
  - Notes and learnings

---

## Smart Contract Development Focus

The methodology and tools are specifically tailored for blockchain development:

**Common User Story Patterns:**
- Token operations (transfer, stake, unstake, claim)
- Viewing balances and states
- Managing permissions
- Interacting with other protocols

**Common Task Patterns:**
- Design smart contract architecture
- Implement core functions with access control
- Add input validation and error handling
- Write unit and integration tests
- Deploy to testnet/mainnet
- Gas optimization
- Add NatSpec comments
- Security audit preparation

---

## Key Benefits

1. **Structure** - Brings order to top-down BOD requirements
2. **Automation** - AI-powered tools generate PRDs and task breakdowns
3. **Clarity** - Clear separation between business value (user stories) and technical work (tasks)
4. **Communication** - Framework for discussing scope and timelines with non-technical stakeholders
5. **Manageability** - Large projects become manageable through systematic decomposition
6. **Tracking** - Easy progress tracking at multiple levels (epic → story → task)
7. **Flexibility** - Adaptable to changing priorities while maintaining structure

---

## Example: Token Staking Platform

**Epic**: Token Staking Platform (Deadline: 6 weeks)

**User Story 1**: As a token holder, I want to stake my tokens so that I can earn rewards (3 days)
- Acceptance criteria: Can stake tokens, balance updates correctly, events emitted
- Tasks: Design architecture (4h), Implement stake function (4h), Write tests (3h), Deploy testnet (2h)

**User Story 2**: As a staker, I want to view my staking rewards so that I know how much I've earned (2 days)
- Acceptance criteria: Can query rewards, calculation is accurate, updates in real-time
- Tasks: Implement reward logic (4h), Create query function (3h), Build API (4h), Add tests (3h)

**User Story 3**: As a staker, I want to claim my rewards so that I can receive my earned tokens (2 days)
- Acceptance criteria: Can claim rewards, tokens transfer correctly, cannot claim twice
- Tasks: Implement claim function (4h), Add validation (3h), Create API (3h), Write tests (3h), Deploy (2h)

---

## Quality Checklist

### For PRDs (via prd-generation skill)
- Every user story delivers clear user value
- Stories follow "As a..., I want..., so that..." format
- Acceptance criteria are testable
- Technical specifications are complete
- NO tasks in PRD (tasks tracked separately)

### For Tasks (via task-generation skill)
- Each task sized to ~1 day max
- Cover development, testing, documentation, deployment
- Dependencies clearly noted
- Estimates are realistic
- Technical focus (implementation details)

---

## How It Works Together

1. **BOD gives you a requirement** with a deadline

2. **Use prd-generation skill** (or project-manager agent)
   - Generates epic definition
   - Breaks into user stories
   - Creates PRD with acceptance criteria and technical specs

3. **Use task-generation skill** for each user story
   - Breaks user stories into ~1 day tasks
   - Includes development, testing, deployment tasks
   - Adds estimates and dependencies

4. **Sum estimates and communicate**
   - Compare against BOD deadline
   - Push back with data if unrealistic
   - Build in buffers for code review and testing

5. **Execute systematically**
   - Track tasks in your personal tool
   - Communicate progress using user stories (not tasks)
   - Adjust estimates based on actuals

---

## Attribution

This project is the result of a collaboration between myself and Claude, an AI assistant by Anthropic, to develop:
- A practical Agile methodology tailored to my work context as a smart contract and backend developer
- Claude Code tools (skills and agents) that automate and streamline the methodology

The methodology focuses on practical delivery over rigid process adherence, with emphasis on communicating effectively with non-technical stakeholders (BOD) while maintaining technical rigor.
