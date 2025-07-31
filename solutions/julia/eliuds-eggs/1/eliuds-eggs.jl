
function eggcount(number::Int)::Int
count = 0
while number > 0
    if number % 2 == 1
        count += 1
    end
    number = number ÷ 2
end

return count

end
