function twofer(name::String="")::String
    if isempty(name)
        return "One for you, one for me."
    else
        return "One for $(name), one for me."
    end
end