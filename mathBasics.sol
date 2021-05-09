pragma solidity 0.5.1;

import "./SafeMath.sol";

contract MyContract {
    uint256 public value;
    using SafeMath for uint256;
    
    function calculate(uint256 _value1, uint256 _value2) public {
        value = _value1.div(_value2);
    }
}