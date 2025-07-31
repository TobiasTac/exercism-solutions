function matrix(strmatrix::AbstractString)
    
    row_strings = filter(!isempty, split(strmatrix, '\n'))

    
    if isempty(row_strings)
        return [], []
    end  
    
    rows = [[parse(Int, num_str) for num_str in split(row_str)] for row_str in row_strings]
    
    num_rows = length(rows)
    num_cols = length(rows[1]) 
        
    columns = [[rows[r][c] for r in 1:num_rows] for c in 1:num_cols]
    
    
    return rows, columns
end
