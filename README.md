# hello-world

A minimal Foundry-based ERC-20 project for the TOPASU token, with deployment and verification guidance for BNB Smart Chain.

## Prerequisites

- Foundry: https://book.getfoundry.sh/
- A wallet funded with BNB for deployment
- An RPC endpoint for BSC Testnet or BSC Mainnet
- A BscScan API key for source verification

## Quick start

```bash
forge --version
forge build
```

## Environment variables

Create a local `.env` file and keep it out of version control:

```bash
PRIVATE_KEY=your_private_key_here
OWNER_ADDRESS=0xYourWalletAddressHere
INITIAL_SUPPLY=1000000000000000000000
RPC_URL=https://bsc-testnet.public.bnbstatic.com
ETHERSCAN_API_KEY=your_bscscan_api_key
```

Use `.env.example` as a template.

## Contract

The token is implemented in `src/TOPASU.sol` and mints the initial supply to the configured owner during deployment.

## Deployment

### BSC Testnet

```bash
source .env
forge script script/DeployTOPASU.s.sol \
  --rpc-url "$RPC_URL" \
  --private-key "$PRIVATE_KEY" \
  --broadcast \
  --verify \
  --etherscan-api-key "$ETHERSCAN_API_KEY"
```

### BSC Mainnet

```bash
source .env
forge script script/DeployTOPASU.s.sol \
  --rpc-url "$RPC_URL" \
  --private-key "$PRIVATE_KEY" \
  --broadcast \
  --verify \
  --etherscan-api-key "$ETHERSCAN_API_KEY"
```

## Confirming deployment

After the broadcast completes, record the deployed address and check that the contract responds correctly:

```bash
cast call <DEPLOYED_CONTRACT_ADDRESS> "name()" --rpc-url "$RPC_URL"
cast call <DEPLOYED_CONTRACT_ADDRESS> "symbol()" --rpc-url "$RPC_URL"
cast call <DEPLOYED_CONTRACT_ADDRESS> "totalSupply()" --rpc-url "$RPC_URL"
```

## Etherscan verification

### BSC Testnet

```bash
forge verify-contract \
  <DEPLOYED_CONTRACT_ADDRESS> \
  src/TOPASU.sol:TOPASU \
  --chain-id 97 \
  --verifier-url https://api-testnet.bscscan.com/api \
  --etherscan-api-key "$ETHERSCAN_API_KEY"
```

### BSC Mainnet

```bash
forge verify-contract \
  <DEPLOYED_CONTRACT_ADDRESS> \
  src/TOPASU.sol:TOPASU \
  --chain-id 56 \
  --verifier-url https://api.bscscan.com/api \
  --etherscan-api-key "$ETHERSCAN_API_KEY"
```

## PancakeSwap V2 liquidity setup

After a successful deployment and source verification:

1. Approve the token for the router
2. Add liquidity on PancakeSwap V2 with BNB or a stable asset
3. Record the LP pair address
4. Lock LP tokens using a trusted locker or a documented time-lock process
5. Preserve transaction hashes and lock confirmation records

## Audit-ready evidence

Before listing, marketing activity, or audit submission, maintain:

- Verified contract source URL
- Deployment transaction hash
- Contract address
- Constructor arguments
- Tokenomics summary
- Wallet ownership and lock/burn records
- Liquidity and LP locker evidence

## Security and hygiene

- Never commit private keys
- Never track `.env` files in git
- Keep local environment variables outside the repo
- Review constructor parameters carefully before production deployment

## Typical commands

```bash
forge build
forge test
forge script script/DeployTOPASU.s.sol --rpc-url "$RPC_URL" --private-key "$PRIVATE_KEY" --broadcast
```
