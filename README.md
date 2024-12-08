# Exploratory Data Analysis

Repository for the project submission required by the module T3INF4333 "Grundlagen Data Science" held in 2024 by
[Lothar B. Blum](mailto:blum@blumdesign.eu) at the [DHBW Stuttgart](https://dhbw-stuttgart.de/).
The task requires creating
an [exploratory data analysis as an R notebook](https://hfxbse.github.io/dhbw-data-analysis/).

## Development

All required dependencies are managed as [Nix flake](https://wiki.nixos.org/wiki/Flakes).
To compile the R notebook to an HTML site, run

```sh
echo "rmarkdown::render('main.Rmd')" | nix develop --command R --slave
```

This will get you the same result as the online version.

[JetBrain provides a plugin for R development](https://www.jetbrains.com/help/pycharm/r-plugin-support.html).
To use the same R installation specified in the Nix flake, make sure to add the R bash script as your R interpreter.
This approach should work for every other development tool, although it is not tested.
