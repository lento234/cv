<div align="center">

# **Curriculum Vitae**

[![CV](https://img.shields.io/badge/-PDF-red.svg?style=for-the-badge&logoColor=white&labelColor=black&logo=adobe)](https://media.githubusercontent.com/media/lento234/cv/main/cv.pdf)

![Build](https://img.shields.io/github/workflow/status/lento234/cv/Build?label=Build&style=flat-square&labelColor=000000)
![License](https://img.shields.io/github/license/lento234/cv?style=flat-square&color=blue&labelColor=000000)
![Last updated](https://img.shields.io/github/last-commit/lento234/cv?style=flat-square&labelColor=000000)

</div>

# Description

Made with :heart: using [Awesome-CV](https://github.com/posquit0/Awesome-CV), [Nord](https://www.nordtheme.com/) theme, and [Fira Sans](https://fonts.google.com/specimen/Fira+Sans) font.

* Link: [manickathan.ch/cv]()

# Setup guide

## Requirements

* **Recommended**: `docker` (`mrlento234/xelatex`).
* Alternatively, xelatex: (`texlive, texlive-base, texlive-fonts-extra, texlive-fonts-recommended, texlive-lang-english, texlive-lang-german, texlive-science, texlive-xetex`).

## Install conda environment

```
conda env create -f environment.yml
```
## Compile latex files

**Print all options**

```
$ make
all                  Build all latex files using docker
clean                Clean up
coverletter          Compile Cover Letter
cv                   Compile CV
install-apt-deps     Install dependencies
open-coverletter     Open CV pdf
open                 Open CV pdf
purge                Purge all file
```

**Make CV using docker**

```
make all
```

# References

* [Awesome-CV](https://github.com/posquit0/Awesome-CV) - Awesome CV is LaTeX template for your outstanding job application
* [Nord theme](https://www.nordtheme.com/) - An arctic, north-bluish color palette.
