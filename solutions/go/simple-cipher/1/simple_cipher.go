package cipher

import (
	"strings"
	"unicode"
	"math/rand"
	"time"
)

// ----- Tipos -----

type shift int
type vigenere struct {
	key string
}

// ----- Função auxiliar: limpeza e normalização -----

func normalize(input string) string {
	var builder strings.Builder
	for _, r := range input {
		if unicode.IsLetter(r) {
			builder.WriteRune(unicode.ToLower(r))
		}
	}
	return builder.String()
}

// ----- Função auxiliar: shift de caractere -----

func shiftChar(r rune, shift int) rune {
	base := 'a'
	return rune((int(r-base)+shift+26)%26) + base
}

// ----- Caesar Cipher: NewCaesar -----

func NewCaesar() Cipher {
	return NewShift(3) // Caesar cifra usa deslocamento fixo de 3
}

// ----- Shift Cipher: NewShift -----

func NewShift(distance int) Cipher {
	if distance == 0 || distance > 25 || distance < -25 {
		return nil
	}
	return shift(distance)
}

// Encode e Decode para shift

func (c shift) Encode(input string) string {
	input = normalize(input)
	var builder strings.Builder
	for _, r := range input {
		builder.WriteRune(shiftChar(r, int(c)))
	}
	return builder.String()
}

func (c shift) Decode(input string) string {
	input = normalize(input)
	var builder strings.Builder
	for _, r := range input {
		builder.WriteRune(shiftChar(r, -int(c)))
	}
	return builder.String()
}

// ----- Vigenère Cipher: NewVigenere -----

func NewVigenere(key string) Cipher {
	if len(key) == 0 {
		return nil
	}
	for _, r := range key {
		if r < 'a' || r > 'z' {
			return nil
		}
	}
	// Verifica se é todo 'a'
	allA := true
	for _, r := range key {
		if r != 'a' {
			allA = false
			break
		}
	}
	if allA {
		return nil
	}
	return vigenere{key}
}


// Encode e Decode para vigenere

func (v vigenere) Encode(input string) string {
	input = normalize(input)
	var builder strings.Builder
	for i, r := range input {
		k := v.key[i%len(v.key)]
		shiftVal := int(k - 'a')
		builder.WriteRune(shiftChar(r, shiftVal))
	}
	return builder.String()
}

func (v vigenere) Decode(input string) string {
	input = normalize(input)
	var builder strings.Builder
	for i, r := range input {
		k := v.key[i%len(v.key)]
		shiftVal := int(k - 'a')
		builder.WriteRune(shiftChar(r, -shiftVal))
	}
	return builder.String()
}

// ----- Geração de chave aleatória -----

func randomKey(length int) string {
	const letters = "abcdefghijklmnopqrstuvwxyz"
	rand.Seed(time.Now().UnixNano())
	var builder strings.Builder
	for i := 0; i < length; i++ {
		builder.WriteByte(letters[rand.Intn(len(letters))])
	}
	return builder.String()
}
