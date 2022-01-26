## Usage

Run `./benchmark.sh`

## Results

```
Compare old and new eval mode for Nix 2.6, sys1
==============================================
Benchmark 1: oldEvalMode $nix_2_6 "$sys1"
  Time (mean ± σ):      1.613 s ±  0.017 s    [User: 1.539 s, System: 0.165 s]
  Range (min … max):    1.596 s …  1.630 s    3 runs

Benchmark 2: newEvalMode $nix_2_6 "$sys1"
  Time (mean ± σ):      2.317 s ±  0.042 s    [User: 1.678 s, System: 0.546 s]
  Range (min … max):    2.281 s …  2.362 s    3 runs

Summary
  'oldEvalMode $nix_2_6 "$sys1"' ran
    1.44 ± 0.03 times faster than 'newEvalMode $nix_2_6 "$sys1"'

Compare old and new eval mode for Nix 2.6, sys2
==============================================
Benchmark 1: oldEvalMode $nix_2_6 "$sys2"
  Time (mean ± σ):      2.387 s ±  0.031 s    [User: 2.407 s, System: 0.192 s]
  Range (min … max):    2.352 s …  2.413 s    3 runs

Benchmark 2: newEvalMode $nix_2_6 "$sys2"
  Time (mean ± σ):      3.867 s ±  0.018 s    [User: 2.528 s, System: 1.141 s]
  Range (min … max):    3.847 s …  3.884 s    3 runs

Summary
  'oldEvalMode $nix_2_6 "$sys2"' ran
    1.62 ± 0.02 times faster than 'newEvalMode $nix_2_6 "$sys2"'

Compare old eval mode for Nix 2.3, 2.4, 2.6, sys1
======================================
Benchmark 1: oldEvalMode $nix_2_3 "$sys1"
  Time (mean ± σ):      1.770 s ±  0.007 s    [User: 1.677 s, System: 0.161 s]
  Range (min … max):    1.763 s …  1.775 s    3 runs

Benchmark 2: oldEvalMode $nix_2_4 "$sys1"
  Time (mean ± σ):      1.930 s ±  0.020 s    [User: 1.846 s, System: 0.157 s]
  Range (min … max):    1.917 s …  1.953 s    3 runs

Benchmark 3: oldEvalMode $nix_2_6 "$sys1"
  Time (mean ± σ):      1.643 s ±  0.003 s    [User: 1.579 s, System: 0.160 s]
  Range (min … max):    1.641 s …  1.647 s    3 runs

Summary
  'oldEvalMode $nix_2_6 "$sys1"' ran
    1.08 ± 0.00 times faster than 'oldEvalMode $nix_2_3 "$sys1"'
    1.17 ± 0.01 times faster than 'oldEvalMode $nix_2_4 "$sys1"'


```
