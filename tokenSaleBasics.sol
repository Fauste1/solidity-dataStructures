pragma solidity 0.5.1;

contract myContract {
    mapping(address => uint256) public balances;
    address payable wallet;
    
    event Purchase(
        address _buyer,
        uint256 _amount
    );
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    function buyTokens() public payable{
        // buy a token
        balances[msg.sender] += 1;
        // send ether to the wallet
        // there's currently no value assigned to the TX when calling this function
        wallet.transfer(msg.value);
        
        emit Purchase(msg.sender, 1);
    }
    
    function() external payable {
        buyTokens();
    }
}