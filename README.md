# quant-vi

Small option-pricing project in [Vine](https://vine.dev/). It implements a binomial tree for call and put options with early-exercise logic.

## Run

```sh
vine run quant
```

To get depth and breadth statistics to get a sense of the parallelism, run
```sh
vine run -d quant
```

## Test

```sh
vine run test --lib quant
```

## License

MIT (see `LICENSE`).
