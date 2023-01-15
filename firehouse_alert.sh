#!/bin/bash

echo "Tone alert recieved"

#Common GPIO access path
BASE_GPIO_PATH=/sys/class/gpio

#PIN NUM
LEGACY_LIGHT_RELAY=10 #Controls old rotating lights via timer/relay trigger

#NAMES TO STATES
ON="1"
OFF="0"

#Utility function to export pin if not already exported

exportPin()
{
if [ ! -e $BASE_GPIO_PATH/gpio$1 ]; then
echo "$1" > $BASE_GPIO_PATH/export
fi
}

setOutput()
{
echo "out" > $BASE_GPIO_PATH/gpio$1/direction
}

setTriggerState()
{
echo $2 > $BASE_GPIO_PATH/gpio$1/value
}

resetTriggerStates()
{
setTriggerState $LEGACY_LIGHT_RELAY $OFF
}

shutdown()
{
echo "Tones recieved and proccessed, program terminated"
resetTriggerStates
exit 0
}

#Export pins for use
exportPin $LEGACY_LIGHT_RELAY

#Set pins into output mode
setOutput $LEGACY_LIGHT_RELAY

#Ensure trigger states are off prior to activation
resetTriggerStates

#Tone Activation
echo "LEGACY RELAY PIN ACTIVE"
setTriggerState $LEGACY_LIGHT_RELAY $ON
sleep 2
echo "LEGACY RELAY PIN INACTIVE"
setTriggerState $LEGACY_LIGHT_RELAY $OFF
shutdown
