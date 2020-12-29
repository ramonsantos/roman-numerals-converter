# Desafio Backend Zenvia Mobile

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
![ruby](https://img.shields.io/badge/ruby-2.7.2-dc143c)

## Problema

Eu escolhi o problema da [transformação de números romanos](http://codingdojo.org/kata/RomanNumerals/). O desafio foi feito na linguagem **Ruby** e com o framework de testes **Minitest**. A versão do Ruby usada foi a *2.7.1* e eu também testei nas versões *2.5.8* e *2.6.6*.

A parte I, converter números em algarismos romanos, foi resolvida quebrando o número de entrada em um array de dígitos, onde cada dígito representa uma parte do número (as ordens e classes numéricas). Cada dígito é convertido de forma individual, levando em consideração o seu valor e ordem numérica. Após as transformações, os números romanos são juntados, resultando na versão romana do número de entrada.

Já na parte II do problema, converter algarismos romanos em algarismos hindu-arábicos, foi usada uma expressão regular que valida o número e extrai as partes que representam um único numeral. Estas partes são convertidas para números inteiros de acordo com o valor. Após cada parte ser convertida em números, estas são multiplicadas por um valor representado sua ordem numérica (por exemplo, se a parte do número for da ordem das dezenas, o valor é multiplicado por 10) e depois são somadas para formar a representação hindo-arábico do número de entrada.

Em ambas as partes do problema o valor de entrada foi restringido (e é validado na implementação) com as seguintes regras:

* Não é permitido entradas nulas ou vazias;
* Não é permitido valores menores que 1 (**I** em romano);
* Não é permitido valores maiores que 3999 (**MMMCMXCIX** em romano);
* Os numerais hindu-arábicos são representados com números inteiros;
* Os numerais romanos são representados com Strings e só aceitam as letras maiúsculas.

## Instruções

### Requisitos

* Ruby 2.5+

### Instalação

#### Clonar o projeto:

``` bash
git clone https://github.com/ramonsantos/roman-numerals-converter.git

```

#### Entrar no diretório do projeto:

``` bash
cd roman-numerals-converter
```

#### Instalar as dependências:

``` bash
bundle install
```

### Como Executar ?

#### Carregar o projeto no IRB

``` bash
irb -I . -r lib/numeral_converter
```

#### Converter de hindo-arábico para romano
``` ruby
NumeralConverter.hindu_arabic_to_roman(42)
=> "XLII"
```

#### Converter de romano para hindo-arábico

``` ruby
NumeralConverter.roman_to_hindu_arabic('XLII')
=> 42
```

### Como Executar os Testes?

``` bash
bundle exec rake test
```
