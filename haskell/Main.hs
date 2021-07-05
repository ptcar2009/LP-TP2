module Main where
import System.Environment
import System.Exit

-- |queens resolve um problema de n rainhas.
queens :: Int  -- ^número de rainhas a serem colocadas no tabuleiro
       -> [[Int]] -- ^lista de possíveis soluções dado n
queens n = map reverse $ queens' n
    where
    -- Caso não tenham mais rainhas a serem colocadas, a lista é vazia
    queens' 0 = [[]]
    -- Não determinísticamente, coloque rainhas em todas as possíveis novas posições
    -- e teste se essas rainhas são váilidas, fazendo um "backtracking" não determinístico
    queens' k = [q:qs | qs <- queens' (k-1), q <- [1..n], ok q qs]
    -- |ok testa se a rainha pode ser colocada nessa posição dada a lista anterior.
    -- o teste testa se duas rainhas estão na mesma linha ou na diagonal. Como pela definição da entrada
    -- nenhuma rainha está na mesma coluna não precisamos nos preocupar com isso.
        where ok pos qs = not (elem pos qs || diag pos qs)

-- | A função diag testa se uma posição a ser escolhida está na diagonal de alguma outra
-- rainha já escolhida.
diag :: Int -- ^ a linha em que a rainha atual está sendo colocada
     -> [Int]    -- ^ o resto dos elementos existentes
     -> Bool     -- ^ a rainha está na diagonal de alguma outra rainha?
diag pos qs =
    -- | withDistances cria uma lista com a distância para as rainhas já existentes. Como
    -- a lista de rainhas é criada em ordem, as distâncias são equivalentes
    -- à sua posição na lista restante
    let withDistances = zip [1..] qs
    -- caso qualquer rainha esteja em diagonal, retorna que está em diagonal
    in any (isDiag pos) withDistances

-- | isDiag testa se uma rainha está na diagonal de outra rainha
isDiag :: Int           -- ^ linha da rainha sendo testada
       -> (Int, Int)    -- ^ linhas da outra rainha e suas distância com relação à rainha sendo testada
       -> Bool          -- ^ se a rainha
-- caso a distância em x seja igual à distância em y, isso implica que as rainhas
-- estão em diagonal
isDiag pos (delta, row) = abs (pos - row) ==  delta

usage = putStrLn "rainhas <N=8> [-h]\nOnde N e o tamanho do tabuleiro."

parse []     = do return 8
parse ["-h"] = usage >> exitSuccess
parse ["--help"] = usage >> exitSuccess
parse [n] = do
    let k = read n :: Int
    return k
parse others = usage >> exitFailure 

main :: IO ()
main =  getArgs >>= parse >>= mapM_ print . queens
