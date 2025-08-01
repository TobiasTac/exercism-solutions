function spiral_matrix(n::Int)
    
    if n == 0
        return Matrix{Int}(undef, 0, 0)
    end

    
    matrix = Matrix{Int}(undef, n, n)

    
    top, bottom = 1, n
    left, right = 1, n
    
    
    num = 1
    
    
    while top <= bottom && left <= right
        
        for c in left:right
            matrix[top, c] = num
            num += 1
        end
        
        top += 1

        
        for r in top:bottom
            matrix[r, right] = num
            num += 1
        end
        
        right -= 1 
        
        if top <= bottom
            for c in right:-1:left
                matrix[bottom, c] = num
                num += 1
            end
            
            bottom -= 1
        end
        
        if left <= right
            for r in bottom:-1:top
                matrix[r, left] = num
                num += 1
            end
            
            left += 1
        end
    end

    return matrix
end