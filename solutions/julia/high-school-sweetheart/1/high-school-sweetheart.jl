function cleanupname(name)
    return strip(replace(name, '-' => ' '))
end

function firstletter(name)
    return string(first(cleanupname(name)))
end

function initial(name)
    return uppercase(firstletter(name)) * "."
end

function couple(name1, name2)
    initial1 = initial(name1)
    initial2 = initial(name2)
    return "❤ $initial1  +  $initial2 ❤"
end
