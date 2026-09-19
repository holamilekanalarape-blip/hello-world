// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {console2} from "forge-std/console2.sol";
import {TOPASU} from "../src/TOPASU.sol";

contract DeployTOPASU is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address owner = vm.envAddress("OWNER_ADDRESS");
        uint256 initialSupply = vm.envUint("INITIAL_SUPPLY");

        vm.startBroadcast(deployerPrivateKey);
        TOPASU token = new TOPASU(owner, initialSupply);
        vm.stopBroadcast();

        console2.log("TOPASU deployed at:", address(token));
    }
}
