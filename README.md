# N Rainhas

### Pedro Tavares de Carvalho
### Gean Santos

Nesse trabalho, fomos instruídos a criar três implementações diferentes do problema das N rainhas, utilizando linguagens do paradigma funcional, imperativo e lógico. As linguagens utlizadas foram `haskell`, `c++` e `prolog`, respectivamente.

## Paradigma Funcional

Para a implementação do paradigma funcional, foi utilizada uma implementação a partir da idéia de mônadas em `haskell` para se obter uma implementação 'não determinística' do algoritmo baseado em *backtracking* para o problema das.

O algoritmo parte do princípio de *list comprehensions*, onde exploramos as possibilidades de rainha atual, dadas as possibilidades de tabuleiros exploradas no "futuro". Fazemos isso recursivamente, filtrando na mesma *list comprehention* as disposições inválidas.

```haskell
queens' k = [q:qs | qs <- queens' (k-1), q <- [1..n], ok q qs]
```

Essa linha implica na criação de uma lista onde o problema com uma rainha a menos foi resolvido, testando as possibilidades com todas as posições possíveis na coluna atual.

## Paradigma Imperativo

A resolução do paradigma imperativo foi similar à resolução funcional, com um algoritmo recursivo de backtracking, porém sem a facilidade da *list comprehension*, temos de iterar sobre todas as possibilidades de rainha atual e também sobre todas as possibilidades de resolução disponíveis.


## Paradigma lógico:

Nessa implementação, as rainhas em um tabuleiros são representadas como uma lista, em que cada elemento corresponde a posição de uma rainha em uma coluna, porque não é necessário testar soluções em que duas rainhas estão na mesma linha. Para resolver o problema, é utilizado um algoritmo de força bruta, em que uma organização possivel é gerada e testada. 

Como o algoritmo utilizado é de força bruta, e `prolog` é a única linguagem interpretada entre as escolhidas, a sua performance é menor comparativamente.

### Instalação
O arquivo está marcado como executável e pode ser executado diretamente de um terminal `*sh`, porém é necessário que o interpretador `swipl` esteja instalado e disponível em seu `PATH`.

## Dependências e execução
Todas as dependências e processos de execução estão configurados dentro do `Makefile` incluído no diretório. Para instalar as dependências (assumindo `ubuntu` e `gcc` instalado):

```bash
make prolog/init haskell/install
```

Para compilar os arquivos `c++` e `haskell`, basta executar:
```bash
make all
```

Para executar um dos algoritmos, basta executar:

```bash
N_QUEENS=X make <linguagem>/run
```

Onde `N_QUEENS` é o número de rainhas no qual o algoritmo será executado sendo o *default* 8.

## Benchmarks
| Command                        | Mean [ms]      | Min [ms] | Max [ms] |
|:-------------------------------|---------------:|---------:|---------:|
| `N_QUEENS=6 make haskell/run`  | 3.0 ± 1.2      | 1.7      | 6.8      |
| `N_QUEENS=6 make cpp/run`      | 3.7 ± 1.5      | 1.8      | 6.6      |
| `N_QUEENS=6 make prolog/run`   | 29.1 ± 1.7     | 25.1     | 34.8     |
| `N_QUEENS=7 make haskell/run`  | 5.1 ± 1.6      | 2.4      | 7.6      |
| `N_QUEENS=7 make cpp/run`      | 4.1 ± 1.3      | 2.5      | 8.6      |
| `N_QUEENS=7 make prolog/run`   | 35.3 ± 2.1     | 32.2     | 44.0     |
| `N_QUEENS=8 make haskell/run`  | 6.0 ± 1.7      | 4.0      | 11.7     |
| `N_QUEENS=8 make cpp/run`      | 8.9 ± 2.4      | 5.8      | 15.3     |
| `N_QUEENS=8 make prolog/run`   | 116.3 ± 7.0    | 108.1    | 136.0    |
| `N_QUEENS=9 make haskell/run`  | 13.6 ± 1.2     | 11.5     | 18.0     |
| `N_QUEENS=9 make cpp/run`      | 23.8 ± 1.0     | 21.5     | 28.2     |
| `N_QUEENS=9 make prolog/run`   | 865.8 ± 12.8   | 841.1    | 880.4    |
| `N_QUEENS=10 make haskell/run` | 55.7 ± 3.2     | 52.3     | 70.6     |
| `N_QUEENS=10 make cpp/run`     | 99.4 ± 4.0     | 94.6     | 118.6    |
| `N_QUEENS=10 make prolog/run`  | 9176.4 ± 174.6 | 8907.5   | 9461.4   |
