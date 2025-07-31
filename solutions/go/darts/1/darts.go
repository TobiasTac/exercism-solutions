package darts

// Score calcula os pontos ganhos em um único lançamento de dardo.
// x e y são as coordenadas cartesianas onde o dardo aterrissou.
func Score(x, y float64) int {
	// Calcula a distância ao quadrado do ponto (x, y) até a origem (0, 0).
	// dist^2 = x^2 + y^2
	distSq := x*x + y*y

	// Define os raios ao quadrado para cada círculo.
	const (
		innerRadiusSq  = 1.0 * 1.0  // Raio interno: 1 unidade
		middleRadiusSq = 5.0 * 5.0  // Raio do meio: 5 unidades
		outerRadiusSq  = 10.0 * 10.0 // Raio externo (alvo total): 10 unidades
	)

	// Avalia a distância ao quadrado para determinar a pontuação,
	// começando pelo círculo mais interno (maior pontuação).
	if distSq <= innerRadiusSq {
		// Se dentro ou na borda do círculo interno
		return 10
	} else if distSq <= middleRadiusSq {
		// Se dentro ou na borda do círculo do meio, mas fora do interno
		return 5
	} else if distSq <= outerRadiusSq {
		// Se dentro ou na borda do círculo externo, mas fora do meio
		return 1
	} else {
		// Se fora do alvo
		return 0
	}
}