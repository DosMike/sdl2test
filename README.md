# SDL2 Linux Template

This is an empty template project for building SDL2 applications.

The build chain is managed by MyBCP in a gcc docker container with all the X11 dev dependencies.

To build your project run `./buildw.sh`. This will spin up a container with your
userid and groupid, so that file permissions will be correct.
The container is a one-shot image that builds and exits. System dependencies can be added in the Dockerfile.
Note that the versions for SDL dependencies need to match, or they will complain at build time about being incompatible.

If you want to, you can also use Visual Studio Code with Dev Containers.
In this case, you only need to connect into the dev container. Within
the container, open a new terminal and run `./build.sh` to build the app.

While running `./buildw.sh` outside docker is definitely possible, it can not install system dependencies for you like
the Dockerfile does in the continaer.

To accelerate subsequent builds, the conan cache directory is linked from the host workspace.

Quickly on deps:
* conan deps go into conanfile.txt and the corresponding find_package and target_link_libraries in CMakeLists.txt
* system deps require the package be listed in the Dockerfile and a container rebuild (or rock a build on your bare system)

Windows is not supported for this template, mainly because I'm no longer using Windows and thus can't test.
