// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract ErrorHandling {
    mapping(address => uint) public balances;

    function deposit(address _address, uint _amount) public {
        assert(_amount > 0);
        balances[_address] += _amount;
    }

    function withdraw(address _address, uint _amount) public {
        require(balances[_address] >= _amount, "Insufficient balance for withdrawal.");
        balances[_address] -= _amount;
    }

    function transfer(address _from, address _to, uint _amount) public {
        if(balances[_from] >= _amount){
            balances[_from] -= _amount;
            balances[_to] += _amount;
        } else {
            revert("Insufficient balance in wallet.");
        }
        
    }
}
