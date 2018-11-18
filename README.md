
# vzlogger docker image for Raspberry Pi

[vzlogger](https://github.com/volkszaehler/vzlogger) is a software
that reads measurements from a variety of smart meters. This is docker
image builds `vzlogger` from its sources and runs it. 

To build for amd64 run the build with `--build-arg BUILD_IMAGE=debian:jessie`

The image expects the configuration for `vzlogger` in
`/etc/vzlogger.conf`. Use the `-v` option to run the image with your
own configuration file.

Run the container with `--privileged` if you need vzlogger to access
infrared readers connected as USB serial devices.

## Ideas for improvement

* use multi-stage build, compile vzlogger to static binary and have only the binary in the docker image