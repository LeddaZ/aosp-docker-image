# aosp-docker-image

Ubuntu 22.04 LTS Docker image to build AOSP based ROMs. Aimed at custom ROMs, might not work for pure AOSP. Based on [Google's Docker image](https://android.googlesource.com/platform/build/+/master/tools/docker) and the [LineageOS build guide](https://wiki.lineageos.org/devices/bacon/build) (I chose a random device).

## How to use

### Build the image
```
$ git clone https://github.com/LeddaZ/aosp-docker-image
$ cd aosp-docker-image
$ cp ~/.gitconfig gitconfig
$ sudo docker build --build-arg userid=$(id -u) --build-arg groupid=$(id -g) --build-arg username=$(id -un) -t aosp-docker-image .
```

### Run it
```
# NOTE: $ANDROID_BUILD_TOP will be set after you run . build/envsetup.sh in your source dir.
$ sudo docker run -it --rm -v $ANDROID_BUILD_TOP:/src aosp-docker-image
# You'll find your ROM source in /src.
```
