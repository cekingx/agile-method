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

## Implementation: Stake Tokens

**Layer**: Smart Contract

---

## User Story Context

**As a** token holder
**I want to** stake my tokens
**So that** I can earn rewards and participate in the protocol

---

## Technical Requirements

### Smart Contract

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
- **Access Control**: Public view function
- **Events Emitted**:
  - `Staked(address indexed user, uint256 amount, uint256 timestamp)`
  - `MinimumStakeUpdated(uint256 oldMinimum, uint256 newMinimum)`
- **Gas Optimization Notes**:
  - Use `uint256` instead of smaller types
  - Batch state updates where possible
  - Emit events after all state changes
- **Security Considerations**:
  - Reentrancy protection required
  - Validate amount > 0 and amount >= minimumStake
  - User must approve contract before staking
  - Use SafeMath or Solidity 0.8+ overflow checks

---

## Implementation Notes

- Follow EIP-20 token standard for interactions
- Use OpenZeppelin's `SafeERC20` for token transfers
- Consider implementing emergency withdraw function
- Add pause functionality for upgrades or emergencies
- Ensure contract can receive tokens (if using transferFrom)
- Implement cooldown period if needed for tokenomics

---

## Implementation Tasks

- [ ] Design contract architecture and state variables
- [ ] Implement stake function with validation
- [ ] Implement balance query functions
- [ ] Add event emissions and reentrancy protection
- [ ] Add access control and modifiers
- [ ] Write comprehensive unit tests
- [ ] Test edge cases (zero amount, insufficient balance, etc.)
- [ ] Run gas optimization analysis
- [ ] Security audit preparation
- [ ] Deploy to testnet
- [ ] Update documentation

---

## Definition of Done

- [ ] Code implemented according to specifications
- [ ] All tests passing
- [ ] Code reviewed and approved
- [ ] Documentation updated
- [ ] Merged to main branch
- [ ] Deployed to staging
- [ ] QA verified

---

## Implementation: Stake Tokens

**Layer**: Backend

---

## User Story Context

**As a** token holder
**I want to** stake my tokens
**So that** I can earn rewards and participate in the protocol

---

## Technical Requirements

### Endpoints

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

### Database Changes

**New Tables**:
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

**Migrations**:
- [ ] Create migration file for adding staking_transactions table
- [ ] Test rollback

**Indexes**:
- Add index on `user_address` for performance
- Add index on `transaction_hash` for lookups
- Add index on `created_at` for history queries

---

## Implementation Notes

- Use Web3.js or Ethers.js for blockchain interaction
- Implement transaction queue for handling high volume
- Add rate limiting (e.g., max 10 requests per minute per user)
- Cache staking balances with 30-second TTL
- Use environment variables for contract address and RPC endpoint
- Add comprehensive error logging
- Implement transaction retry logic for failed submissions
- Set up event listeners for `Staked` events from smart contract to update database when transactions are confirmed
- Consider using WebSocket for real-time event updates

---

## Implementation Tasks

- [ ] Set up API route handlers
- [ ] Implement staking transaction endpoint
- [ ] Implement balance query endpoint
- [ ] Implement config endpoint
- [ ] Create database migration
- [ ] Set up blockchain event listeners
- [ ] Add transaction status tracking and caching
- [ ] Add authentication and validation middleware
- [ ] Implement error handling and logging
- [ ] Write API integration tests
- [ ] Test with testnet contract
- [ ] Update API documentation

---

## Definition of Done

- [ ] Code implemented according to specifications
- [ ] All tests passing
- [ ] Code reviewed and approved
- [ ] Documentation updated
- [ ] Merged to main branch
- [ ] Deployed to staging
- [ ] QA verified

---

## Implementation: Stake Tokens

**Layer**: Frontend

---

## User Story Context

**As a** token holder
**I want to** stake my tokens
**So that** I can earn rewards and participate in the protocol

---

## Technical Requirements

### Components

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

**State Management**:
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

**API Integration**:
- Endpoints to call: `/api/v1/staking/stake`, `/api/v1/staking/balance/:address`, `/api/v1/staking/config`
- Error handling approach: Network errors, validation errors, transaction failures
- Loading states: Skeleton loaders, spinners, progress indicators

**UI/UX Requirements**:
- Design mockup link: [URL]
- Responsive breakpoints: Mobile (< 768px), Tablet (768px - 1024px), Desktop (> 1024px)
- Accessibility requirements: ARIA labels, keyboard navigation, screen reader support

---

## Implementation Notes

- Use BigNumber.js or ethers.BigNumber for token amounts
- Format large numbers with commas (e.g., "1,000,000")
- Display token amounts in human-readable format (not wei)
- Implement optimistic UI updates (update UI immediately, rollback on error)
- Use WalletConnect or MetaMask for wallet connection
- Check token approval before staking, request approval if needed (separate transaction)
- Add transaction hash link to block explorer
- Implement form validation (minimum stake, max balance, etc.)
- Third-party libraries: ethers.js/web3.js, react-hook-form, react-query, zustand/redux, react-hot-toast

---

## Implementation Tasks

- [ ] Set up component structure
- [ ] Implement StakingForm, StakingBalance, and confirmation modal components
- [ ] Set up state management
- [ ] Integrate with backend API
- [ ] Integrate with Web3 wallet and implement token approval flow
- [ ] Add form validation and error handling
- [ ] Style components with responsive design
- [ ] Add accessibility features
- [ ] Write component tests
- [ ] Integration testing with testnet
- [ ] Cross-browser testing
- [ ] Update documentation

---

## Definition of Done

- [ ] Code implemented according to specifications
- [ ] All tests passing
- [ ] Code reviewed and approved
- [ ] Documentation updated
- [ ] Merged to main branch
- [ ] Deployed to staging
- [ ] QA verified
