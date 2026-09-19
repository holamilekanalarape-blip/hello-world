## Sample Pull Request Template Description

This is a sample pull request template. You can customize it to fit your project's needs.

Don't forget to commit your template file to the repository so that it can be used for future pull requests!
# Install dependencies and build
forge install
forge build

# Create .env locally; never commit it
cat > .env <<'EOF'
PRIVATE_KEY=your_deployer_private_key
OWNER_ADDRESS=0xYourOwnerAddress
INITIAL_SUPPLY=1000000000
_API_KEY=your_bscscan_api_key
EOF

source .env
forge script script/DeployTOPASU.s.sol:DeployTOPASU \
  --rpc-url https://data-seed-prebsc-1-s1.bnbchain.org:8545 \
  --chain-id 
97 \
  --broadcast \
  --verify \
  --etherscan-api-key "$BSCSCAN_API_KEY" \
  -vvvv

Confirm the deployed testnet contract, ownership, total supply, and verification before proceeding.

For BSC mainnet:

forge script script/DeployTOPASU.s.sol:DeployTOPASU \
  --rpc-url https://bsc-dataseed.binance.org \
  --chain-id 56 \
  --broadcast \
  --verify \
  --etherscan-api-key "$BSCSCAN_API_KEY" \
  -vvvv
If the script expects custom environment variables or constructor arguments, use the exact interface defined in DeployTOPASU.s.sol; do not guess them. Save the deployment output and confirm the contract on BscScan:
https://bscscan.com/address/<DEPLOYED_CONTRACT_ADDRESS>
Before adding liquidity:

1. Confirm the address is the actual 42-character deployed address.

2. Confirm BscScan shows verified source with a green checkmark.

3. Confirm OWNER_ADDRESS is correct and ownership is transferred if the script deploys under the deployer.

4. Check token decimals, total supply, minting permissions, tax/fee behavior, blacklist controls, and trading restrictions.

5. Use the same wallet holding TOPASU and BUSD/USDT to add PancakeSwap V2 liquidity.

6. Verify the LP token address and lock the LP tokens through a reputable locker.

7. Keep the transaction hashes and locker proof for audit/listing submissions.

You can check the deployer’s BNB balance before broadcasting:
cast balance "$(cast wallet address --private-key "$PRIVATE_KEY")" \
  --rpc-url https://bsc-dataseed.binance.org
Do not commit .env; add it to .gitignore:
.env
If you provide the repository owner/name and the contents of DeployTOPASU.s.sol with all secrets removed, I can determine the exact deployment command and check whether the script is ready for testnet/mainnet.