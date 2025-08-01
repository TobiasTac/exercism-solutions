function message(msg)
    separator = findfirst(": ", msg)

    if separator !== nothing
        msgStart = separator[end] + 1
        extracted = msg[msgStart:end]

        return strip(extracted)
    else
        return strip(msg)
    end
end

function log_level(msg)
    open = findfirst('[', msg)
    close = findfirst(']', msg)

    if open !== nothing && close !== nothing && open[1] < close[1]
        levelStr = msg[open[1]+1 : close[1]-1]
        return lowercase(levelStr)
    else
        
        return ""
    end
end

function reformat(msg)
    msgPart = message(msg)

    levelPart = log_level(msg)

    return "$msgPart ($levelPart)"
end
