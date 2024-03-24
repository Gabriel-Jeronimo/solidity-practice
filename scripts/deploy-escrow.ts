import { ethers } from "hardhat";

async function main() {
    const escrow = await ethers.deployContract("Escrow");

    await escrow.waitForDeployment();

    console.log(
        `Escrow contract deployed to ${escrow.target}`
    );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
