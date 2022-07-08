default:
	@echo "run \"make test\" to run all tests"

test:
	npx hardhat test "contracts/1. CoinFlip/CoinFlip.test.ts"
	npx hardhat test "contracts/2. Delegation/Delegation.test.ts"
	npx hardhat test "contracts/3. Force/Force.test.ts"
	npx hardhat test "contracts/4. Vault/Vault.test.ts"
	npx hardhat test "contracts/5. King/King.test.ts"
	npx hardhat test "contracts/6. Reentrance/Reentrance.test.ts"
	npx hardhat test "contracts/7. Denial/Denial.test.ts"