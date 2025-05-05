# FundMe Smart Contract

A decentralized crowdfunding smart contract built with Foundry that allows users to fund the contract with ETH and allows the owner to withdraw the funds. The contract uses Chainlink Price Feeds to ensure a minimum funding value in USD.

## Getting Started

### Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Git](https://git-scm.com/downloads)

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/fund-me-redo
cd fund-me-redo
```

2. Install dependencies
```bash
forge install
```

### Building

```bash
forge build
```

### Testing

```bash
forge test
```

For more verbose output:
```bash
forge test -vv
```

For even more detailed output including console logs:
```bash
forge test -vvv
```

### Deployment

1. Set up your environment variables:
   Create a `.env` file and add your private key and RPC URL:
```bash
PRIVATE_KEY=your_private_key
RPC_URL=your_rpc_url
```

2. Deploy:
```bash
forge script script/DeployFundMe.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
```

## Usage

The FundMe contract provides the following main functions:

1. `fund()` - Send ETH to the contract (minimum amount in USD required)
2. `withdraw()` - Owner can withdraw all funds
3. `getPrice()` - Get the latest ETH/USD price from Chainlink
4. `getVersion()` - Get the price feed version
5. `getConversionRate()` - Convert ETH to USD

## Contract Structure

- `FundMe.sol`: Main contract containing funding and withdrawal logic
- `PriceConverter.sol`: Library for ETH/USD price conversion
- `HelperConfig.s.sol`: Helper configuration for deployments
- `DeployFundMe.s.sol`: Deployment script
- `FundMeTest.t.sol`: Test file

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)