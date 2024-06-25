pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/PublicSale.sol";
import "../script/PublicSale.s.sol";

contract PublicSaleTest is Test {
    PublicSale sale;

    function setUp() public {
        sale = (new PublicSaleScript()).deploy();
    }

    function testSetup() external view {
        assertEq(sale.dai(), 0x6B175474E89094C44Da98b954EedeAC495271d0F);
        assertEq(sale.usdt(), 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
        assertEq(sale.usdc(), 0xdAC17F958D2ee523a2206206994597C13D831ec7);
        assertEq(address(sale.token()), 0xA0084063Ea01D5F09E56EF3fF6232A9e18B0BACD);
        assertEq(address(sale.priceFeed()), 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
    }
}