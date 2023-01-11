// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import "../mocks/MockPermit2_ERC721.sol";
import {BaseAllowanceUnitTest} from "./BaseAllowanceUnitTest.sol";
import {TokenProvider_ERC721} from "../utils/TokenProvider_ERC721.sol";

contract AllowanceUnitTest_ERC721 is TokenProvider_ERC721, BaseAllowanceUnitTest {
    function setUp() public override {
        permit2 = new MockPermit2_ERC721();
        initializeERC721TestTokens();
    }

    function allowance(address from, address token, address spender)
        public
        view
        override
        returns (uint160, uint48, uint48)
    {
        return MockPermit2_ERC721(address(permit2)).allowance(from, token, spender);
    }

    function token1() public view override returns (address) {
        return address(_token1);
    }
}