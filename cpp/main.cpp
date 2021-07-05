#include <iostream>
#include <vector>

using namespace std;

/**
 * @brief Testa se uma rainha esta em conflito com as rainhas ja existentes.
 *
 * @param q Rainha atual a ser testada.
 * @param current Tabuleiro atual.
 * @return Se a rainha esta em conflito.
 */
bool test_queen(int q, vector<int> current) {
	for (size_t i = 0; i < current.size(); ++i) {
		auto o = current[i];
		if (o == q) 
			return false;
		if (abs(q - o) == current.size() - i)
			return false;
	}
	return true;
}

/**
 * @brief Imprime uma linha
 *
 * @param line Linha a ser impressa
 */
void print_line(vector<int> line) {
	cout << "[";
	for (size_t i = 0; i < line.size(); ++i)
	{
		cout << line[i];
		if (i < line.size() - 1)
			cout << ",";
	}
	cout << "]" << endl;
}

/**
 * @brief Funcao recursiva auxiliar de resolucao em backtracking para o problema das 8 rainhas
 *
 * @param n Numero de rainhas
 * @param k Numero de colunas disponiveis
 * @param current Solucao atual
 */
vector<vector<int>> queens_(int n, int k, vector<int> current) {
	vector<vector<int>> sols = vector<vector<int>>();
	if (k == 0) {
		sols.push_back(current);
		return sols;
	}
	for (int i = 1; i <= n; ++i) {
		vector<int> next = vector<int>(current);
		if (test_queen(i, current)) {
			next.push_back(i);
			for (auto sol : queens_(n, k-1, next))
				sols.push_back(sol);
		}
	}
	return sols;
}

/**
 * @brief Funcao que resolve o problema de n rainhas
 *
 * @param n Numero de rainhas
 */
vector<vector<int>> queens(int n) {
	return queens_(n, n, vector<int>());
}

int main(int argc, char** argv) {
	vector<vector<int>> sols;	
	if (argc == 1)
		sols = queens(8);
	else if (argc == 2)
		sols = queens(atoi(argv[1]));
	else
		exit(1);

	for (auto line : sols) {
		print_line(line);
	}
}
