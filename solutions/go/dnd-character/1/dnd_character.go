package dndcharacter

import (
	"math/rand" // Para gerar números aleatórios (rolagens de dados)
	"sort"      // Para ordenar as rolagens de dados
	"time"      // Para semear o gerador de números aleatórios
)

// Inicializa o gerador de números aleatórios uma única vez.
// Isso garante que cada execução do programa (ou teste) tenha rolagens diferentes.
func init() {
	rand.Seed(time.Now().UnixNano())
}

// Character representa um personagem de D&D com suas seis habilidades e pontos de vida.
type Character struct {
	Strength     int
	Dexterity    int
	Constitution int
	Intelligence int
	Wisdom       int
	Charisma     int
	Hitpoints    int
}

// Modifier calcula o modificador de habilidade para uma dada pontuação de habilidade.
// A fórmula é (score - 10) / 2, arredondado para baixo.
func Modifier(score int) int {
	// A divisão inteira em Go (/) já trunca em direção a zero.
	// Para números positivos, isso é equivalente a arredondar para baixo.
	// Para números negativos, também trunca em direção a zero, o que para -3.5 seria -3,
	// mas para arredondar para baixo (floor) deveria ser -4.
	// No entanto, para (score - 10) / 2, os resultados serão sempre inteiros ou X.5.
	// Ex: (3-10)/2 = -7/2 = -3.5. Divisão inteira em Go é -3.
	// O modificador de constituição para 3 é -4.
	// O problema especifica "arredondar para baixo", então precisamos garantir isso.
	// Uma forma robusta é usar math.Floor após converter para float, e depois para int.
	// No entanto, a regra D&D para modificadores é (score - 10) / 2, truncando para baixo.
	// Para pontuações como 3, (3-10)/2 = -3.5, o modificador é -4.
	// Go's integer division truncates towards zero.
	// For negative numbers, to "round down" (towards negative infinity),
	// if the result is negative and has a fractional part, we need to subtract 1.
	// A simpler way is to adjust the score before division for negative results.
	// Or, more directly:
	if score < 10 && (score-10)%2 != 0 {
		return (score - 10) / 2 - 1 // e.g., (3-10)/2 = -3, needs to be -4. So -3-1=-4
	}
	return (score - 10) / 2
}

// Ability usa aleatoriedade para gerar a pontuação para uma habilidade.
// Rola quatro dados de 6 lados, descarta o menor e soma os três maiores.
func Ability() int {
	rolls := make([]int, 4) // Cria um slice para armazenar as 4 rolagens

	// Rola quatro dados de 6 lados
	for i := 0; i < 4; i++ {
		// rand.Intn(6) gera um número entre 0 e 5. Adicionamos 1 para obter 1 a 6.
		rolls[i] = rand.Intn(6) + 1
	}

	// Ordena as rolagens em ordem crescente.
	// Isso facilita descartar o menor e somar os três maiores.
	sort.Ints(rolls)

	// Soma os três maiores valores (os últimos três elementos após a ordenação).
	sum := rolls[1] + rolls[2] + rolls[3]

	return sum
}

// GenerateCharacter cria um novo Character com pontuações aleatórias para as habilidades
// e calcula os pontos de vida iniciais.
func GenerateCharacter() Character {
	// Cria uma nova instância de Character.
	c := Character{}

	// Gera pontuações para cada uma das seis habilidades.
	c.Strength = Ability()
	c.Dexterity = Ability()
	c.Constitution = Ability()
	c.Intelligence = Ability()
	c.Wisdom = Ability()
	c.Charisma = Ability()

	// Calcula os pontos de vida iniciais.
	// Pontos de vida = 10 + modificador de Constituição.
	c.Hitpoints = 10 + Modifier(c.Constitution)

	return c
}