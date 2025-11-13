// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract ControlStructures {
    error AfterHours(uint256 time);

    function fizzBuzz(uint _number) public pure returns (string memory) {
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } else if (_number % 3 == 0) {
            return "Fizz";
        } else if (_number % 5 == 0) {
            return "Buzz";
        } else {
            return "Splat";
        }
    }

    function doNotDisturb(uint _time) public pure returns (string memory) {
        // 1) _time >= 2400 → panic
        if (_time >= 2400) {
            assert(false);
        }

        // 2) AfterHours: _time > 2200 ou _time < 800
        if (_time > 2200 || _time < 800) {
            revert AfterHours(_time);
        }

        // 3) Horário de almoço
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        }

        // 4) Manhã
        if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        }

        // 5) Tarde
        if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        }

        // 6) Noite
        if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }

        return "";
    }
}
