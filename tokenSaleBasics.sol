pragma solidity 0.5.1;

contract ERC20Token {
    mapping(address => uint256) public balances;
    
    function mint() public {
        balances[tx.origin]++;
    }
}

contract myContract {
    address payable wallet;
    address public token;
    
    event Purchase(
        address _buyer,
        uint256 _amount
    );
    
    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }
    
    function() external payable {
        buyTokens();
    }
    
    function buyTokens() public payable{
        ERC20Token(address(token)).mint();
        
        wallet.transfer(msg.value);
        
        emit Purchase(msg.sender, 1);
    }
}