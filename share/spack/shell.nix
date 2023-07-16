{ pkgs ? (import <nixpkgs> {}) }:

#with pkgs; stdenv.mkDerivation {
pkgs.stdenv.mkDerivation rec {
  name = "spack-shell";
  buildInputs = with pkgs; [
    gcc
    gcc11
    python3
    gnupg

    # fortran compiler not exposed by standard environment
    gfortran
    #gfortran.cc
    gfortran.cc.lib
    gfortran11
    gfortran11.cc.lib

    llvmPackages_12.libcxxClang

    # external packages to pass to spack
    perl
    openjdk11_headless
    bazel_4

    unzip
    git
    tig
    htop

    cudatoolkit linuxPackages.nvidia_x11
    libGLU libGL
    xorg.libXi xorg.libXmu freeglut
    xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib
    cmake
  ];
  shellHook = ''

    export CUDA_PATH=${pkgs.cudatoolkit}
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}"
    export EXTRA_LDFLAGS="-L/lib -L${pkgs.linuxPackages.nvidia_x11}/lib"
   #export EXTRA_CCFLAGS="-I/usr/include -L${pkgs.linuxPackages.nvidia_x11}/lib"


    source ${toString ./.}/setup-env.sh
    mkdir -p ${toString ../..}/spack_tmp
    export TMPDIR=${toString ../..}/spack_tmp
    spack compiler find
    spack external find openjdk
    spack external find bazel
    spack external find perl
    spack external find cuda
    spack external find cmake

  '';
}
    #export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath buildInputs}"
