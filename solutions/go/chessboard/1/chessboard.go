package chessboard

// Declare a type named File which stores if a square is occupied by a piece - this will be a slice of bools
type File []bool

// Declare a type named Chessboard which contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string]File

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) int {
	f, found := cb[file]

    if !found {
        return 0
    }

    occupiedCount := 0
    for _, squareOccupied := range f {
        if squareOccupied {
            occupiedCount++
        }
    }
    return occupiedCount
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) int {
	if rank < 1 || rank > 8 {
        return 0
    }

    occupiedCount := 0
    rankIndex := rank - 1

    for _, file := range cb {
        if rankIndex >= 0 && rankIndex < len(file) {
            if file[rankIndex] {
                occupiedCount++
            }
        }
    }
    return occupiedCount
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
	totalSquares := 0

    for _, file := range cb {
        totalSquares += len(file)
    }
    return totalSquares
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
	totalOccupiedSquares := 0

    for _, file := range cb {
        for _, squareOccupied := range file {
            if squareOccupied {
                totalOccupiedSquares++
            }
        }
    }
    return totalOccupiedSquares
}
