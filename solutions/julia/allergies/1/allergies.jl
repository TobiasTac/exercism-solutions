const ALLERGEN_VALUES = Dict{Int, String}(
    1    => "eggs",
    2    => "peanuts",
    4    => "shellfish",
    8    => "strawberries",
    16   => "tomatoes",
    32   => "chocolate",
    64   => "pollen",
    128  => "cats"
)

const ALLERGEN_NAMES_TO_VALUES = Dict{String, Int}(
    "eggs"         => 1,
    "peanuts"      => 2,
    "shellfish"    => 4,
    "strawberries" => 8,
    "tomatoes"     => 16,
    "chocolate"    => 32,
    "pollen"       => 64,
    "cats"         => 128
)

function allergic_to(score::Int, allergen::String)::Bool
    allergen_value = get(ALLERGEN_NAMES_TO_VALUES, allergen, 0)
    if allergen_value == 0
        return false
    end
    return (score & allergen_value) == allergen_value
end

function allergy_list(score::Int)::Set{String}
    person_allergies_set = Set{String}()

    for value in sort(collect(keys(ALLERGEN_VALUES)))
        name = ALLERGEN_VALUES[value]
        if (score & value) == value
            push!(person_allergies_set, name)
        end
    end
    return person_allergies_set
end

