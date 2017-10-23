#! /bin/sh
# ==============================================================================
# Simple tap-networking for IncludeOS on Qemu
# ==============================================================================

# The name of the bridge VM's are added to

if [ -n $INCLUDEOS_BRIDGE ]
then
    BRIDGE=$INCLUDEOS_BRIDGE
else    
   BRIDGE="bridge43"
fi

if [ -n "$1" ];then
    
    ifconfig $1 down

    if uname -s | grep Darwin > /dev/null 2>&1; then
        ifconfig $BRIDGE deletem $1
    else
        brctl delif $BRIDGE $1
    fi
    exit 0

else
    echo "Error: no interface specified"
    exit 1
fi
