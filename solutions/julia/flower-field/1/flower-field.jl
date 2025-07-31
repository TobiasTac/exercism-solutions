function annotate(board::Vector)
    
    if isempty(board)
        return String[]
    end

    
    if !all(x -> isa(x, AbstractString), board)
        throw(ArgumentError("Board must contain only strings"))
    end
    
    
    if isempty(board[1])
        return board
    end

    
    num_cols = length(board[1])
    if !all(row -> length(row) == num_cols, board)
        throw(ArgumentError("All rows in the board must have the same length"))
    end
    num_rows = length(board)

    
    
    matrix = Matrix{Char}(undef, num_rows, num_cols)
    for r in 1:num_rows
        
        matrix[r, :] = collect(board[r])
    end

    
    output_matrix = copy(matrix)

    
    for r in 1:num_rows, c in 1:num_cols
        
        if matrix[r, c] == ' '
            flower_count = 0
            
            for dr in -1:1, dc in -1:1
                if dr == 0 && dc == 0
                    continue
                end

                nr, nc = r + dr, c + dc

                
                
                if checkbounds(Bool, matrix, nr, nc) && matrix[nr, nc] == '*'
                    flower_count += 1
                end
            end

            
            if flower_count > 0
                output_matrix[r, c] = string(flower_count)[1]
            end
        end
    end

    
    return [join(output_matrix[r, :]) for r in 1:num_rows]
end
