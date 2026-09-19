// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TOPASU {
    string public constant name = "TOPASU";
    string public constant symbol = "TOPASU";
    uint8 public constant decimals = 18;

    address public immutable owner;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed tokenOwner, address indexed spender, uint256 value);

    constructor(address owner_, uint256 initialSupply) {
        require(owner_ != address(0), "TOPASU: owner is zero address");

        owner = owner_;
        totalSupply = initialSupply;
        balanceOf[owner_] = initialSupply;

        emit Transfer(address(0), owner_, initialSupply);
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        require(spender != address(0), "TOPASU: spender is zero address");

        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) external returns (bool) {
        uint256 permitted = allowance[from][msg.sender];
        require(permitted >= amount, "TOPASU: allowance too low");

        if (permitted != type(uint256).max) {
            allowance[from][msg.sender] = permitted - amount;
        }

        _transfer(from, to, amount);
        return true;
    }

    function _transfer(address from, address to, uint256 amount) internal {
        require(from != address(0), "TOPASU: sender is zero address");
        require(to != address(0), "TOPASU: recipient is zero address");
        require(balanceOf[from] >= amount, "TOPASU: insufficient balance");

        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        emit Transfer(from, to, amount);
    }
}
