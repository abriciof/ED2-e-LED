-------------------------------------------
-- Delivery #12
-- Fabrício da Costa Guimarães - 21950515
-- Engenharia da Computação - FT UFAM
-- ED2 e LED - 2021/01 - Equipe 06
-------------------------------------------

-- Entidade
entity cont_decres is
	port(
		clk: in bit; -- Entrada clock
		aset: in bit; -- Entrada aset
		q: out integer range 15 downto 0 -- Saída do contador
	);
end entity cont_decres;

-- Arquitetura
architecture cont_decres_a of cont_decres is
begin
	process(clk, aset) -- Início do process()
	 -- Variável buffer com valor inicial de q_buf:=15
		variable q_buf : integer range 15 downto 0 := 15;
	begin
		-- Chave aset, quando aset='1' retorna o contador para 15
		if (aset = '1') then 
			q_buf := 15;
		else
			-- Evento clock quando clk='1'
			if clk'event and (clk= '1') then
				-- Fim da contagem retorna para o início da mesma
				if (q_buf = 0) then
					q_buf := 15;
					
				-- Decrescendo a contagem em uma unidade
				else
					q_buf := q_buf - 1;
				end if;
			end if;
		end if;
		q <= q_buf;-- Atribuindo ao sinal de saída
	end process;
end architecture cont_decres_a;




