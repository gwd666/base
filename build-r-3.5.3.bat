if not exist "R-latest.tar.gz" (
powershell -Command "Invoke-WebRequest https://cran.r-project.org/src/base/R-latest.tar.gz -Proxy "http://proxy-lb.s-mxs.net:8080" -OutFile R-latest.tar.gz"
)
call .\scripts\build.bat R-3.5.3.tar.gz 32
call .\scripts\build.bat R-3.5.3.tar.gz 64
start %BUILDDIR%
