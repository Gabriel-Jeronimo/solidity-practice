import {
    time,
    loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";

describe("Lock", function () {
    // We define a fixture to reuse the same setup in every test.
    // We use loadFixture to run this setup once, snapshot that state,
    // and reset Hardhat Network to that snapshot in every test.
    async function deployEscrow() {
        const [owner, otherAccount] = await ethers.getSigners();


        const Escrow = await ethers.getContractFactory("Escrow");
        const escrow = await Escrow.deploy();

        return { escrow, owner, otherAccount };
    }

    describe("Escrow", function () {
        it("Should fund a payee", async function () {
            const { escrow, owner, otherAccount } = await loadFixture(deployEscrow);

        });
    });

});
