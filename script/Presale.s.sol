// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Presale.sol";

contract PreSaleScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

		address DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
		address USDT = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
		address USDC = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
		address TOKEN = 0xA0084063Ea01D5F09E56EF3fF6232A9e18B0BACD;
		address PRICE_FEED = 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419;
		address ADMIN = address(this);
		address TREASURY = address(this);
        Presale sale = new Presale(
			DAI,
			USDT,
			USDC,
			TOKEN,
			PRICE_FEED,
			ADMIN,
			TREASURY
		);

		uint40 start = uint40(block.timestamp);
		uint40 duration = 7 days;
		uint256 price = 10000;
		sale.initialise(
			start,
			duration,
			price
		);

        vm.stopBroadcast();
    }
}
