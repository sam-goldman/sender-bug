// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.prank(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);
        Counter counter = new Counter();
        console.log(address(counter));
    }
}
