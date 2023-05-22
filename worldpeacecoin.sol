// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WorldPeaceCoin {
   string public name;
   string public symbol;
   uint256 public totalSupply;
   mapping(address => uint256) public balanceOf;

   event Transfer(address indexed from, address indexed to, uint256 value);
   event Donate(address indexed from, uint256 value);

   constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
       name = _name;
       symbol = _symbol;
       totalSupply = _totalSupply;
       balanceOf[msg.sender] = _totalSupply;
   }

   function transfer(address _to, uint256 _value) public returns (bool) {
       require(balanceOf[msg.sender] >= _value, "Insufficient balance");

       balanceOf[msg.sender] -= _value;
       balanceOf[_to] += _value;

       emit Transfer(msg.sender, _to, _value);
       return true;
   }

   function donate(uint256 _value) public returns (bool) {
       require(balanceOf[msg.sender] >= _value, "Insufficient balance");

       balanceOf[msg.sender] -= _value;
       totalSupply -= _value;

       emit Donate(msg.sender, _value);
       return true;
   }
}
