# repo100

**A curated collection of meta-regression–ready datasets** (currently **142** sets).

Each dataset is a CSV with `yi`, `vi`, `measure`, and harmonized moderators in `inst/extdata/metareg/`.
See `_manifest.csv` for a summary and provenance.

> **Note:** most datasets are directly `metafor::rma()`-ready, but a minority of
> parameter-estimate tables (e.g. fixed lavaan/SEM parameters) contain rows with
> `vi == 0` (a fixed estimate has `se == 0`, so `vi = se^2 = 0`). `rma()` gives
> such rows infinite weight, so filter to `vi > 0` before fitting (see quick start).

## Install

```r
remotes::install_github('mahmood789/repo100')
```

## Quick start

```r
m <- metareg_manifest()
head(m[, c('dataset_id','k','measure','n_mods')])
ids <- metareg_datasets()
d  <- metareg_read(ids[1])
d  <- subset(d, is.finite(vi) & vi > 0)  # drop fixed-parameter rows (vi == 0)
metafor::rma(yi, vi, data = d)
```

## Licensing
- Package code: MIT.
- Datasets: CC-BY-4.0 unless otherwise indicated in `_manifest.csv` (`repo_license`).
