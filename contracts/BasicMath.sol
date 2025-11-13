// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BasicMath {
    function adder(uint _a, uint _b) public pure returns (uint, bool) {
        unchecked {
            if (_a > type(uint).max - _b) {
                // overflow
                return (0, true);
            }

            uint result = _a + _b;
            return (result, false);
        }
    }

    function subtractor(uint _a, uint _b) public pure returns (uint, bool) {
        if (_b > _a) {
            return (0, true);
        }

        uint result = _a - _b;
        return (result, false);
    }
}
