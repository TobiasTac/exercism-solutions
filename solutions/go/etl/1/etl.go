package etl

import "strings" // Importamos o pacote strings para a função ToLower

// Transform recebe um mapa onde as chaves são pontuações (int)
// e os valores são slices de strings (letras que valem aquela pontuação).
// Ele retorna um novo mapa onde as chaves são letras (string) em minúsculas
// e os valores são suas respectivas pontuações (int).
func Transform(in map[int][]string) map[string]int {
	// Crie um novo mapa para armazenar o resultado transformado.
	// As chaves serão strings (para as letras minúsculas) e os valores inteiros (para as pontuações).
	transformedData := make(map[string]int)

	// Itere sobre o mapa de entrada.
	// `score` será a pontuação atual (a chave do mapa de entrada).
	// `letters` será o slice de strings (as letras associadas a essa pontuação).
	for score, letters := range in {
		// Para cada pontuação, itere sobre as letras associadas a ela.
		// `letter` será a letra atual (ex: "A", "B", "C").
		for _, letter := range letters {
			// Converta a letra para minúscula.
			// Ex: "A" se torna "a".
			lowerCaseLetter := strings.ToLower(letter)

			// Adicione a letra em minúscula como chave e a pontuação como valor
			// no nosso novo mapa `transformedData`.
			transformedData[lowerCaseLetter] = score
		}
	}

	// Retorne o mapa com os dados transformados.
	return transformedData
}