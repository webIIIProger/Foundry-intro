// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Note: The AggregatorV3Interface might be at a different location than what was in the video!
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        (, int256 price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10); // 1e18 to get 18 decimals
    }

    function getETHAmountInUSD(uint256 ethAmount, AggregatorV3Interface priceFeed) internal view returns (uint256) {
        return (ethAmount * getPrice(priceFeed)) / 1e18; // 1e18 to get 18 decimals
    }
}
