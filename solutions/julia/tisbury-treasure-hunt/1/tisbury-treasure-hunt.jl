function get_coordinate(line)
    return line[2]
end

function convert_coordinate(coordinate)
    return (coordinate[1], coordinate[2])
end

function compare_records(azara_record, rui_record)
    azara_coord_str = get_coordinate(azara_record)
    azara_coord_tuple = convert_coordinate(azara_coord_str)
    rui_coord_tuple = rui_record[2]
    
    return azara_coord_tuple == rui_coord_tuple
end

function create_record(azara_record, rui_record)
    if compare_records(azara_record, rui_record)
        coordinate = get_coordinate(azara_record)
        location = rui_record[1]
        quadrant = rui_record[3]
        treasure = azara_record[1]
        
        return (coordinate, location, quadrant, treasure)
    else
        return ()
    end
end
