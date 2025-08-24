// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "token.sol";

contract TestToken is Token {
    constructor() public {
        paused(); 
        owner = address(0x0); 
    }

    function echidna_cannot_be_unpaused() public view returns (bool) {
        return is_paused;
    }
}


