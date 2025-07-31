package lasagna

// TODO: define the 'PreparationTime()' function
func PreparationTime(layers []string, time int) int {
    if time == 0 {
        time = 2
    }
    return len(layers) * time
}


// TODO: define the 'Quantities()' function
func Quantities(layers []string) (int, float64) {
    noodlesNeeded := 0
    sauceNeeded := 0.0

    noodlesPerLayer := 50
    saucePerLayer := 0.2

    for _, layer := range layers {
        switch layer {
            case "sauce":
            	sauceNeeded += saucePerLayer
            case "noodles":
            	noodlesNeeded += noodlesPerLayer
        }
    }
    return noodlesNeeded, sauceNeeded
}

// TODO: define the 'AddSecretIngredient()' function
func AddSecretIngredient(friendsList, myList []string) []string {
    myList[len(myList) - 1] = friendsList[len(friendsList) - 1]
    return myList
}

// TODO: define the 'ScaleRecipe()' function
func ScaleRecipe(quantities []float64, portions int) []float64{
	scaledQuantities := make([]float64, len(quantities))
    
    scalingFactor := float64(portions) / 2.0

    for i, quantity := range quantities {
        scaledQuantities[i] = quantity * scalingFactor
    }
    return scaledQuantities
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
// 
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more 
// functionality.
