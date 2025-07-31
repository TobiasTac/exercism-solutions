const ALCOHOLS = Set(["vodka", "gin", "rum", "tequila", "whiskey", "scotch", "brandy"])
const SPECIAL_INGREDIENTS = Set(["soy sauce", "tofu", "garlic", "onions", "blue cheese", "pine nuts", "pork tenderloin"])
const VEGAN = Set(["tofu", "soy sauce", "salt", "black pepper", "cornstarch", "vegetable oil", "garlic", "ginger", "water", "vegetable stock", "lemon juice", "lemon zest", "sugar"])
const VEGETARIAN = Set(["tofu", "cheese", "milk", "eggs", "salt", "butter", "vegetable oil", "garlic", "onion", "spinach", "tomato"])
const PALEO = Set(["meat", "fish", "vegetables", "fruit", "nuts", "seeds", "eggs", "herbs", "spices"])
const KETO = Set(["meat", "cheese", "butter", "olive oil", "avocado", "eggs", "fish", "low-carb vegetables"])
function clean_ingredients(dish_name, dish_ingredients)
    return (dish_name, Set(dish_ingredients))
end
function check_drinks(drink_name, drink_ingredients)
    for i in drink_ingredients
        if i in ALCOHOLS
            return "$drink_name Cocktail"
        end
    end
    return "$drink_name Mocktail"
end
function categorize_dish(dish_name, dish_ingredients)
    if dish_ingredients ⊆ VEGAN
        return "$dish_name: VEGAN"
    elseif dish_ingredients ⊆ VEGETARIAN
        return "$dish_name: VEGETARIAN"
    elseif dish_ingredients ⊆ PALEO
        return "$dish_name: PALEO"
    elseif dish_ingredients ⊆ KETO
        return "$dish_name: KETO"
    else
        return "$dish_name: OMNIVORE"
    end
end
function tag_special_ingredients(dish)
    name, ingredients = dish
    return (name, Set(i for i in ingredients if i in SPECIAL_INGREDIENTS))
end
function compile_ingredients(dishes)
    result = Set{String}()
    for d in dishes
        union!(result, d)
    end
    return result
end
function separate_appetizers(dishes, appetizers)
    return sort(collect(setdiff(Set(dishes), Set(appetizers))))
end
function singleton_ingredients(dishes, intersection)
    all_ingredients = Set{String}()
    for dish in dishes
        union!(all_ingredients, dish)
    end
    return setdiff(all_ingredients, intersection)
end