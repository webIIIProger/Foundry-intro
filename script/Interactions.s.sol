// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {DevOpsTools} from "../lib/foundry-devops/src/DevOpsTools.sol";

// This contract is used to interact with the smart contract
// It will be used to deploy the contract and interact with it

contract FundFundMe is Script {
    uint256 constant SEND_VALUE = 0.1 ether;

    // This function will be used to fund the contract
    function fundFundMe(address mostRecentFundMe) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentFundMe)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded FundMe contract with %s", SEND_VALUE);
        console.log("FundMe contract address: %s", mostRecentFundMe);
    }

    function run() external {
        address mostRecentFundMe = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        fundFundMe(mostRecentFundMe);
    }
}

contract WithdrawFundMe is Script {
    function withdrawFundMe(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentlyDeployed)).withdraw();
        vm.stopBroadcast();
        console.log("Withdraw FundMe balance!");
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("FundMe", block.chainid);
        withdrawFundMe(mostRecentlyDeployed);
    }
}
