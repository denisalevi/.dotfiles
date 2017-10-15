# This shell script prepends your environment variables with search paths for locating tensorflow dependencies
# The settings differ from one server to another.
#
# Save this file to your home directory
# and source it from your .bashrc file
# -----------------

CUR_HOST=`hostname`

load_cuda_env() {
    # shell function to
    # prepend PREFIXES to binary, include, library
    #
    # Returns non-zero on failure
    # Returns zero on success
    # ------------------------------------------------------------------
    retval=0

    # validate input
#    if [[ -z "$PREFIX_HOST" ]]; then
#        echo "PREFIX_HOST not set!"
#        retval=1
#    fi;
    if [[ -z "$PREFIX_CUDA" ]]; then
        echo "PREFIX_CUDA not set!"
        retval=1
    fi;
#    if [[ -z "$PREFIX_CUDNN" ]]; then
#        echo "PREFIX_CUDNN not set!"
#        retval=1
#    fi;

    if [[ "$retval" -ne 0 ]]; then
        echo "ERROR: variables not prepended!"
    else
        # prepend variables
        # binary search path
        export PATH=$PREFIX_CUDA/bin:$PATH
        #export PATH=$PREFIX_CUDA/bin:$PREFIX_HOST/bin:$PATH

        # include search paths
        #export C_INCLUDE_PATH=$PREFIX_CUDNN/include:$PREFIX_CUDA/include:$PREFIX_HOST/include:$C_INCLUDE_PATH
        #export CPLUS_INCLUDE_PATH=$PREFIX_CUDNN/include:$PREFIX_CUDA/include:$PREFIX_HOST/include:$CPLUS_INCLUDE_PATH
        #export C_INCLUDE_PATH=$PREFIX_CUDA/include:$C_INCLUDE_PATH
        #export CPLUS_INCLUDE_PATH=$PREFIX_CUDA/include:$CPLUS_INCLUDE_PATH
        export CPATH=$PREFIX_CUDA/include:$CPATH

        # library search paths
        export LIBRARY_PATH=$PREFIX_CUDA/lib64:$LIBRARY_PATH
        #export LIBRARY_PATH=$PREFIX_CUDA/lib64:$PREFIX_HOST/lib:$LIBRARY_PATH
        export LD_LIBRARY_PATH=$PREFIX_CUDA/lib64:$LD_LIBRARY_PATH
        #export LD_LIBRARY_PATH=$PREFIX_CUDNN/lib64:$PREFIX_CUDA/lib64:$PREFIX_HOST/lib:$LD_LIBRARY_PATH

        #export PKG_CONFIG_PATH=$PREFIX_HOST/lib/pkgconfig:$PKG_CONFIG_PATH
    fi;
    return "$retval"
}

if [ "$CUR_HOST" = "merope" ]; then

    #export PREFIX_HOST=/mnt/scratch/dnn/caffe_deps
    #export PREFIX_CUDA=/usr/local/cuda-6.5
    export PREFIX_CUDA=/usr/local/cuda-7.5
    #export PREFIX_CUDNN=$PREFIX_HOST/../build/cudnn-6.5
    #export PREFIX_CUDNN=/mnt/scratch/dnn/build/cudnn-7.0

    # function call
    load_cuda_env

elif [ "$CUR_HOST" = "sabik" ]; then
    #export PREFIX_HOST=/mnt/scratch/dnn/caffe_deps
    export PREFIX_CUDA=/usr/local/cuda-8.0
    #export PREFIX_CUDNN=$PREFIX_HOST/../build/cudnn-7.5
    #export PREFIX_CUDNN=/mnt/scratch/dnn/build/cudnn-7.0

    alias cuda_deviceQuery="/opt/NVIDIA_CUDA-8.0_Samples/1_Utilities/deviceQuery/deviceQuery"

    # function call
    load_cuda_env

elif [ "$CUR_HOST" = "eltanin" ]; then
    #export PREFIX_HOST=/mnt/raid/ni/dnn/install_cuda-8.0
    export PREFIX_CUDA=/usr/local/cuda-8.0
    #export PREFIX_CUDNN=$PREFIX_HOST/../build/cudnn-8.0

    alias cuda_deviceQuery="/opt/NVIDIA_CUDA-8.0_Samples/1_Utilities/deviceQuery/deviceQuery"

    # function call
    load_cuda_env

elif [ "$CUR_HOST" = "elnath" ]; then

    export PREFIX_CUDA=/usr/local/cuda-8.0

    # function call
    load_cuda_env

fi;
