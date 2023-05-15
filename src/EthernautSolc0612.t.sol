// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./EthernautSolc0612.sol";

contract EthernautSolc0612Test is DSTest {
    EthernautSolc0612 solc;

    function setUp() public {
        solc = new EthernautSolc0612();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
