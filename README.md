# N Rainhas

### Pedro Tavares de Carvalho
### Gean Santos

Nesse trabalho, fomos instruídos a criar três implementações diferentes do problema das $N$ rainhas, utilizando linguagens do paradigma funcional, imperativo e lógico. As linguagens utlizadas foram `haskell`, `c++` e `prolog`, respectivamente.

## Paradigma Funcional

Para a implementação do paradigma funcional, foi utilizada uma implementação a partir da idéia de mônadas em `haskell` para se obter uma implementação 'não determinística' do algoritmo baseado em *backtracking* para o problema das.

O algoritmo parte do princípio de *list comprehensions*, onde exploramos as possibilidades de rainha atual, dadas as possibilidades de tabuleiros exploradas no "futuro". Fazemos isso recursivamente, filtrando na mesma *list comprehention* as disposições inválidas.

```haskell
queens' k = [q:qs | qs <- queens' (k-1), q <- [1..n], ok q qs]
```

Essa linha implica na criação de uma lista onde o problema com uma rainha a menos foi resolvido, testando as possibilidades com todas as posições possíveis na coluna atual.

## Paradigma Imperativo

A resolução do paradigma imperativo foi similar à resolução funcional, com um algoritmo recursivo de backtracking, porém sem a facilidade da *list comprehension*, temos de iterar sobre todas as possibilidades de rainha atual e também sobre todas as possibilidades de resolução disponíveis.


## Benchmarks
| Command                        | Mean [ms]     | Min [ms] | Max [ms] |
|:-------------------------------|--------------:|---------:|---------:|
| `N_QUEENS=8 make haskell/run`  | 8.4 ± 1.9     | 3.7      | 12.5     |
| `N_QUEENS=8 make cpp/run`      | 9.6 ± 2.7     | 5.5      | 16.1     |
| `N_QUEENS=9 make haskell/run`  | 13.7 ± 2.3    | 10.7     | 22.2     |
| `N_QUEENS=9 make cpp/run`      | 21.7 ± 1.0    | 20.0     | 24.6     |
| `N_QUEENS=10 make haskell/run` | 48.3 ± 1.2    | 46.4     | 52.4     |
| `N_QUEENS=10 make cpp/run`     | 89.9 ± 1.7    | 87.3     | 93.8     |
| `N_QUEENS=11 make haskell/run` | 250.2 ± 2.9   | 245.4    | 254.3    |
| `N_QUEENS=11 make cpp/run`     | 454.3 ± 6.0   | 446.6    | 468.2    |
| `N_QUEENS=12 make haskell/run` | 1451.2 ± 23.4 | 1426.4   | 1493.2   |
| `N_QUEENS=12 make cpp/run`     | 2616.9 ± 65.7 | 2519.0   | 2706.4   |
