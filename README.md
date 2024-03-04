# Steps to Reproduce

1. 
```
git clone git@github.com:sam-goldman/sender-bug.git
```

2. 
```
cd sender-bug && forge install
```

3. 
```
forge script script/Counter.s.sol
```
You will see the script logs the correct contract address `0x5FbDB2315678afecb367f032d93F642f64180aa3` which is correct.

4. 
```
forge script script/Counter.s.sol --sender 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```
You will see the logged contract address is different when using the `--sender` flag.

## Expected Outcome

Notice that the --sender is the same address that's broadcasting the deployment, so the deployed contract's address should be the same.

## Actual Outcome

The logged address is different. Specifically, the logged contract address is calculated using a sender nonce of 1, which you can verify with the command:
```
cast compute-address 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --nonce 1
```


### Using `vm.prank`
The above example uses `vm.broadcast()`, but the bug also occurs when using `vm.prank()`.

Adding `--sender` to the original command and using `vm.prank` instead of `vm.broadcast` results in a contract address of `0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0`, which is also not correct, and is different from the address created by `vm.broadcast` above.

Run `Counter2.s.sol`, which is the same as the previous script, except it uses `vm.prank`:

```
forge script script/Counter2.s.sol --sender 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
```

The logged contract address is calculated using a sender nonce of 2, which you can verify with the command:
```
cast compute-address 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 --nonce 2
```
