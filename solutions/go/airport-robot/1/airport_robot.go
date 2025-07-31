package airportrobot

type Greeter interface {
	LanguageName() string
	Greet(visitorName string) string
}


func SayHello(visitorName string, greeter Greeter) string {
	return "I can speak " + greeter.LanguageName() + ": " + greeter.Greet(visitorName)
}

type Italian struct{}

func (i Italian) LanguageName() string {
	return "Italian"
}

func (i Italian) Greet(visitorName string) string {
	return "Ciao " + visitorName + "!"
}

type Portuguese struct{}


func (p Portuguese) LanguageName() string {
	return "Portuguese"
}

func (p Portuguese) Greet(visitorName string) string {
	return "Olá " + visitorName + "!"
}
