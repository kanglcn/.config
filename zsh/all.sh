# configuration which need to work for both terminal and GUI.

# WPS Office
#export QT_IM_MODULE=fcitx5

export PATH=${PATH}:~/.gem/ruby/2.7.0/bin

# remove GTK_MODULES 
#unset GTK_MODULES

# cuda
export C_INCLUDE_PATH=${C_INCLUDE_PATH}:/opt/cuda/include
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:/opt/cuda/include
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/opt/cuda/lib64
export LIBRARY_PATH=${LIBRARY_PATH}:/opt/cuda/lib64
export GLPATH=/usr/lib
# export VULKAN_SDK_PATH=/usr/lib/libvulkan.so
# pyre
export PYTHONPATH=${PYTHONPATH}:~/.local/pyre/packages
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:~/.local/pyre/lib
export LIBRARY_PATH=${LIBRARY_PATH}:~/.local/pyre/lib
export C_INCLUDE_PATH=${C_INCLUDE_PATH}:~/.local/pyre/include
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:~/.local/pyre/include
export PATH=${PATH}:~/.local/pyre/bin

# pyre
export PYTHONPATH=${PYTHONPATH}:~/.local/altar/packages
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:~/.local/altar/lib
export LIBRARY_PATH=${LIBRARY_PATH}:~/.local/altar/lib
export C_INCLUDE_PATH=${C_INCLUDE_PATH}:~/.local/altar/include
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:~/.local/altar/include
export PATH=${PATH}:~/.local/altar/bin

# StaMPS
source ~/.config/zsh/StaMPS_CONFIG.bash

# trelis or cubit
export PATH=${PATH}:~/opt/Coreform-Cubit-2020.2/bin
alias cubit='cd ~/opt/Coreform-Cubit-2020.2/bin/; ./coreform_cubit; cd -'

# systemctl start runsunloginclient
