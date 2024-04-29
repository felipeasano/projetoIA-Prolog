

As rotas estao contidos no inicio do proprio arquivo fonte (codigo) no seguinte formato:
	% Formato do Arquivo de Dados
	% Existência de Rota Aérea entre Cidades
	% Simbologia:
	% A: cidade de partida
	% B: cidade de destino
	% Preço: custo da rota aérea, em reais, necessário para ir de A a B
	rota(A,B,Preço).

Para inserir uma nova rota, basta quebrar uma nova linha e entrar com o formato acima.

Apos compilar o codigo, o comando "encontrar_trajeto_mais_economico" mostrara o melhor trajeto, seguindo o seguinte formato de exemplo:
	encontrar_trajeto_mais_economico(foz_do_iguacu, salvador, Caminho, ValorTotal).

Desta forma, o programa apresenta a solução da seguinte forma:
	Caminho = [salvador, curitiba, foz_do_iguacu],
	ValorTotal = 300.