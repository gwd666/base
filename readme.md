# R 3.x for Windows (retired) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/rwinlib/base)](https://ci.appveyor.com/project/jeroen/base)

> Scripts used to build R 3.3.x - 3.6.x on Windows

## __Important:__ retirement notice

This repository was used to build daily R-devel installers and official R releases of R 3.3 - 3.6. As of R version 4.0 (April 2020), we have switched to a new build system based on rtools40, found here: https://github.com/r-windows/r-base. 

The current repository will be kept around for historical purposes (and it may still work) but is no longer maintained.

## Local Requirements

Building R on Windows requires the following tools:

 - [Rtools 3.5](https://cran.r-project.org/bin/windows/Rtools/) compiler toolchain
 - Recent [MiKTeX](https://miktex.org/) + packages `fancyvrb`, `inconsolata`, `epsf`, `mptopdf`, `url`
 - [Inno Setup](http://www.jrsoftware.org/isdl.php) to build the installer
 - Perl such as [Strawberry Perl](http://strawberryperl.com/)

Each of these can also be installed using [chocolatey](https://chocolatey.org/):

```
choco install rtools --version=3.5.0.4
choco install miktex
choco install innosetup
choco install strawberryperl
```

Alternatively, the [appveyor-tools.ps1](scripts/appveyor-tool.ps1) powershell script can also be used for unattended installation of these tools.

## Building

To build manually first clone this repository plus dependencies:

```
git clone https://github.com/rwinlib/base
cd base
git submodule update --init
```

Running `build-r-devel.bat` or `build-r-patched.bat` will automatically download the latest [R-devel.tar.gz](https://stat.ethz.ch/R/daily/R-devel.tar.gz) or [R-patched.tar.gz](https://stat.ethz.ch/R/daily/R-patched.tar.gz) and start the build.

```
build-r-devel.bat
```

The [appveyor.yml](appveyor.yml) file has more details.

## AppVeyor Deployment

This repository is used for daily builds on [appveyor](https://ci.appveyor.com/project/jeroen/base) which get deployed on the [ftp server](https://ftp.opencpu.org). See [appveyor.md](appveyor.md) and [appveyor.yml](appveyor.yml) for configuration details.


## Release Steps

For release manager:

 - Uncomment and update the release url in `appveyor.yml`
 - Commit to temp branch, tag release locally and push tag to GH.
 - Download artifact from AppVeyor. Edit tag to attach zip and release.
 - Create new dir in `base/old/` on the FTP and unzip the files
 - Rename `md5sum.txt` file and copy files to `base/`
 - Copy (dont symlink) `R-x.y.z-win.exe` to `R-x.y.zpatched-win.exe` as placeholder until R-patched is uploaded tomorrow

