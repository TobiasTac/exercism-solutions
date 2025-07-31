struct InvalidPosition <: Exception end

struct Queen
    row::Int
    col::Int

    
    function Queen(row, col)
        
        if !(0 <= row <= 7 && 0 <= col <= 7)
            throw(InvalidPosition())
        end
        new(row, col)
    end
end


function canattack(white::Queen, black::Queen)
    
    if white.row == black.row && white.col == black.col
        throw(ArgumentError("Queens cannot be on the same square"))
    end

    
    on_same_row = white.row == black.row

    
    on_same_col = white.col == black.col

    
    
    
    on_same_diag = abs(white.row - black.row) == abs(white.col - black.col)

    
    return on_same_row || on_same_col || on_same_diag
end
