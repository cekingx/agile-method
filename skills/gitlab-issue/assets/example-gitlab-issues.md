# Example GitLab Issues

These examples show how to break down a single Taiga user story into multiple GitLab issues by technology layer.

---

## Taiga User Story (Context)

**User Story**: As a token holder, I want to stake my tokens so that I can earn rewards

**Priority**: High  
**Estimate**: 5 story points

**Acceptance Criteria:**
- [ ] User can connect their wallet to the staking platform
- [ ] User can input the amount of tokens they want to stake
- [ ] User receives clear confirmation message after successful staking
- [ ] User's available token balance decreases by staked amount
- [ ] User's staked balance updates immediately in the UI
- [ ] User cannot stake more tokens than they own
- [ ] User sees estimated rewards rate before confirming stake

---

## GitLab Issue #101: Implement Staking Smart Contract

**Implements**: [Taiga User Story #45 - Stake Tokens]  
**Layer**: Smart Contract  
**Estimate**: 3 days  
**Assignee**: [Developer name]

---

### User Story Context

**As a** token holder  
**I want to** stake my tokens  
**So that** I can earn rewards and participate in the protocol

---

### Technical Requirements

#### Smart Contract Functions

**Function**: `stake(uint256 amount) external returns (bool)`
- **Description**: Allows users to stake tokens and begin earning rewards
- **Parameters**: 
  - `amount`: Amount of tokens to stake (in wei)
- **Returns**: `true` on success
- **Access Control**: Public, any token holder can call
- **State Changes**:
  - Transfer tokens from user to contract
  - Update `stakedBalance[msg.sender]`
  - Update `stakingStartTime[msg.sender]`
  - Update `totalStaked`
- **Events Emitted**: 
  - `Staked(address indexed user, uint256 amount, uint256 timestamp)`

**Function**: `getStakedBalance(address user) external view returns (uint256)`
- **Description**: Returns the staked balance for a given user
- **Parameters**:
  - `user`: Address to query
- **Returns**: Staked balance in wei

**Function**: `getMinimumStake() external view returns (uint256)`
- **Description**: Returns the minimum stake amount allowed
- **Returns**: Minimum stake in wei

---

#### State Variables

```solidity
// Mapping of user address to staked amount
mapping(address => uint256) public stakedBalance;

// Mapping of user address to staking start time
mapping(address => uint256) public stakingStartTime;

// Total amount staked in the contract
uint256 public totalStaked;

// Minimum stake amount (e.g., 100 tokens)
uint256 public minimumStake;

// Reference to the ERC20 token contract
IERC20 public stakingToken;
```

---

#### Events

```solidity
event Staked(address indexed user, uint256 amount, uint256 timestamp);
event MinimumStakeUpdated(uint256 oldMinimum, uint256 newMinimum);
```

---

#### Security Considerations

- **Reentrancy Protection**: Use `nonReentrant` modifier or checks-effects-interactions pattern
- **Integer Overflow**: Use SafeMath or Solidity 0.8+ built-in overflow checks
- **Access Control**: Ensure only token holders can stake
- **Validation**: Check amount > 0 and amount >= minimumStake
- **Token Approval**: User must approve contract before staking

---

#### Gas Optimization Notes

- Use `uint256` instead of smaller types (no gas savings from packing)
- Batch state updates where possible
- Consider using unchecked arithmetic where overflow is impossible
- Emit events after all state changes

---

### Implementation Notes

- Follow EIP-20 token standard for interactions
- Consider implementing emergency withdraw function
- Add pause functionality for upgrades or emergencies
- Use OpenZeppelin's `SafeERC20` for token transfers
- Ensure contract can receive tokens (if using transferFrom)
- Consider implementing a cooldown period if needed

---

### Implementation Tasks

- [ ] Design contract architecture and state variables
- [ ] Implement stake function with validation
- [ ] Implement balance query functions
- [ ] Add event emissions
- [ ] Implement reentrancy protection
- [ ] Add access control and modifiers
- [ ] Write comprehensive unit tests
- [ ] Test edge cases (zero amount, insufficient balance, etc.)
- [ ] Run gas optimization analysis
- [ ] Security audit preparation
- [ ] Deploy to testnet for integration testing

---

### Related Issues

- Blocks: #102 (Backend needs contract deployed)
- Blocks: #103 (Frontend needs contract ABI)
- Related to: #106 (Unstake function)

---

### Definition of Done

- [ ] Code implemented according to specifications
- [ ] All tests passing (unit + integration)
- [ ] Code reviewed and approved
- [ ] Security considerations addressed
- [ ] Gas optimization completed
- [ ] Deployed to testnet
- [ ] Contract verified on block explorer

---

## GitLab Issue #102: Create Staking Backend API

**Implements**: [Taiga User Story #45 - Stake Tokens]  
**Layer**: Backend  
**Estimate**: 2 days  
**Assignee**: [Developer name]

---

### User Story Context

**As a** token holder  
**I want to** stake my tokens  
**So that** I can earn rewards and participate in the protocol

---

### Technical Requirements

#### Endpoints

**POST** `/api/v1/staking/stake`
- **Description**: Initiates a staking transaction
- **Authentication**: Required (JWT token)
- **Request**:
  ```json
  {
    "amount": "1000000000000000000",
    "userAddress": "0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb"
  }
  ```
- **Response (200)**:
  ```json
  {
    "status": "success",
    "transactionHash": "0x...",
    "amount": "1000000000000000000",
    "timestamp": 1642589432,
    "estimatedGas": "150000"
  }
  ```
- **Error (400 - Validation)**:
  ```json
  {
    "status": "error",
    "code": "INVALID_AMOUNT",
    "message": "Amount must be greater than minimum stake"
  }
  ```
- **Error (401)**:
  ```json
  {
    "status": "error",
    "code": "UNAUTHORIZED",
    "message": "Invalid or missing authentication token"
  }
  ```

**GET** `/api/v1/staking/balance/:address`
- **Description**: Returns staking balance for a user
- **Parameters**:
  - `address`: Ethereum address (path parameter)
- **Response (200)**:
  ```json
  {
    "address": "0x742d35Cc6634C0532925a3b844Bc9e7595f0bEb",
    "stakedBalance": "1000000000000000000",
    "stakingStartTime": 1642589432,
    "estimatedRewards": "50000000000000000"
  }
  ```

**GET** `/api/v1/staking/config`
- **Description**: Returns staking configuration
- **Response (200)**:
  ```json
  {
    "minimumStake": "100000000000000000000",
    "contractAddress": "0x...",
    "rewardRate": "0.05",
    "totalStaked": "50000000000000000000000"
  }
  ```

---

#### Database Changes

**New Table**: `staking_transactions`
```sql
CREATE TABLE staking_transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_address VARCHAR(42) NOT NULL,
  transaction_hash VARCHAR(66) NOT NULL UNIQUE,
  amount NUMERIC(78, 0) NOT NULL,
  transaction_type VARCHAR(20) NOT NULL, -- 'stake' or 'unstake'
  status VARCHAR(20) NOT NULL, -- 'pending', 'confirmed', 'failed'
  block_number BIGINT,
  gas_used BIGINT,
  created_at TIMESTAMP DEFAULT NOW(),
  confirmed_at TIMESTAMP,
  CONSTRAINT valid_address CHECK (user_address ~ '^0x[a-fA-F0-9]{40}$'),
  CONSTRAINT valid_tx_hash CHECK (transaction_hash ~ '^0x[a-fA-F0-9]{64}$')
);

CREATE INDEX idx_staking_user_address ON staking_transactions(user_address);
CREATE INDEX idx_staking_tx_hash ON staking_transactions(transaction_hash);
CREATE INDEX idx_staking_created_at ON staking_transactions(created_at DESC);
```

**Migration**: Create migration file for adding staking_transactions table

---

#### Event Listeners

**Listen for**: `Staked` event from smart contract
- **Purpose**: Update database when staking transactions are confirmed on-chain
- **Logic**:
  1. Parse event data (user address, amount, timestamp)
  2. Update transaction status to 'confirmed'
  3. Store block number and gas used
  4. Update user's cached staked balance
  5. Trigger any reward calculation updates

---

### Implementation Notes

- Use Web3.js or Ethers.js for blockchain interaction
- Implement transaction queue for handling high volume
- Add rate limiting (e.g., max 10 requests per minute per user)
- Cache staking balances with 30-second TTL
- Implement webhook for frontend notifications
- Use environment variables for contract address and RPC endpoint
- Add comprehensive error logging
- Implement transaction retry logic for failed submissions
- Consider using WebSocket for real-time event updates

---

### Implementation Tasks

- [ ] Set up API route handlers
- [ ] Implement staking transaction endpoint
- [ ] Implement balance query endpoint
- [ ] Implement config endpoint
- [ ] Create database migration
- [ ] Set up blockchain event listeners
- [ ] Add transaction status tracking
- [ ] Implement caching layer
- [ ] Add authentication middleware
- [ ] Add validation middleware
- [ ] Implement error handling
- [ ] Add logging and monitoring
- [ ] Write API integration tests
- [ ] Test with testnet contract
- [ ] API documentation (OpenAPI/Swagger)

---

### Related Issues

- Depends on: #101 (Smart contract must be deployed)
- Blocks: #103 (Frontend needs API endpoints)
- Related to: #105 (Event listener infrastructure)

---

### Definition of Done

- [ ] All endpoints implemented and tested
- [ ] Database migration created and tested
- [ ] Event listeners working correctly
- [ ] Authentication and validation in place
- [ ] Error handling comprehensive
- [ ] API documentation complete
- [ ] Integration tests passing
- [ ] Deployed to staging environment
- [ ] Load testing completed

---

## GitLab Issue #103: Build Staking Frontend UI

**Implements**: [Taiga User Story #45 - Stake Tokens]  
**Layer**: Frontend  
**Estimate**: 3 days  
**Assignee**: [Developer name]

---

### User Story Context

**As a** token holder  
**I want to** stake my tokens  
**So that** I can earn rewards and participate in the protocol

---

### Technical Requirements

#### Components to Create

**Component**: `StakingForm.jsx`
- **Purpose**: Main form for staking tokens
- **Props**: 
  - `userAddress`: string (Ethereum address)
  - `tokenBalance`: BigNumber
  - `onStakeSuccess`: () => void
- **State**:
  - `stakeAmount`: string
  - `isStaking`: boolean
  - `estimatedRewards`: string
  - `error`: string | null
- **Features**:
  - Input field for stake amount with validation
  - "Max" button to stake all available tokens
  - Display estimated APY/rewards
  - Approval step if needed (if tokens not approved)
  - Confirmation modal before submitting
  - Transaction status indicator

**Component**: `StakingBalance.jsx`
- **Purpose**: Display user's staked balance and rewards
- **Props**:
  - `userAddress`: string
- **State**:
  - `stakedBalance`: BigNumber
  - `estimatedRewards`: BigNumber
  - `isLoading`: boolean
- **Features**:
  - Real-time balance updates
  - Estimated rewards calculation
  - Staking duration display
  - APY/APR indicator

**Component**: `StakingConfirmationModal.jsx`
- **Purpose**: Confirmation dialog before staking
- **Props**:
  - `amount`: string
  - `estimatedRewards`: string
  - `onConfirm`: () => void
  - `onCancel`: () => void
  - `isOpen`: boolean
- **Features**:
  - Summary of staking details
  - Gas estimate
  - Terms acceptance checkbox
  - Confirm/Cancel buttons

---

#### State Management

**Global State** (Redux/Zustand/Context):
```typescript
interface StakingState {
  // User data
  stakedBalance: BigNumber | null;
  availableBalance: BigNumber | null;
  stakingStartTime: number | null;
  
  // Configuration
  minimumStake: BigNumber;
  rewardRate: number;
  contractAddress: string;
  
  // UI state
  isStaking: boolean;
  isLoading: boolean;
  error: string | null;
  
  // Actions
  fetchStakingData: (address: string) => Promise<void>;
  stake: (amount: BigNumber) => Promise<void>;
  clearError: () => void;
}
```

---

#### API Integration

**Endpoints to integrate**:
- `POST /api/v1/staking/stake` - Submit staking transaction
- `GET /api/v1/staking/balance/:address` - Fetch user balance
- `GET /api/v1/staking/config` - Get staking configuration

**Error Handling**:
- Network errors → Show "Connection lost" message
- Validation errors → Show inline field errors
- Transaction failures → Show detailed error with retry option
- Insufficient balance → Disable submit, show warning

---

#### Web3 Integration

**Wallet Connection**:
- Use WalletConnect or MetaMask
- Handle wallet switching
- Handle network switching (ensure correct chain)

**Contract Interaction**:
- Check token approval before staking
- Request approval if needed (separate transaction)
- Call stake function with user-provided amount
- Listen for transaction confirmation
- Update UI on success/failure

---

#### UI/UX Requirements

**Design**:
- Mobile-first responsive design
- Match existing app design system
- Use Tailwind CSS for styling
- Shadcn/UI components for modals and inputs

**Responsiveness**:
- Mobile (< 768px): Stacked layout
- Tablet (768px - 1024px): 2-column layout
- Desktop (> 1024px): 3-column layout

**Loading States**:
- Skeleton loaders for balance data
- Spinner during transaction submission
- Progress indicator for multi-step process (approve → stake)

**Accessibility**:
- ARIA labels for all interactive elements
- Keyboard navigation support
- Screen reader friendly error messages
- Focus management in modals

---

### Implementation Notes

- Use BigNumber.js or ethers.BigNumber for token amounts
- Format large numbers with commas (e.g., "1,000,000")
- Display token amounts in human-readable format (not wei)
- Implement optimistic UI updates (update UI immediately, rollback on error)
- Add transaction hash link to block explorer
- Consider adding notification system (toast messages)
- Implement form validation (minimum stake, max balance, etc.)
- Add analytics tracking for user actions
- Consider implementing a tutorial/guide for first-time stakers

**Third-party libraries**:
- ethers.js or web3.js for blockchain interaction
- react-hook-form for form management
- react-query for API data fetching
- zustand or redux for state management
- react-hot-toast for notifications

---

### Implementation Tasks

- [ ] Set up component structure
- [ ] Implement StakingForm component
- [ ] Implement StakingBalance component
- [ ] Implement confirmation modal
- [ ] Set up state management
- [ ] Integrate with backend API
- [ ] Integrate with Web3 wallet
- [ ] Implement token approval flow
- [ ] Add form validation
- [ ] Implement error handling
- [ ] Add loading states
- [ ] Style components (responsive design)
- [ ] Add accessibility features
- [ ] Write component tests
- [ ] Integration testing with testnet
- [ ] Cross-browser testing

---

### Related Issues

- Depends on: #101 (Needs contract ABI)
- Depends on: #102 (Needs backend API)
- Related to: #104 (Wallet connection component)

---

### Definition of Done

- [ ] All components implemented and functional
- [ ] Responsive design working on all breakpoints
- [ ] API integration complete and tested
- [ ] Web3 integration working with test wallets
- [ ] Form validation comprehensive
- [ ] Error handling complete
- [ ] Accessibility requirements met
- [ ] Component tests passing
- [ ] Code reviewed and approved
- [ ] Deployed to staging
- [ ] UX/UI review completed
