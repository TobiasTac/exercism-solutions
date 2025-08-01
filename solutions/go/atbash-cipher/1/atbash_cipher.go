package atbash

import (
	"strings"
	"unicode"
)

func Atbash(s string) string {
	var cleanInputBuilder strings.Builder // Builder para a string de entrada limpa (apenas letras/dígitos)

	// Primeira passada: Limpar a string de entrada, convertendo letras para minúsculas
	// e ignorando qualquer coisa que não seja letra ou dígito.
	for _, r := range s {
		if unicode.IsLetter(r) {
			cleanInputBuilder.WriteRune(unicode.ToLower(r))
		} else if unicode.IsDigit(r) {
			cleanInputBuilder.WriteRune(r)
		}
		// Outros caracteres (pontuação, espaços) são completamente ignorados aqui.
	}

	cleanInput := cleanInputBuilder.String() // A string de entrada agora contém APENAS letras minúsculas e dígitos

	var resultBuilder strings.Builder // Builder para a string de saída criptografada e agrupada
	count := 0                        // Contador de caracteres *processados* para o agrupamento de 5 em 5

	// Segunda passada: Aplicar a cifra e o agrupamento à string de entrada já limpa.
	for _, r := range cleanInput {
		// A esta altura, 'r' é garantidamente uma letra ou um dígito.
		if unicode.IsLetter(r) {
			// Aplica a cifra Atbash: 'a' <-> 'z', 'b' <-> 'y', etc.
			resultBuilder.WriteRune('a' + ('z' - r))
		} else { // Deve ser um dígito aqui, pois cleanInput só tem letras ou dígitos
			resultBuilder.WriteRune(r) // Dígitos permanecem inalterados
		}
		count++

		// Adiciona um espaço após cada 5 caracteres processados.
		// `count > 0` evita um espaço inicial se a string estiver vazia ou começar com um grupo completo.
		// É importante que `count` só seja incrementado para caracteres que são *codificados*.
		if count%5 == 0 {
			resultBuilder.WriteRune(' ')
		}
	}

	// Remove qualquer espaço extra no final da string resultante
	// (que pode ocorrer se o número total de caracteres codificados for um múltiplo de 5).
	return strings.TrimSpace(resultBuilder.String())
}