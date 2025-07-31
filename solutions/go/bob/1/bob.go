package bob

import (
	"strings"
	"unicode"
)

func Hey(remark string) string {
	trimmedRemark := strings.TrimSpace(remark)

	isQuestion := endsWithQuestionMark(trimmedRemark)
	isYelling := containsUppercaseLettersOnly(trimmedRemark)
	isSilence := len(trimmedRemark) == 0
	if isYelling && isQuestion {
		return "Calm down, I know what I'm doing!"
	} else if isYelling {
		return "Whoa, chill out!"
	} else if isQuestion {
		return "Sure."
	} else if isSilence {
		return "Fine. Be that way!"
	} else {
		// Se nenhuma das condições acima for atendida, esta é a resposta padrão.
		return "Whatever."
	}
}

func endsWithQuestionMark(remark string) bool {
	if len(remark) == 0 {
		return false // Uma string vazia não pode terminar com '?'.
	}
	// Verifica o último caractere da string.
	return remark[len(remark)-1] == '?'
}

func containsUppercaseLettersOnly(remark string) bool {
	hasLetters := false      // Flag para verificar se alguma letra foi encontrada.
	allUppercase := true // Assume que todas as letras são maiúsculas até que uma minúscula seja encontrada.

	// Itera sobre cada 'rune' (caractere Unicode) na observação.
	for _, char := range remark {
		if unicode.IsLetter(char) {
			hasLetters = true // Uma letra foi encontrada.
			if unicode.IsLower(char) {
				// Se encontrarmos uma letra minúscula, não é um grito.
				allUppercase = false
				break // Não precisamos verificar mais nada.
			}
		}
	}
	// É um grito se tem pelo menos uma letra E todas as letras são maiúsculas.
	return hasLetters && allUppercase
}