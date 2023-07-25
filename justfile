set dotenv-load

alias d := deploy
alias b := build
alias t := test
default_rpc := 'local'
first_address := '0x0E2B0838c33e5cE63101B0FBdf86b011bd1C649D'

build:
    forge build

test:
    forge test

deploy NETWORK=default_rpc:
    forge create CoolNft --mnemonic=.mnemonic --rpc-url={{NETWORK}} --verifier etherscan

mint TO ADDRESS=first_address NETWORK=default_rpc:
    cast send --mnemonic=.mnemonic --rpc-url={{NETWORK}} {{ADDRESS}} "mint(address)(uint256)" {{TO}}

verify ADDRESS:
    forge verify-contract -e $ETHERSCAN_API {{ADDRESS}} CoolNft --verifier-url https://api-sepolia.etherscan.io/api
