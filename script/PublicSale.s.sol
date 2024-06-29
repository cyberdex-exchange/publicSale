// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/PublicSale.sol";

contract PublicSaleScript is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
			deploy();
        vm.stopBroadcast();
    }

	function deploy() public returns(PublicSale sale){
		
		address DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
		address USDT = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
		address USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
		address TOKEN = 0xA0084063Ea01D5F09E56EF3fF6232A9e18B0BACD;
		address PRICE_FEED = 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419;
		address ADMIN = 0xd3313105622B0aA4EDa599E62e0673d4D4DA4b16;
		address TREASURY = 0xd3313105622B0aA4EDa599E62e0673d4D4DA4b16;
        sale = new PublicSale(
			DAI,
			USDT,
			USDC,
			TOKEN,
			PRICE_FEED,
			ADMIN,
			TREASURY
		);

		uint40 start = 1720357200; // 7 July, 2024 13:00 UTC 
		uint40 duration = 7 days;
		uint256 price = 10000;     // It's supposed to be $0.01 
		sale.initialise(
			start,
			duration,
			price
		);

		sale.transferOwnership(ADMIN);
	}
}
