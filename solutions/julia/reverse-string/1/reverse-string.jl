import Unicode

function myreverse(s::AbstractString)
    
    grapheme_iterator = Unicode.graphemes(s)

    
    
    
    graphemes_vector = collect(grapheme_iterator)

    
    reversed_graphemes = reverse(graphemes_vector)

    
    return join(reversed_graphemes)
end
