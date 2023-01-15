# firehouse-alert
Firehouse Alert Project

Notes
 - Intended to be used by IAmResponding's TwoToneDetect software on a Raspberry Pi
 - Configure your Raspberry Pi to reboot once a day (crontab -e command)
 - Put shell script in root directory, make executable
 - Call shell script from TTD tone config section
 - Triggers Pi pin 10 (which acts as trigger signal for an external timer relay board)
