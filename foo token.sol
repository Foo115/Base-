// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SafeMath.sol";

contract FooToken {
    using SafeMath for uint256;

    string public name = "Foo Token";
    string public symbol = "FOO";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000000000 * (10**uint256(decimals));
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) private _allowances;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }

    function _transfer(address from, address to, uint256 amount) internal {
        require(from != address(0), "Invalid sender");
        require(to != address(0), "Invalid recipient");
        require(balanceOf[from] >= amount, "Insufficient balance");

        balanceOf[from] = balanceOf[from].sub(amount);
        balanceOf[to] = balanceOf[to].add(amount);

        emit Transfer(from, to, amount);
    }

    function allowance(address owner, address spender) external view returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }

    function _approve(address owner, address spender, uint256 amount) internal {
        require(owner != address(0), "Invalid owner");
        require(spender != address(0), "Invalid spender");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function increaseAllowance(address spender, uint256 addedAmount) external returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedAmount));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedAmount) external returns (bool) {
        uint256 currentAllowance = _allowances[msg.sender][spender];
        require(currentAllowance >= subtractedAmount, "Decreased allowance below zero");

        _approve(msg.sender, spender, currentAllowance.sub(subtractedAmount));
        return true;
    }
}
