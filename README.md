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

# Generate Taiga user stories with story points from an epic
/taiga-user-story

# Create detailed GitLab issues from a user story
/gitlab-issue

# Break down a user story into implementation tasks (simpler approach)
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

> For full methodology details, see [agile-method.md](agile-method.md) (v1) and [agile-method.v2.md](agile-method.v2.md) (v2 - enhanced with Taiga/GitLab integration)

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

**3. Task** - Technical implementation work (two approaches)

**V1 (Simple)**: Personal task tracking (~1 day each)
- **NOT in PRD** - tracked separately in personal tools
- Example: "Implement staking function", "Write unit tests"

**V2 (Taiga/GitLab)**: Two-level task system
- **Taiga Tasks**: High-level implementation categories
  - Smart Contract Implementation
  - Backend Implementation
  - Frontend Implementation
- **GitLab Issues**: Detailed technical tasks with specifications (~1 day each)
  - Linked to parent Taiga tasks
  - Complete technical specs, acceptance criteria, implementation details
  - Example: "Implement stake() function with security checks"

### Key Principle: Multi-System Separation

**V1 (Simple)**: Two-system approach
- **PRD**: Epics + User Stories (what and why)
- **Tasks**: Personal tracking (how to build)

**V2 (Enhanced)**: Three-system approach
- **PRD**: Epics + User Stories (what and why)
  - Documents requirements and business value
  - For stakeholders and documentation
- **Taiga**: User Stories + High-Level Tasks (product layer + progress tracking)
  - Story points for estimation (Fibonacci: 1, 2, 3, 5, 8, 13)
  - High-level task categories (Smart Contract/Backend/Frontend)
  - Links to detailed GitLab issues
- **GitLab Issues**: Detailed technical tasks (how to implement)
  - Complete technical specifications
  - Linked back to parent Taiga user stories
  - For development work management

### Workflow

**V1 (Simple)**:
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

**V2 (Enhanced - Taiga/GitLab)**:
```
BOD Requirement
     ↓
1. Define Epic (with deadline)
     ↓
2. Break into User Stories → Use prd-generation OR taiga-user-story skill
     ↓
3. Create PRD (Epics + User Stories only)
     ↓
4. Add to Taiga → Use taiga-user-story skill
   - Add user stories with story points
   - Create high-level tasks (Smart Contract/Backend/Frontend)
     ↓
5. Decompose into GitLab Issues → Use gitlab-issue skill
   - Create detailed technical specifications
   - Link back to Taiga user stories
     ↓
6. Estimate and Communicate with BOD
     ↓
7. Execute and Track
   - Update Taiga for progress tracking
   - Work from GitLab issues for implementation
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

#### 3. **taiga-user-story**

Generates Taiga-compatible user stories with story points and high-level implementation tasks.

**When to use:**
- You have an epic or BOD requirement to break down
- You need to create user stories for Taiga
- You want to estimate using story points (relative sizing)
- You need high-level implementation task categories

**What it does:**
- Breaks down epics into user stories from user perspective
- Estimates using story points (Fibonacci: 1, 2, 3, 5, 8, 13)
- Creates high-level tasks by technology layer (Smart Contract, Backend, Frontend)
- Generates properly formatted Taiga user stories
- Adds placeholders for GitLab issue links

**Usage triggers:**
- "create user stories for..."
- "break down this epic..."
- "generate Taiga stories..."
- "estimate this feature..."

#### 4. **gitlab-issue**

Generates detailed GitLab issues with technical specifications for implementing user stories.

**When to use:**
- You have a Taiga user story needing technical breakdown
- You need detailed implementation specifications
- You want to create concrete development tasks
- You need to separate technical details from product layer

**What it does:**
- Creates separate GitLab issues for each technology layer
- Adds detailed technical specifications:
  - Smart Contract: Function signatures, events, security considerations
  - Backend: API endpoints with schemas, event listeners, database changes
  - Frontend: Components, state management, API integration
- Links each issue back to parent Taiga user story
- Provides implementation tasks and dependencies

**Usage triggers:**
- "create GitLab issues for..."
- "break down this user story into tasks..."
- "generate implementation tasks..."
- "create technical tasks for GitLab..."

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
├── agile-method.md             # Detailed methodology reference (v1)
├── agile-method.v2.md          # Enhanced methodology with Taiga/GitLab (v2)
├── template-prd.md             # PRD template
├── template-tasks.md           # Task tracking template
├── template-taiga.md           # Taiga user story template
├── template-github-issue.md    # GitLab issue template
│
├── skills/                     # Claude Code skills (source)
│   ├── prd-generation/
│   │   ├── SKILL.md           # Skill definition
│   │   ├── references/
│   │   │   └── agile-methodology.md
│   │   └── assets/
│   │       └── prd-template.md
│   ├── task-generation/
│   │   ├── SKILL.md           # Skill definition
│   │   ├── references/
│   │   │   └── task-guidelines.md
│   │   └── assets/
│   │       └── task-template.md
│   ├── taiga-user-story/
│   │   ├── SKILL.md           # Skill definition
│   │   ├── references/
│   │   │   └── agile-methodology-v2.md
│   │   └── assets/
│   │       └── taiga-template.md
│   └── gitlab-issue/
│       ├── SKILL.md           # Skill definition
│       ├── references/
│       │   └── gitlab-guidelines.md
│       └── assets/
│           └── gitlab-issue-template.md
│
├── compiled-skills/           # Compiled .skill files
│   ├── prd-generation.skill
│   ├── task-generation.skill
│   ├── taiga-user-story.skill
│   └── gitlab-issue.skill
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

Structured format for tracking implementation tasks (v1 simple approach):
- User story header with ID and estimates
- Individual tasks with:
  - Task ID (T-X.Y format)
  - Time estimates and actuals
  - Status tracking
  - Dependencies
  - Step-by-step checklist
  - Notes and learnings

### Taiga Template (`template-taiga.md`)

Structured format for Taiga user stories (v2 enhanced approach):
- User story in Taiga format
- Story points (Fibonacci: 1, 2, 3, 5, 8, 13)
- Acceptance criteria
- High-level tasks by layer:
  - Smart Contract Implementation
  - Backend Implementation
  - Frontend Implementation
- Links to detailed GitLab issues

### GitLab Issue Template (`template-github-issue.md`)

Structured format for detailed GitLab issues (v2 enhanced approach):
- Issue title and description
- Link back to parent Taiga user story
- Detailed technical specifications:
  - For Smart Contract: Function signatures, events, security considerations
  - For Backend: API endpoints with schemas, event listeners, database changes
  - For Frontend: Components, state management, API integration
- Implementation tasks with estimates
- Dependencies and blockers
- Testing requirements

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

### V1 (Simple) Example:

**User Story 1**: As a token holder, I want to stake my tokens so that I can earn rewards (3 days)
- Acceptance criteria: Can stake tokens, balance updates correctly, events emitted
- Tasks: Design architecture (4h), Implement stake function (4h), Write tests (3h), Deploy testnet (2h)

**User Story 2**: As a staker, I want to view my staking rewards so that I know how much I've earned (2 days)
- Acceptance criteria: Can query rewards, calculation is accurate, updates in real-time
- Tasks: Implement reward logic (4h), Create query function (3h), Build API (4h), Add tests (3h)

### V2 (Enhanced - Taiga/GitLab) Example:

**User Story 1**: As a token holder, I want to stake my tokens so that I can earn rewards
- **Story Points**: 5
- **Acceptance criteria**: Can stake tokens, balance updates correctly, events emitted

**Taiga Tasks**:
- Smart Contract Implementation → GitLab #101, #102, #103
- Backend Implementation → GitLab #104, #105
- Frontend Implementation → GitLab #106, #107, #108

**GitLab Issues**:
- #101: Implement stake() function with amount validation and access control (8h)
  - Function signature: `stake(uint256 amount) external`
  - Security: Check minimum stake, prevent reentrancy
  - Events: Emit `Staked(address indexed user, uint256 amount, uint256 timestamp)`
- #102: Add staking balance tracking in contract state (4h)
- #103: Write unit tests for staking logic (6h)
- #104: Create POST /api/stake endpoint with request validation (4h)
- #105: Add event listener for Staked events (3h)
- #106: Build StakeForm component with amount input (4h)
- #107: Add wallet integration for stake transaction (5h)
- #108: Display staking confirmation and transaction status (3h)

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

### V1 (Simple) Workflow:

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

### V2 (Enhanced - Taiga/GitLab) Workflow:

1. **BOD gives you a requirement** with a deadline

2. **Use prd-generation skill** to create initial PRD
   - Generates epic definition
   - Breaks into user stories
   - Creates PRD with acceptance criteria and technical specs

3. **Use taiga-user-story skill** to prepare for Taiga
   - Converts user stories to Taiga format
   - Adds story points estimation (Fibonacci: 1, 2, 3, 5, 8, 13)
   - Creates high-level tasks (Smart Contract/Backend/Frontend)
   - Adds GitLab issue placeholders

4. **Use gitlab-issue skill** for detailed technical breakdown
   - Creates separate GitLab issues for each technology layer
   - Adds complete technical specifications
   - Links back to parent Taiga user stories
   - Provides implementation tasks with estimates

5. **Sum estimates and communicate**
   - Use story points for high-level communication with BOD
   - Use detailed hour estimates for technical planning
   - Compare against deadline and adjust scope if needed

6. **Execute and track systematically**
   - Update Taiga user stories and tasks for progress visibility
   - Work from GitLab issues for detailed implementation
   - Link completed GitLab issues to Taiga tasks
   - Communicate progress using user stories (not technical details)

### Decision Guide - Which Skills to Use:

**Use prd-generation when:**
- You need initial PRD documentation
- Stakeholders need to review requirements
- You're working with standard agile (no Taiga/GitLab)

**Use taiga-user-story when:**
- You're using Taiga for project management
- You need story points for estimation
- You want product-level progress tracking
- You need to separate product layer from technical layer

**Use gitlab-issue when:**
- You have Taiga user stories to break down
- You need detailed technical specifications
- You want GitLab for development task tracking
- You need bidirectional linking between systems

**Use task-generation when:**
- You want a simpler approach without Taiga/GitLab
- You're using personal tools (Trello, Notion, etc.)
- You don't need story points or multi-system tracking
- You prefer straightforward task lists

**Use project-manager agent when:**
- You're unsure which approach to use
- The project is complex and needs strategic planning
- You need help deciding between v1 and v2 approaches
- You want comprehensive execution plans with risk assessment

---

## Attribution

This project is the result of a collaboration between myself and Claude, an AI assistant by Anthropic, to develop:
- A practical Agile methodology tailored to my work context as a smart contract and backend developer
- Claude Code tools (skills and agents) that automate and streamline the methodology

The methodology focuses on practical delivery over rigid process adherence, with emphasis on communicating effectively with non-technical stakeholders (BOD) while maintaining technical rigor.
