# Test for interactive shell
test -s ~/.alias && . ~/.alias || true

# Colors and shortcuts
alias ls='ls -G'
alias ll='ls -l'
alias l='ls'
alias la='ls -la'

# python
PYTHONPATH="$HOME/anaconda/pkgs:$PYTHONPATH"
PYTHONPATH="$HOME/mixtape/Mixtape:$PYTHONPATH"

# OpenSUSE's default PATH is kind of annoying
PATH=/usr/sbin:/sbin:$PATH

# Exciting command prompt
success () {
  if [ $? == 0 ]; then
    echo 
  fi
}
#PS1="\`if [ \$? = 0 ]; then echo \\[\e[32m\]^_^\\[\e[0m\]; else echo \\[\e[31m\]o_O\[\e[0m\]; fi\`[\u@\h:\w]\\$ "
PROMPT_COMMAND=set_prompt
set_prompt () {
  local ret=$?
  local green=$(tput setaf 2)
  local red=$(tput setaf 1)
  local reset=$(tput sgr0)
  if [[ "$ret" != 0 ]]; then
    PS1="\[$red\]o_O\[$reset\]"
  else
    PS1="\[$green\]^_^\[$reset\]"
  fi
  PS1="$PS1[\u@\h:\w]\\$ "
}

# AMBER (oops)
export AMBERHOME="" 

# Parallel stuff
#export MPI_HOME=/server-home1/rbetz/mpich_3_gnu
export MPI_HOME=/server-home1/rbetz/mpich2-1.4.1p1-gnu
export PATH=$MPI_HOME/bin/:$PATH
export INCLUDE=$MPI_HOME/include/:$INCLUDE
export C_INCLUDE_PATH=$MPI_HOME/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=$MPI_HOME/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=$MPI_HOME/lib/:$LD_LIBRARY_PATH

#export OMP_NUM_THREADS=2

# CUDA things
export CUDA_HOME=/usr/local/cuda
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$CUDA_HOME/lib:$LD_LIBRARY_PATH

# Useful things I don't like to type often
alias plot=$AMBERHOME/AmberTools/src/paramfit/scripts/plot_energy.x
alias dplot=$AMBERHOME/AmberTools/src/paramfit/scripts/scatterplots.sh
alias proj="cd ~/Projects/adaptive_timestep/validation/energy_conservation/Myoglobin"

# Useful function for coding
wh() {
  if ls *.c &> /dev/null; then
    grep -ni "$1" *.c
  fi
  if ls *.h &> /dev/null; then
    grep -ni "$1" *.h
  fi
  if ls *.F90 &> /dev/null; then
    grep -ni "$1" *.F90
  fi
  if ls *.cpp &> /dev/null; then
    grep -ni "$1" *.cpp
  fi
  if ls *.cu &> /dev/null; then
    grep -ni "$1" *.cu
  fi
}
