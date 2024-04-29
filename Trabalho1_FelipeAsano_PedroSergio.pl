% Fatos: Definição de rotas e preços entre cidades
rota(foz_do_iguacu, curitiba, 200).
rota(curitiba, sao_paulo, 150).
rota(sao_paulo, rio_de_janeiro, 100).
rota(rio_de_janeiro, belo_horizonte, 120).
rota(belo_horizonte, salvador, 180).
rota(curitiba, salvador, 100).

% Regras: Definição de regras para encontrar o trajeto mais econômico
melhor_trajeto(CidadeInicial, CidadeFinal, Caminho, ValorTotal) :-
    encontrar_trajeto(CidadeInicial, CidadeFinal, [CidadeInicial], Caminho, 0, ValorTotal).

% Encontrar um trajeto entre duas cidades
encontrar_trajeto(Cidade, Cidade, Caminho, Caminho, ValorTotal, ValorTotal).
encontrar_trajeto(CidadeAtual, CidadeFinal, CaminhoAtual, Caminho, ValorAtual, MelhorValor) :-
    rota(CidadeAtual, ProximaCidade, Preco),
    \+ member(ProximaCidade, CaminhoAtual), % Evitar ciclos
    NovoValor is ValorAtual + Preco,
    encontrar_trajeto(ProximaCidade, CidadeFinal, [ProximaCidade | CaminhoAtual], Caminho, NovoValor, MelhorValor).

% Regra para encontrar o trajeto mais econômico
encontrar_trajeto_mais_economico(CidadeInicial, CidadeFinal, Caminho, ValorTotal) :-
    setof(Valor/Caminho, melhor_trajeto(CidadeInicial, CidadeFinal, Caminho, Valor), [MelhorValor/MelhorCaminho | _]),
    Caminho = MelhorCaminho,
    ValorTotal = MelhorValor.

% Exemplo de uso:
% Encontrar o trajeto mais econômico de Foz do Iguaçu para Salvador
% Chamada: encontrar_trajeto_mais_economico(foz_do_iguacu, salvador, Caminho, ValorTotal).
% Resultado: Caminho = [foz_do_iguacu, curitiba, sao_paulo, rio_de_janeiro, belo_horizonte, salvador],
%            ValorTotal = 750.
