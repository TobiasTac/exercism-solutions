package pangram

import (
	"strings" // Importa o pacote strings para funções de manipulação de strings, como ToLower
)

// IsPangram verifica se a string de entrada é um pangrama.
// Um pangrama é uma frase que contém todas as 26 letras do alfabeto inglês
// pelo menos uma vez, sem distinção entre maiúsculas e minúsculas.
func IsPangram(input string) bool {
	// 1. Crie uma estrutura para rastrear as letras vistas.
	// Um array booleano de 26 posições é eficiente, onde cada posição
	// representa uma letra do alfabeto (0 para 'a', 1 para 'b', ..., 25 para 'z').
	seenLetters := [26]bool{} // Inicializa todas as posições como false

	// 2. Converta a string de entrada para minúsculas.
	// Isso garante que a verificação seja insensível a maiúsculas e minúsculas.
	lowerInput := strings.ToLower(input)

	// 3. Itere sobre cada caractere da string convertida.
	for _, char := range lowerInput {
		// 4. Verifique se o caractere é uma letra do alfabeto inglês.
		// As runas (caracteres) em Go podem ser comparadas diretamente.
		if char >= 'a' && char <= 'z' {
			// 5. Calcule o índice correspondente no array seenLetters.
			// Por exemplo, 'a' - 'a' = 0, 'b' - 'a' = 1, etc.
			index := char - 'a'
			// 6. Marque a letra como vista.
			seenLetters[index] = true
		}
		// Caracteres que não são letras (números, pontuações, espaços) são ignorados.
	}

	// 7. Após processar todos os caracteres, verifique se todas as letras foram vistas.
	// Itere pelo array seenLetters.
	for i := 0; i < 26; i++ {
		// Se alguma posição no array ainda for 'false', significa que a letra
		// correspondente não foi encontrada na frase.
		if !seenLetters[i] {
			return false // Não é um pangrama
		}
	}

	// Se o loop terminar, todas as 26 letras foram encontradas.
	return true // É um pangrama
}