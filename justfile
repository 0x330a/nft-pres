set dotenv-load

alias d := deploy
alias b := build
alias t := test
default_rpc := 'local'
default_address := '0x2aD6B7c51B3a60cB7bb5A0a1A8C7F3B46E30Ad18'

build:
    forge build

test:
    forge test

deploy NETWORK=default_rpc:
    forge create CoolNft --mnemonic=.mnemonic --rpc-url={{NETWORK}} --verifier etherscan

mint TO NETWORK=default_rpc ADDRESS=default_address:
    cast send --mnemonic=.mnemonic --rpc-url={{NETWORK}} {{ADDRESS}} "mint(address)(uint256)" {{TO}}

minted NETWORK=default_rpc ADDRESS=default_address:
    cast call --rpc-url={{NETWORK}} {{ADDRESS}} "tokens()(uint256)"

verify ADDRESS:
    forge verify-contract -e $ETHERSCAN_API {{ADDRESS}} CoolNft --verifier-url https://api-sepolia.etherscan.io/api
