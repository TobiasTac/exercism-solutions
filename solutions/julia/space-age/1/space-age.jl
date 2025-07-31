const EARTH_YEAR_SECONDS = 31557600.0


const MERCURY_ORBITAL_PERIOD = 0.2408467
const VENUS_ORBITAL_PERIOD   = 0.61519726
const MARS_ORBITAL_PERIOD    = 1.8808158
const JUPITER_ORBITAL_PERIOD = 11.862615
const SATURN_ORBITAL_PERIOD  = 29.447498
const URANUS_ORBITAL_PERIOD  = 84.016846
const NEPTUNE_ORBITAL_PERIOD = 164.79132


function onEarth(seconds)
    return seconds / EARTH_YEAR_SECONDS
end


function onMercury(seconds)
    return onEarth(seconds) / MERCURY_ORBITAL_PERIOD
end


function onVenus(seconds)
    return onEarth(seconds) / VENUS_ORBITAL_PERIOD
end


function onMars(seconds)
    return onEarth(seconds) / MARS_ORBITAL_PERIOD
end


function onJupiter(seconds)
    return onEarth(seconds) / JUPITER_ORBITAL_PERIOD
end


function onSaturn(seconds)
    return onEarth(seconds) / SATURN_ORBITAL_PERIOD
end


function onUranus(seconds)
    return onEarth(seconds) / URANUS_ORBITAL_PERIOD
end


function onNeptune(seconds)
    return onEarth(seconds) / NEPTUNE_ORBITAL_PERIOD
end
