# Do not edit anything except the call(packet, buffer) function.

require 'openc3/processors/processor'

module OpenC3
    class EpsGenTlmTempProcessor < Processor

        def initialize()
            super()
            reset()
        end

        def call(packet, buffer)

            # Your Code Here to generate values to populate @results values.

            # @results is a hash, where the keys are defined by a colon followed by the desired key name.
            #   To add an item to @results, simply have a line with @results[:x] = y, 
            #       where x is the key, and y is the value (see line 23)
            #   Remember to clear the values of each key by setting it equal to nil in reset()
            #   Convention is to have all keys include the DERIVED_ prefix, to indicate the key comes from a processor.
            # You use the keys of the @results hash as the <PROCESSOR_GENERATED_ITEM> when creating derived items.

            ### TIPS ###

            # The below keys correspond to a limits state of the given color, 
            # and whether the violated limit is a limit on the high end of the range or on the low end of the range.
            # :RED_HIGH
            # :RED_LOW
            # :YELLOW_HIGH
            # :YELLOW_LOW

            # IMPORTANT: while there are both GREEN and BLUE limits bands, only YELLOW and RED are considered to be "out of limits".
            # you do not have to indicate the BLUE and GREEN limits separately from each other.
            # That is, you can just return one of three values that each correspond to, essentially, RED, YELLOW, and (GREEN or BLUE)

            # Gets all telem items that are out of limits into the array out_of_limits_items
            # NOTE: the resulting array will ONLY include those items that are out of limits - that is, in RED or YELLOW bands.
            packet.check_limits()
            out_of_limits_items = packet.out_of_limits()

            # each item in the array returned by packet.out_of_limits() is itself an array with the structure:
            # [target_name, packet_name, item.name, item.limits.state]
            # target_name == in this case, HEALTH_MONITOR
            # packet_name == in this case, STATE_OF_HEALTH
            # item.name   == the name of the telemetry item, so something like CAMERA_TEMP or RADIO_CURRENT
            # item.limits.state == what limits state the out-of-limits item is in 



        end # End call()

        # reset() is automatically called at the beginning when the processor runs, clearing out the @results hash.
        # Do not edit this function.
        def reset
            @results[:DERIVED_TEMPERATURES_STATE] = nil
            @results[:DERIVED_VOLTAGES_STATE]     = nil
            @results[:DERIVED_CURRENTS_STATE]     = nil
        end
    end
end
