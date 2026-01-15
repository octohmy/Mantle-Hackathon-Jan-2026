/**
 *Written by Michael Hawes 
 *Submitted for verification at sepolia.mantlescan.xyz on 2026-01-14
 *0x11419E71A7c3D9EA980d46B354Fa6c7889dc64e2
*/

// Sources flattened with hardhat v2.26.3 https://hardhat.org

// SPDX-License-Identifier: MIT

// File @openzeppelin/contracts/access/IAccessControl.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (access/IAccessControl.sol)

pragma solidity >=0.8.4;

/**
 * @dev External interface of AccessControl declared to support ERC-165 detection.
 */
interface IAccessControl {
    /**
     * @dev The `account` is missing a role.
     */
    error AccessControlUnauthorizedAccount(address account, bytes32 neededRole);

    /**
     * @dev The caller of a function is not the expected one.
     *
     * NOTE: Don't confuse with {AccessControlUnauthorizedAccount}.
     */
    error AccessControlBadConfirmation();

    /**
     * @dev Emitted when `newAdminRole` is set as ``role``'s admin role, replacing `previousAdminRole`
     *
     * `DEFAULT_ADMIN_ROLE` is the starting admin for all roles, despite
     * {RoleAdminChanged} not being emitted to signal this.
     */
    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);

    /**
     * @dev Emitted when `account` is granted `role`.
     *
     * `sender` is the account that originated the contract call. This account bears the admin role (for the granted role).
     * Expected in cases where the role was granted using the internal {AccessControl-_grantRole}.
     */
    event RoleGranted(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Emitted when `account` is revoked `role`.
     *
     * `sender` is the account that originated the contract call:
     *   - if using `revokeRole`, it is the admin role bearer
     *   - if using `renounceRole`, it is the role bearer (i.e. `account`)
     */
    event RoleRevoked(bytes32 indexed role, address indexed account, address indexed sender);

    /**
     * @dev Returns `true` if `account` has been granted `role`.
     */
    function hasRole(bytes32 role, address account) external view returns (bool);

    /**
     * @dev Returns the admin role that controls `role`. See {grantRole} and
     * {revokeRole}.
     *
     * To change a role's admin, use {AccessControl-_setRoleAdmin}.
     */
    function getRoleAdmin(bytes32 role) external view returns (bytes32);

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function grantRole(bytes32 role, address account) external;

    /**
     * @dev Revokes `role` from `account`.
     *
     * If `account` had been granted `role`, emits a {RoleRevoked} event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     */
    function revokeRole(bytes32 role, address account) external;

    /**
     * @dev Revokes `role` from the calling account.
     *
     * Roles are often managed via {grantRole} and {revokeRole}: this function's
     * purpose is to provide a mechanism for accounts to lose their privileges
     * if they are compromised (such as when a trusted device is misplaced).
     *
     * If the calling account had been granted `role`, emits a {RoleRevoked}
     * event.
     *
     * Requirements:
     *
     * - the caller must be `callerConfirmation`.
     */
    function renounceRole(bytes32 role, address callerConfirmation) external;
}


// File @openzeppelin/contracts/utils/Context.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)

pragma solidity ^0.8.20;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
}


// File @openzeppelin/contracts/utils/introspection/IERC165.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (utils/introspection/IERC165.sol)

pragma solidity >=0.4.16;

/**
 * @dev Interface of the ERC-165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[ERC].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[ERC section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}


// File @openzeppelin/contracts/utils/introspection/ERC165.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (utils/introspection/ERC165.sol)

pragma solidity ^0.8.20;

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC-165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 */
abstract contract ERC165 is IERC165 {
    /// @inheritdoc IERC165
    function supportsInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}


// File @openzeppelin/contracts/access/AccessControl.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (access/AccessControl.sol)

pragma solidity ^0.8.20;



/**
 * @dev Contract module that allows children to implement role-based access
 * control mechanisms. This is a lightweight version that doesn't allow enumerating role
 * members except through off-chain means by accessing the contract event logs. Some
 * applications may benefit from on-chain enumerability, for those cases see
 * {AccessControlEnumerable}.
 *
 * Roles are referred to by their `bytes32` identifier. These should be exposed
 * in the external API and be unique. The best way to achieve this is by
 * using `public constant` hash digests:
 *
 * ```solidity
 * bytes32 public constant MY_ROLE = keccak256("MY_ROLE");
 * ```
 *
 * Roles can be used to represent a set of permissions. To restrict access to a
 * function call, use {hasRole}:
 *
 * ```solidity
 * function foo() public {
 *     require(hasRole(MY_ROLE, msg.sender));
 *     ...
 * }
 * ```
 *
 * Roles can be granted and revoked dynamically via the {grantRole} and
 * {revokeRole} functions. Each role has an associated admin role, and only
 * accounts that have a role's admin role can call {grantRole} and {revokeRole}.
 *
 * By default, the admin role for all roles is `DEFAULT_ADMIN_ROLE`, which means
 * that only accounts with this role will be able to grant or revoke other
 * roles. More complex role relationships can be created by using
 * {_setRoleAdmin}.
 *
 * WARNING: The `DEFAULT_ADMIN_ROLE` is also its own admin: it has permission to
 * grant and revoke this role. Extra precautions should be taken to secure
 * accounts that have been granted it. We recommend using {AccessControlDefaultAdminRules}
 * to enforce additional security measures for this role.
 */
abstract contract AccessControl is Context, IAccessControl, ERC165 {
    struct RoleData {
        mapping(address account => bool) hasRole;
        bytes32 adminRole;
    }

    mapping(bytes32 role => RoleData) private _roles;

    bytes32 public constant DEFAULT_ADMIN_ROLE = 0x00;

    /**
     * @dev Modifier that checks that an account has a specific role. Reverts
     * with an {AccessControlUnauthorizedAccount} error including the required role.
     */
    modifier onlyRole(bytes32 role) {
        _checkRole(role);
        _;
    }

    /// @inheritdoc IERC165
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IAccessControl).interfaceId || super.supportsInterface(interfaceId);
    }

    /**
     * @dev Returns `true` if `account` has been granted `role`.
     */
    function hasRole(bytes32 role, address account) public view virtual returns (bool) {
        return _roles[role].hasRole[account];
    }

    /**
     * @dev Reverts with an {AccessControlUnauthorizedAccount} error if `_msgSender()`
     * is missing `role`. Overriding this function changes the behavior of the {onlyRole} modifier.
     */
    function _checkRole(bytes32 role) internal view virtual {
        _checkRole(role, _msgSender());
    }

    /**
     * @dev Reverts with an {AccessControlUnauthorizedAccount} error if `account`
     * is missing `role`.
     */
    function _checkRole(bytes32 role, address account) internal view virtual {
        if (!hasRole(role, account)) {
            revert AccessControlUnauthorizedAccount(account, role);
        }
    }

    /**
     * @dev Returns the admin role that controls `role`. See {grantRole} and
     * {revokeRole}.
     *
     * To change a role's admin, use {_setRoleAdmin}.
     */
    function getRoleAdmin(bytes32 role) public view virtual returns (bytes32) {
        return _roles[role].adminRole;
    }

    /**
     * @dev Grants `role` to `account`.
     *
     * If `account` had not been already granted `role`, emits a {RoleGranted}
     * event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     *
     * May emit a {RoleGranted} event.
     */
    function grantRole(bytes32 role, address account) public virtual onlyRole(getRoleAdmin(role)) {
        _grantRole(role, account);
    }

    /**
     * @dev Revokes `role` from `account`.
     *
     * If `account` had been granted `role`, emits a {RoleRevoked} event.
     *
     * Requirements:
     *
     * - the caller must have ``role``'s admin role.
     *
     * May emit a {RoleRevoked} event.
     */
    function revokeRole(bytes32 role, address account) public virtual onlyRole(getRoleAdmin(role)) {
        _revokeRole(role, account);
    }

    /**
     * @dev Revokes `role` from the calling account.
     *
     * Roles are often managed via {grantRole} and {revokeRole}: this function's
     * purpose is to provide a mechanism for accounts to lose their privileges
     * if they are compromised (such as when a trusted device is misplaced).
     *
     * If the calling account had been revoked `role`, emits a {RoleRevoked}
     * event.
     *
     * Requirements:
     *
     * - the caller must be `callerConfirmation`.
     *
     * May emit a {RoleRevoked} event.
     */
    function renounceRole(bytes32 role, address callerConfirmation) public virtual {
        if (callerConfirmation != _msgSender()) {
            revert AccessControlBadConfirmation();
        }

        _revokeRole(role, callerConfirmation);
    }

    /**
     * @dev Sets `adminRole` as ``role``'s admin role.
     *
     * Emits a {RoleAdminChanged} event.
     */
    function _setRoleAdmin(bytes32 role, bytes32 adminRole) internal virtual {
        bytes32 previousAdminRole = getRoleAdmin(role);
        _roles[role].adminRole = adminRole;
        emit RoleAdminChanged(role, previousAdminRole, adminRole);
    }

    /**
     * @dev Attempts to grant `role` to `account` and returns a boolean indicating if `role` was granted.
     *
     * Internal function without access restriction.
     *
     * May emit a {RoleGranted} event.
     */
    function _grantRole(bytes32 role, address account) internal virtual returns (bool) {
        if (!hasRole(role, account)) {
            _roles[role].hasRole[account] = true;
            emit RoleGranted(role, account, _msgSender());
            return true;
        } else {
            return false;
        }
    }

    /**
     * @dev Attempts to revoke `role` from `account` and returns a boolean indicating if `role` was revoked.
     *
     * Internal function without access restriction.
     *
     * May emit a {RoleRevoked} event.
     */
    function _revokeRole(bytes32 role, address account) internal virtual returns (bool) {
        if (hasRole(role, account)) {
            _roles[role].hasRole[account] = false;
            emit RoleRevoked(role, account, _msgSender());
            return true;
        } else {
            return false;
        }
    }
}


// File @openzeppelin/contracts/access/Ownable.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (access/Ownable.sol)

pragma solidity ^0.8.20;

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * The initial owner is set to the address provided by the deployer. This can
 * later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error OwnableUnauthorizedAccount(address account);

    /**
     * @dev The owner is not a valid owner account. (eg. `address(0)`)
     */
    error OwnableInvalidOwner(address owner);

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    constructor(address initialOwner) {
        if (initialOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(initialOwner);
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        if (owner() != _msgSender()) {
            revert OwnableUnauthorizedAccount(_msgSender());
        }
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby disabling any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        if (newOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}


// File @openzeppelin/contracts/interfaces/draft-IERC6093.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (interfaces/draft-IERC6093.sol)
pragma solidity >=0.8.4;

/**
 * @dev Standard ERC-20 Errors
 * Interface of the https://eips.ethereum.org/EIPS/eip-6093[ERC-6093] custom errors for ERC-20 tokens.
 */
interface IERC20Errors {
    /**
     * @dev Indicates an error related to the current `balance` of a `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     * @param balance Current balance for the interacting account.
     * @param needed Minimum amount required to perform a transfer.
     */
    error ERC20InsufficientBalance(address sender, uint256 balance, uint256 needed);

    /**
     * @dev Indicates a failure with the token `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     */
    error ERC20InvalidSender(address sender);

    /**
     * @dev Indicates a failure with the token `receiver`. Used in transfers.
     * @param receiver Address to which tokens are being transferred.
     */
    error ERC20InvalidReceiver(address receiver);

    /**
     * @dev Indicates a failure with the `spender`’s `allowance`. Used in transfers.
     * @param spender Address that may be allowed to operate on tokens without being their owner.
     * @param allowance Amount of tokens a `spender` is allowed to operate with.
     * @param needed Minimum amount required to perform a transfer.
     */
    error ERC20InsufficientAllowance(address spender, uint256 allowance, uint256 needed);

    /**
     * @dev Indicates a failure with the `approver` of a token to be approved. Used in approvals.
     * @param approver Address initiating an approval operation.
     */
    error ERC20InvalidApprover(address approver);

    /**
     * @dev Indicates a failure with the `spender` to be approved. Used in approvals.
     * @param spender Address that may be allowed to operate on tokens without being their owner.
     */
    error ERC20InvalidSpender(address spender);
}

/**
 * @dev Standard ERC-721 Errors
 * Interface of the https://eips.ethereum.org/EIPS/eip-6093[ERC-6093] custom errors for ERC-721 tokens.
 */
interface IERC721Errors {
    /**
     * @dev Indicates that an address can't be an owner. For example, `address(0)` is a forbidden owner in ERC-20.
     * Used in balance queries.
     * @param owner Address of the current owner of a token.
     */
    error ERC721InvalidOwner(address owner);

    /**
     * @dev Indicates a `tokenId` whose `owner` is the zero address.
     * @param tokenId Identifier number of a token.
     */
    error ERC721NonexistentToken(uint256 tokenId);

    /**
     * @dev Indicates an error related to the ownership over a particular token. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     * @param tokenId Identifier number of a token.
     * @param owner Address of the current owner of a token.
     */
    error ERC721IncorrectOwner(address sender, uint256 tokenId, address owner);

    /**
     * @dev Indicates a failure with the token `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     */
    error ERC721InvalidSender(address sender);

    /**
     * @dev Indicates a failure with the token `receiver`. Used in transfers.
     * @param receiver Address to which tokens are being transferred.
     */
    error ERC721InvalidReceiver(address receiver);

    /**
     * @dev Indicates a failure with the `operator`’s approval. Used in transfers.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     * @param tokenId Identifier number of a token.
     */
    error ERC721InsufficientApproval(address operator, uint256 tokenId);

    /**
     * @dev Indicates a failure with the `approver` of a token to be approved. Used in approvals.
     * @param approver Address initiating an approval operation.
     */
    error ERC721InvalidApprover(address approver);

    /**
     * @dev Indicates a failure with the `operator` to be approved. Used in approvals.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     */
    error ERC721InvalidOperator(address operator);
}

/**
 * @dev Standard ERC-1155 Errors
 * Interface of the https://eips.ethereum.org/EIPS/eip-6093[ERC-6093] custom errors for ERC-1155 tokens.
 */
interface IERC1155Errors {
    /**
     * @dev Indicates an error related to the current `balance` of a `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     * @param balance Current balance for the interacting account.
     * @param needed Minimum amount required to perform a transfer.
     * @param tokenId Identifier number of a token.
     */
    error ERC1155InsufficientBalance(address sender, uint256 balance, uint256 needed, uint256 tokenId);

    /**
     * @dev Indicates a failure with the token `sender`. Used in transfers.
     * @param sender Address whose tokens are being transferred.
     */
    error ERC1155InvalidSender(address sender);

    /**
     * @dev Indicates a failure with the token `receiver`. Used in transfers.
     * @param receiver Address to which tokens are being transferred.
     */
    error ERC1155InvalidReceiver(address receiver);

    /**
     * @dev Indicates a failure with the `operator`’s approval. Used in transfers.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     * @param owner Address of the current owner of a token.
     */
    error ERC1155MissingApprovalForAll(address operator, address owner);

    /**
     * @dev Indicates a failure with the `approver` of a token to be approved. Used in approvals.
     * @param approver Address initiating an approval operation.
     */
    error ERC1155InvalidApprover(address approver);

    /**
     * @dev Indicates a failure with the `operator` to be approved. Used in approvals.
     * @param operator Address that may be allowed to operate on tokens without being their owner.
     */
    error ERC1155InvalidOperator(address operator);

    /**
     * @dev Indicates an array length mismatch between ids and values in a safeBatchTransferFrom operation.
     * Used in batch transfers.
     * @param idsLength Length of the array of token identifiers
     * @param valuesLength Length of the array of token amounts
     */
    error ERC1155InvalidArrayLength(uint256 idsLength, uint256 valuesLength);
}


// File @openzeppelin/contracts/token/ERC20/IERC20.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (token/ERC20/IERC20.sol)

pragma solidity >=0.4.16;

/**
 * @dev Interface of the ERC-20 standard as defined in the ERC.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}


// File @openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (token/ERC20/extensions/IERC20Metadata.sol)

pragma solidity >=0.6.2;

/**
 * @dev Interface for the optional metadata functions from the ERC-20 standard.
 */
interface IERC20Metadata is IERC20 {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the decimals places of the token.
     */
    function decimals() external view returns (uint8);
}


// File @openzeppelin/contracts/token/ERC20/ERC20.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.4.0) (token/ERC20/ERC20.sol)

pragma solidity ^0.8.20;




/**
 * @dev Implementation of the {IERC20} interface.
 *
 * This implementation is agnostic to the way tokens are created. This means
 * that a supply mechanism has to be added in a derived contract using {_mint}.
 *
 * TIP: For a detailed writeup see our guide
 * https://forum.openzeppelin.com/t/how-to-implement-erc20-supply-mechanisms/226[How
 * to implement supply mechanisms].
 *
 * The default value of {decimals} is 18. To change this, you should override
 * this function so it returns a different value.
 *
 * We have followed general OpenZeppelin Contracts guidelines: functions revert
 * instead returning `false` on failure. This behavior is nonetheless
 * conventional and does not conflict with the expectations of ERC-20
 * applications.
 */
abstract contract ERC20 is Context, IERC20, IERC20Metadata, IERC20Errors {
    mapping(address account => uint256) private _balances;

    mapping(address account => mapping(address spender => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * Both values are immutable: they can only be set once during construction.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5.05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei. This is the default value returned by this function, unless
     * it's overridden.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view virtual returns (uint8) {
        return 18;
    }

    /// @inheritdoc IERC20
    function totalSupply() public view virtual returns (uint256) {
        return _totalSupply;
    }

    /// @inheritdoc IERC20
    function balanceOf(address account) public view virtual returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - the caller must have a balance of at least `value`.
     */
    function transfer(address to, uint256 value) public virtual returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, value);
        return true;
    }

    /// @inheritdoc IERC20
    function allowance(address owner, address spender) public view virtual returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     *
     * NOTE: If `value` is the maximum `uint256`, the allowance is not updated on
     * `transferFrom`. This is semantically equivalent to an infinite approval.
     *
     * Requirements:
     *
     * - `spender` cannot be the zero address.
     */
    function approve(address spender, uint256 value) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, value);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     *
     * Skips emitting an {Approval} event indicating an allowance update. This is not
     * required by the ERC. See {xref-ERC20-_approve-address-address-uint256-bool-}[_approve].
     *
     * NOTE: Does not update the allowance if the current allowance
     * is the maximum `uint256`.
     *
     * Requirements:
     *
     * - `from` and `to` cannot be the zero address.
     * - `from` must have a balance of at least `value`.
     * - the caller must have allowance for ``from``'s tokens of at least
     * `value`.
     */
    function transferFrom(address from, address to, uint256 value) public virtual returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, value);
        _transfer(from, to, value);
        return true;
    }

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to`.
     *
     * This internal function is equivalent to {transfer}, and can be used to
     * e.g. implement automatic token fees, slashing mechanisms, etc.
     *
     * Emits a {Transfer} event.
     *
     * NOTE: This function is not virtual, {_update} should be overridden instead.
     */
    function _transfer(address from, address to, uint256 value) internal {
        if (from == address(0)) {
            revert ERC20InvalidSender(address(0));
        }
        if (to == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        _update(from, to, value);
    }

    /**
     * @dev Transfers a `value` amount of tokens from `from` to `to`, or alternatively mints (or burns) if `from`
     * (or `to`) is the zero address. All customizations to transfers, mints, and burns should be done by overriding
     * this function.
     *
     * Emits a {Transfer} event.
     */
    function _update(address from, address to, uint256 value) internal virtual {
        if (from == address(0)) {
            // Overflow check required: The rest of the code assumes that totalSupply never overflows
            _totalSupply += value;
        } else {
            uint256 fromBalance = _balances[from];
            if (fromBalance < value) {
                revert ERC20InsufficientBalance(from, fromBalance, value);
            }
            unchecked {
                // Overflow not possible: value <= fromBalance <= totalSupply.
                _balances[from] = fromBalance - value;
            }
        }

        if (to == address(0)) {
            unchecked {
                // Overflow not possible: value <= totalSupply or value <= fromBalance <= totalSupply.
                _totalSupply -= value;
            }
        } else {
            unchecked {
                // Overflow not possible: balance + value is at most totalSupply, which we know fits into a uint256.
                _balances[to] += value;
            }
        }

        emit Transfer(from, to, value);
    }

    /**
     * @dev Creates a `value` amount of tokens and assigns them to `account`, by transferring it from address(0).
     * Relies on the `_update` mechanism
     *
     * Emits a {Transfer} event with `from` set to the zero address.
     *
     * NOTE: This function is not virtual, {_update} should be overridden instead.
     */
    function _mint(address account, uint256 value) internal {
        if (account == address(0)) {
            revert ERC20InvalidReceiver(address(0));
        }
        _update(address(0), account, value);
    }

    /**
     * @dev Destroys a `value` amount of tokens from `account`, lowering the total supply.
     * Relies on the `_update` mechanism.
     *
     * Emits a {Transfer} event with `to` set to the zero address.
     *
     * NOTE: This function is not virtual, {_update} should be overridden instead
     */
    function _burn(address account, uint256 value) internal {
        if (account == address(0)) {
            revert ERC20InvalidSender(address(0));
        }
        _update(account, address(0), value);
    }

    /**
     * @dev Sets `value` as the allowance of `spender` over the `owner`'s tokens.
     *
     * This internal function is equivalent to `approve`, and can be used to
     * e.g. set automatic allowances for certain subsystems, etc.
     *
     * Emits an {Approval} event.
     *
     * Requirements:
     *
     * - `owner` cannot be the zero address.
     * - `spender` cannot be the zero address.
     *
     * Overrides to this logic should be done to the variant with an additional `bool emitEvent` argument.
     */
    function _approve(address owner, address spender, uint256 value) internal {
        _approve(owner, spender, value, true);
    }

    /**
     * @dev Variant of {_approve} with an optional flag to enable or disable the {Approval} event.
     *
     * By default (when calling {_approve}) the flag is set to true. On the other hand, approval changes made by
     * `_spendAllowance` during the `transferFrom` operation set the flag to false. This saves gas by not emitting any
     * `Approval` event during `transferFrom` operations.
     *
     * Anyone who wishes to continue emitting `Approval` events on the`transferFrom` operation can force the flag to
     * true using the following override:
     *
     * ```solidity
     * function _approve(address owner, address spender, uint256 value, bool) internal virtual override {
     *     super._approve(owner, spender, value, true);
     * }
     * ```
     *
     * Requirements are the same as {_approve}.
     */
    function _approve(address owner, address spender, uint256 value, bool emitEvent) internal virtual {
        if (owner == address(0)) {
            revert ERC20InvalidApprover(address(0));
        }
        if (spender == address(0)) {
            revert ERC20InvalidSpender(address(0));
        }
        _allowances[owner][spender] = value;
        if (emitEvent) {
            emit Approval(owner, spender, value);
        }
    }

    /**
     * @dev Updates `owner`'s allowance for `spender` based on spent `value`.
     *
     * Does not update the allowance value in case of infinite allowance.
     * Revert if not enough allowance is available.
     *
     * Does not emit an {Approval} event.
     */
    function _spendAllowance(address owner, address spender, uint256 value) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance < type(uint256).max) {
            if (currentAllowance < value) {
                revert ERC20InsufficientAllowance(spender, currentAllowance, value);
            }
            unchecked {
                _approve(owner, spender, currentAllowance - value, false);
            }
        }
    }
}


// File contracts/MyStable.sol

// Original license: SPDX_License_Identifier: MIT
pragma solidity ^0.8.20;


contract MyStable is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    constructor() ERC20("MyStable", "MYST") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
        _grantRole(BURNER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public onlyRole(BURNER_ROLE) {
        _burn(from, amount);
    }
}


// File @chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol@v1.5.0

// Original license: SPDX_License_Identifier: MIT
pragma solidity ^0.8.0;

// solhint-disable-next-line interface-starts-with-i
interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(
    uint80 _roundId
  ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

  function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}


// File @openzeppelin/contracts/utils/ReentrancyGuard.sol@v5.4.0

// Original license: SPDX_License_Identifier: MIT
// OpenZeppelin Contracts (last updated v5.1.0) (utils/ReentrancyGuard.sol)

pragma solidity ^0.8.20;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If EIP-1153 (transient storage) is available on the chain you're deploying at,
 * consider using {ReentrancyGuardTransient} instead.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant NOT_ENTERED = 1;
    uint256 private constant ENTERED = 2;

    uint256 private _status;

    /**
     * @dev Unauthorized reentrant call.
     */
    error ReentrancyGuardReentrantCall();

    constructor() {
        _status = NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }

    function _nonReentrantBefore() private {
        // On the first call to nonReentrant, _status will be NOT_ENTERED
        if (_status == ENTERED) {
            revert ReentrancyGuardReentrantCall();
        }

        // Any calls to nonReentrant after this point will fail
        _status = ENTERED;
    }

    function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = NOT_ENTERED;
    }

    /**
     * @dev Returns true if the reentrancy guard is currently set to "entered", which indicates there is a
     * `nonReentrant` function in the call stack.
     */
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == ENTERED;
    }
}


// File contracts/StablecoinVault.sol

// Original license: SPDX_License_Identifier: MIT
pragma solidity ^0.8.20;





contract StablecoinVault is Ownable, ReentrancyGuard {
    // --- Existing Stablecoin Minting State ---
    MyStable public immutable stablecoin; // For minting MYST
    AggregatorV3Interface public immutable priceFeed;
    uint256 public constant COLLATERAL_RATIO_PERCENT = 150;
    uint256 public constant LIQUIDATION_THRESHOLD_PERCENT = 120;
    mapping(address => uint256) public collateralBalances;
    mapping(address => uint256) public debtBalances;

    // --- New Advanced Escrow State ---
    mapping(address => bool) public supportedTokens;
    mapping(bytes32 => Shipment) public shipments;
    mapping(bytes32 => Escrow) public escrows;
    bytes32[] public allShipmentIds;
    uint256 public totalFeesCollected;
    address public treasury;

    struct Penalty {
        uint256 percentage; // e.g., 5 for 5%
        uint256 period;     // e.g., 7 days
        uint256 maxPercentage; // e.g., 50 for 50% cap
    }

    enum Operator { LT, GT, EQ } // Less Than, Greater Than, Equal To

    struct Condition {
        string metric; // e.g., "Temperature"
        Operator operator;
        int256 value; // Using int256 to allow for negative temperatures
        bool met;
    }

    struct Document {
        string ipfsHash; // Reverted from publicIpfsHash to maintain compatibility
        string privateIpfsHash; // For the new private document flow
        string label;
        uint256 uploadTimestamp;
        address uploadedBy;
    }

    struct Milestone {
        string description;
        uint256 percentage;
        uint256 dueDate;
        bool released;
        Penalty penalty;
        uint[] conditionIndexes; // Indexes pointing to the Escrow's conditions array
    }

    struct Escrow {
        address token;
        uint256 totalAmount;
        bool disputed;
        uint256 disputeDeadline;
        Milestone[] milestones;
        Condition[] conditions; // All conditions for the shipment are stored here
        uint256 intendedAmount; // New field to store the intended amount for the escrow
    }

    struct Shipment {
        bytes32 id;
        address seller;
        address buyer;
        string agreementHash;
        Document[] documents;
        uint256 blockTimestamp;
        bool exists;
    }
    
    // --- Events ---
    event CollateralDeposited(address indexed user, uint256 amount);
    event StableMinted(address indexed user, uint256 amount);
    event StableRedeemed(address indexed user, uint256 amount, uint256 collateralReturned);
    
    event ShipmentInitiated(bytes32 indexed shipmentId, address indexed seller, address indexed buyer, string agreementHash);
    event ShipmentReadyForFunding(bytes32 indexed shipmentId, address indexed buyer); // <-- NEW EVENT
    event EscrowFunded(bytes32 indexed shipmentId, address indexed buyer, address token, uint256 amount);
    event MilestoneReleased(bytes32 indexed shipmentId, uint256 milestoneIndex, uint256 amount, uint256 penaltyAmount);
    event DisputeRaised(bytes32 indexed shipmentId, address indexed buyer);
    event DisputeResolved(bytes32 indexed shipmentId, address indexed winner, uint256 remainingAmount);
    event MilestoneDisputeResolved(bytes32 indexed shipmentId, uint256 milestoneIndex, address indexed winner); // <-- NEW EVENT
    event ConditionReported(bytes32 indexed shipmentId, uint256 milestoneIndex, bool passed); // <-- NEW EVENT
    event ShipmentDocumentAdded(bytes32 indexed shipmentId, string ipfsHash, string privateIpfsHash, string label, uint256 timestamp, address uploadedBy);
    event TreasuryUpdated(address newTreasury);
    event FeeCollected(bytes32 indexed shipmentId, uint256 amount, uint256 timestamp);

    constructor(address _stablecoinAddress, address _priceFeedAddress) Ownable(msg.sender) {
        stablecoin = MyStable(_stablecoinAddress);
        priceFeed = AggregatorV3Interface(_priceFeedAddress);
        treasury = msg.sender; // Default treasury to contract owner
        
        // Add MYST as a supported token by default
        supportedTokens[_stablecoinAddress] = true;
    }

    // --- Admin Functions ---
    function addSupportedToken(address _token) external onlyOwner {
        supportedTokens[_token] = true;
    }

    function removeSupportedToken(address _token) external onlyOwner {
        supportedTokens[_token] = false;
    }

    function setTreasury(address _newTreasury) external onlyOwner {
        require(_newTreasury != address(0), "Cannot set treasury to zero address");
        treasury = _newTreasury;
        emit TreasuryUpdated(_newTreasury);
    }

    // --- Core DeFi Functions ---
    function depositCollateral() external payable nonReentrant {
        require(msg.value > 0, "Must deposit ETH");
        collateralBalances[msg.sender] += msg.value;
        emit CollateralDeposited(msg.sender, msg.value);
    }

    function mintStable(uint256 _amount) external nonReentrant {
        require(_amount > 0, "Amount must be greater than 0");
        uint256 collateralValue = getCollateralValueInUSD(collateralBalances[msg.sender]);
        uint256 newDebtValue = (debtBalances[msg.sender] + _amount);
        uint256 collateralizationRatio = (collateralValue * 100) / newDebtValue;
        require(collateralizationRatio >= COLLATERAL_RATIO_PERCENT, "Collateral ratio not met");

        debtBalances[msg.sender] += _amount;
        stablecoin.mint(msg.sender, _amount);
        emit StableMinted(msg.sender, _amount);
    }

    function redeemStable(uint256 _amount) external nonReentrant {
        require(_amount > 0, "Amount must be greater than 0");
        require(stablecoin.balanceOf(msg.sender) >= _amount, "Insufficient stablecoin balance");

        stablecoin.burn(msg.sender, _amount);
        debtBalances[msg.sender] -= _amount;

        uint256 ethToReturn = (_amount * 1e18) / getEthPriceInUSD();
        require(collateralBalances[msg.sender] >= ethToReturn, "Insufficient collateral");

        collateralBalances[msg.sender] -= ethToReturn;
        payable(msg.sender).transfer(ethToReturn);
        emit StableRedeemed(msg.sender, _amount, ethToReturn);
    }
    
    function liquidate(address _user) external nonReentrant {
        uint256 collateralValue = getCollateralValueInUSD(collateralBalances[_user]);
        uint256 debtValue = debtBalances[_user];
        uint256 collateralizationRatio = (collateralValue * 100) / debtValue;
        require(collateralizationRatio < LIQUIDATION_THRESHOLD_PERCENT, "User is not liquidatable");

        uint256 debtToCover = debtBalances[_user];
        require(stablecoin.balanceOf(msg.sender) >= debtToCover, "Insufficient stablecoin to liquidate");

        stablecoin.burn(msg.sender, debtToCover);
        
        uint256 collateralToReceive = collateralBalances[_user];
        collateralBalances[_user] = 0;
        debtBalances[_user] = 0;
        
        payable(msg.sender).transfer(collateralToReceive);
    }

    // --- Helper Functions (Unchanged) ---
    function getEthPriceInUSD() public view returns (uint256) {
        if (block.chainid == 31337) {
            // For local Hardhat network, return a mock price
            return 3000 * 1e8; // $3000 with 8 decimals
        }
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price); 
    }

    function getCollateralValueInUSD(uint256 _ethAmount) public view returns (uint256) {
        uint256 ethPrice = getEthPriceInUSD();
        // _ethAmount is in wei (18 decimals)
        // ethPrice is in USD (8 decimals)
        // The result should be in USD with 18 decimals to match the debt amount
        return (_ethAmount * ethPrice) / 1e8;
    }

    // --- New Advanced Shipping Escrow Functions ---
    function initiateShipment(
        bytes32 _shipmentId,
        address _buyer,
        string calldata _agreementHash,
        Milestone[] calldata _milestones,
        uint256 _disputeDeadline,
        uint256 _intendedAmount
    ) external nonReentrant {
        require(!shipments[_shipmentId].exists, "Shipment already initiated");
        
        uint256 totalPercentage = 0;
        for (uint i = 0; i < _milestones.length; i++) {
            totalPercentage += _milestones[i].percentage;
        }
        require(totalPercentage == 100, "Milestone percentages must sum to 100");

        shipments[_shipmentId].id = _shipmentId;
        shipments[_shipmentId].seller = msg.sender;
        shipments[_shipmentId].buyer = _buyer;
        shipments[_shipmentId].agreementHash = _agreementHash;
        shipments[_shipmentId].blockTimestamp = block.timestamp;
        shipments[_shipmentId].exists = true;

        allShipmentIds.push(_shipmentId); // Track the new shipment ID

        escrows[_shipmentId].disputeDeadline = _disputeDeadline;
        escrows[_shipmentId].intendedAmount = _intendedAmount;
        for (uint i = 0; i < _milestones.length; i++) {
            escrows[_shipmentId].milestones.push(_milestones[i]);
        }

        emit ShipmentInitiated(_shipmentId, msg.sender, _buyer, _agreementHash);
        emit ShipmentReadyForFunding(_shipmentId, _buyer); // <-- EMIT NEW EVENT
    }

    function depositIntoEscrow(bytes32 _shipmentId, address _token, uint256 _totalAmount) external nonReentrant {
        Shipment storage shipment = shipments[_shipmentId];
        Escrow storage escrow = escrows[_shipmentId];
        
        require(shipment.exists, "Shipment not initiated");
        require(msg.sender == shipment.buyer, "Only buyer can fund escrow");
        require(escrow.totalAmount == 0, "Escrow already funded");
        require(supportedTokens[_token], "Token not supported");
        require(_totalAmount == escrow.intendedAmount, "Amount does not match agreed value");

        escrow.token = _token;
        escrow.totalAmount = _totalAmount;

        IERC20(_token).transferFrom(msg.sender, address(this), _totalAmount);
        
        emit EscrowFunded(_shipmentId, msg.sender, _token, _totalAmount);
    }

    function releaseMilestonePayment(bytes32 _shipmentId, uint256 _milestoneIndex) external nonReentrant {
        _release(_shipmentId, _milestoneIndex, true);
    }

    function autoFinalizeMilestone(bytes32 _shipmentId, uint256 _milestoneIndex) external nonReentrant {
        require(block.timestamp >= escrows[_shipmentId].milestones[_milestoneIndex].dueDate, "Milestone not yet due");
        _release(_shipmentId, _milestoneIndex, false);
    }

    function _release(bytes32 _shipmentId, uint256 _milestoneIndex, bool _isManual) internal {
        Shipment storage shipment = shipments[_shipmentId];
        Escrow storage escrow = escrows[_shipmentId];
        Milestone storage milestone = escrow.milestones[_milestoneIndex];

        if(_isManual) {
            require(msg.sender == shipment.buyer, "Only buyer can release payment");
        }
        require(!escrow.disputed, "Escrow is disputed");
        require(!milestone.released, "Milestone already released");

        uint256 milestoneValue = (escrow.totalAmount * milestone.percentage) / 100;
        uint256 penaltyAmount = 0;

        if (block.timestamp > milestone.dueDate && milestone.penalty.percentage > 0) {
            uint256 lateTime = block.timestamp - milestone.dueDate;
            uint256 penaltyPeriods = lateTime / milestone.penalty.period;
            penaltyAmount = (milestoneValue * milestone.penalty.percentage * penaltyPeriods) / 100;

            if (milestone.penalty.maxPercentage > 0) {
                uint256 maxPenaltyAmount = (milestoneValue * milestone.penalty.maxPercentage) / 100;
                if (penaltyAmount > maxPenaltyAmount) {
                    penaltyAmount = maxPenaltyAmount;
                }
            }
        }

        if (penaltyAmount > milestoneValue) {
            penaltyAmount = milestoneValue;
        }

        uint256 paymentAmount = milestoneValue - penaltyAmount;
        milestone.released = true;

        uint256 fee = (paymentAmount * 2) / 100; // Calculate 2% platform fee
        
        if (fee > 0) {
            totalFeesCollected += fee;
            IERC20(escrow.token).transfer(treasury, fee);
            emit FeeCollected(_shipmentId, fee, block.timestamp);
        }

        uint256 finalPaymentAmount = paymentAmount - fee;

        if (finalPaymentAmount > 0) {
            IERC20(escrow.token).transfer(shipment.seller, finalPaymentAmount);
        }
        if (penaltyAmount > 0) {
            IERC20(escrow.token).transfer(shipment.buyer, penaltyAmount);
        }

        emit MilestoneReleased(_shipmentId, _milestoneIndex, paymentAmount, penaltyAmount);
    }
    
    function addShipmentDocument(bytes32 _shipmentId, string calldata _ipfsHash, string calldata _privateIpfsHash, string calldata _label) external nonReentrant {
        Shipment storage shipment = shipments[_shipmentId];
        require(shipment.exists, "Shipment not initiated");
        require(
            msg.sender == shipment.seller || 
            msg.sender == shipment.buyer || 
            msg.sender == owner(), 
            "Not authorized to add documents"
        );

        shipment.documents.push(Document({
            ipfsHash: _ipfsHash,
            privateIpfsHash: _privateIpfsHash,
            label: _label,
            uploadTimestamp: block.timestamp,
            uploadedBy: msg.sender
        }));
        emit ShipmentDocumentAdded(_shipmentId, _ipfsHash, _privateIpfsHash, _label, block.timestamp, msg.sender);
    }

    function raiseDispute(bytes32 _shipmentId) external nonReentrant {
        Shipment storage shipment = shipments[_shipmentId];
        Escrow storage escrow = escrows[_shipmentId];

        require(msg.sender == shipment.buyer, "Only buyer can raise dispute");
        require(block.timestamp < escrow.disputeDeadline, "Dispute deadline has passed");
        require(!escrow.disputed, "Dispute already raised");

        escrow.disputed = true;
        emit DisputeRaised(_shipmentId, msg.sender);
    }

    function resolveDispute(bytes32 _shipmentId, address _winner) external nonReentrant onlyOwner {
        Escrow storage escrow = escrows[_shipmentId];
        require(escrow.disputed, "Escrow is not disputed");

        uint256 remainingAmount = 0;
        for (uint i = 0; i < escrow.milestones.length; i++) {
            if (!escrow.milestones[i].released) {
                remainingAmount += (escrow.totalAmount * escrow.milestones[i].percentage) / 100;
                escrow.milestones[i].released = true; // Mark all as released to close escrow
            }
        }
        
        escrow.disputed = false; // Resolve dispute
        if (remainingAmount > 0) {
             IERC20(escrow.token).transfer(_winner, remainingAmount);
        }

        emit DisputeResolved(_shipmentId, _winner, remainingAmount);
    }

    // --- NEW Granular Dispute Resolution ---
    function resolveMilestoneDispute(bytes32 _shipmentId, uint256 _milestoneIndex, address _winner) external nonReentrant onlyOwner {
        Escrow storage escrow = escrows[_shipmentId];
        require(escrow.disputed, "Escrow is not disputed");
        require(_milestoneIndex < escrow.milestones.length, "Milestone index out of bounds");
        Milestone storage milestone = escrow.milestones[_milestoneIndex];
        require(!milestone.released, "Milestone already released");

        uint256 milestoneValue = (escrow.totalAmount * milestone.percentage) / 100;
        milestone.released = true; // Mark as released to close this part of the dispute

        if (milestoneValue > 0) {
             IERC20(escrow.token).transfer(_winner, milestoneValue);
        }

        emit MilestoneDisputeResolved(_shipmentId, _milestoneIndex, _winner);
    }

    // --- NEW Oracle Simulation ---
    function reportCondition(bytes32 _shipmentId, uint256 _conditionIndex, int256 _observedValue) external nonReentrant onlyOwner {
        Escrow storage escrow = escrows[_shipmentId];
        require(_conditionIndex < escrow.conditions.length, "Condition index out of bounds");
        Condition storage condition = escrow.conditions[_conditionIndex];
        
        bool conditionMet = false;
        if (condition.operator == Operator.LT) {
            conditionMet = _observedValue < condition.value;
        } else if (condition.operator == Operator.GT) {
            conditionMet = _observedValue > condition.value;
        } else if (condition.operator == Operator.EQ) {
            conditionMet = _observedValue == condition.value;
        }

        if (conditionMet) {
            condition.met = true;
            // Now, we need to check if this condition being met completes a milestone
            for (uint i = 0; i < escrow.milestones.length; i++) {
                if (!escrow.milestones[i].released) {
                    bool allConditionsForMilestoneMet = true;
                    for (uint j = 0; j < escrow.milestones[i].conditionIndexes.length; j++) {
                        uint cIndex = escrow.milestones[i].conditionIndexes[j];
                        if (!escrow.conditions[cIndex].met) {
                            allConditionsForMilestoneMet = false;
                            break;
                        }
                    }
                    if (allConditionsForMilestoneMet) {
                        _release(_shipmentId, i, false);
                    }
                }
            }
        }

        emit ConditionReported(_shipmentId, _conditionIndex, conditionMet);
    }

    // --- Getter Functions ---
    function getMilestones(bytes32 _shipmentId) external view returns (Milestone[] memory) {
        return escrows[_shipmentId].milestones;
    }

    // --- NEW, MORE ROBUST GETTER FOR SHIPMENT INFO ---
    function getShipment(bytes32 _shipmentId) external view returns (
        address seller,
        address buyer,
        string memory agreementHash,
        uint256 initializationTimestamp,
        bool exists
    ) {
        Shipment storage s = shipments[_shipmentId];
        return (
            s.seller,
            s.buyer,
            s.agreementHash,
            s.blockTimestamp, // Changed from initializationTimestamp to blockTimestamp
            s.exists
        );
    }

    function getShipmentDocuments(bytes32 _id) public view returns (Document[] memory) {
        return shipments[_id].documents;
    }

    function getEscrow(bytes32 _id) external view returns (
        address token,
        uint256 totalAmount,
        uint256 intendedAmount,
        bool disputed,
        uint256 disputeDeadline
    ) {
        Escrow storage e = escrows[_id];
        return (
            e.token,
            e.totalAmount,
            e.intendedAmount,
            e.disputed,
            e.disputeDeadline
        );
    }

    // --- NEWLY ADDED FUNCTION TO FIX HISTORY ---
    function getAllShipmentIds() external view returns (bytes32[] memory) {
        return allShipmentIds;
    }
}
