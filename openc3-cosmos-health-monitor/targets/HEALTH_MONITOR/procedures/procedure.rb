# Script Runner test script
cmd("HEALTH_MONITOR EXAMPLE")
wait_check("HEALTH_MONITOR STATUS BOOL == 'FALSE'", 5)
