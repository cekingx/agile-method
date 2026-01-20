# Implementation: [User Story Title] - [Layer]

**Implements**: [Link to Taiga User Story #XXX]  
**Layer**: Backend / Frontend / Smart Contract  
**Estimate**: [X days]  
**Assignee**: [Developer name]

---

## User Story Context

**As a** [user type]  
**I want to** [action/feature]  
**So that** [benefit/value]

---

## Technical Requirements

### Endpoints (if Backend)

**POST** `/api/[endpoint]` - [Description]
- **Request**:
  ```json
  {
    "field": "value",
    "anotherField": "value"
  }
  ```
- **Response**:
  ```json
  {
    "status": "success",
    "data": {}
  }
  ```
- **Error Codes**: 400 (validation), 401 (auth), 500 (server error)

**GET** `/api/[endpoint]` - [Description]
- **Query Parameters**: `param1`, `param2`
- **Response**: [Description]

---

### Smart Contract (if Smart Contract)

**Function**: `functionName(param1, param2) returns (type)`
- **Description**: What this function does
- **Access Control**: onlyOwner / public / internal
- **Events Emitted**: 
  - `EventName(address indexed user, uint256 amount)`
- **Gas Optimization Notes**: [Any specific optimizations needed]
- **Security Considerations**: [Reentrancy, overflow, etc.]

---

### Components (if Frontend)

**Components to Create/Modify**:
- `ComponentName.jsx` - [Purpose]
- `AnotherComponent.jsx` - [Purpose]

**State Management**:
- State variables needed
- Redux actions/reducers (if applicable)

**API Integration**:
- Endpoints to call
- Error handling approach
- Loading states

**UI/UX Requirements**:
- Design mockup link: [URL]
- Responsive breakpoints
- Accessibility requirements

---

### Database Changes (if applicable)

**New Tables**:
```sql
CREATE TABLE table_name (
  id UUID PRIMARY KEY,
  field VARCHAR(255),
  created_at TIMESTAMP
);
```

**Migrations**:
- [ ] Create migration file
- [ ] Test rollback

**Indexes**:
- Add index on `field_name` for performance

---

## Implementation Notes

- [Technical gotchas or important details]
- [Performance considerations]
- [Security considerations]
- [Dependencies on other work]
- [Third-party libraries needed]

---

## Implementation Tasks

- [ ] [Specific task - Design/architecture review]
- [ ] [Core implementation work]
- [ ] [Additional feature/logic]
- [ ] [Error handling and validation]
- [ ] [Write unit tests]
- [ ] [Write integration tests]
- [ ] [Code review fixes]
- [ ] [Update documentation]

---

## Related Issues

- Depends on: #XXX
- Blocks: #XXX
- Related to: #XXX

---

## Definition of Done

- [ ] Code implemented according to specifications
- [ ] All tests passing
- [ ] Code reviewed and approved
- [ ] Documentation updated
- [ ] Merged to main branch
- [ ] Deployed to staging
- [ ] QA verified
