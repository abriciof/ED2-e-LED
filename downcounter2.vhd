-------------------------------------------
-- Delivery #15
-- Fabrício da Costa Guimarães - 21950515
-- Engenharia da Computação - FT UFAM
-- ED2 e LED - 2021/01 - Equipe 06
-------------------------------------------

-- Bibliotecas e pacotes
use work.dsf_std.all;

-- Entidade
entity downcounter2 is
	port(
		-- Controles assíncronos
		enable: in bit; 
		areset: in bit; 
		
		-- Controles síncronos
		count_en: in bit; 
		clk: in bit;

		-- Resultado da contagem: 4 bits
		q: buffer integer range (2**4 - 1) downto 0 := 9 
	);
end entity downcounter2;

-- Arquitetura
architecture downcounter2_a of downcounter2 is
	constant len_module: integer := 10; 
	constant max_count: integer := q'high;
	constant max_module: integer := len_module-1;

	-- Função de reset da contagem quando enable='1'
	function reset_q (enable: bit; q: integer) return integer is
		variable cnt: integer range max_module downto 0 := max_module;
	begin
		-- Modo limpa e colocar o valor máximo.
		if (enable = '1') then	
			cnt := max_module;
			
		-- Modo memória.
		else
			cnt := q; 
		end if;

		return cnt;
	end reset_q;
	
	
	-- Função para o decremento de 2 unidades
	function decrement2 (count : integer; max : integer) return integer is
		-- Próximo valor da contagem.
		variable  next_count  :  integer range max_count downto 0;
	begin

		-- Condição do passo base de operação.
		if (count <= 1) then
			-- Passo base de operação.
			next_count := max;
				
		else
			-- Passo de indução de operação.
			next_count := count - 2;
				
		end if;
			  
		return next_count;
	end decrement2;


	-- Função para ativação do decremento da contagem 
	function decre_q (enable, count_en: bit; q: integer) return integer is
		variable cnt: integer range max_count downto 0;
	begin
		-- Modo contagem decrescente
		if (enable = '1') and (count_en = '1') then
			cnt := decrement2(q, max_module);
			
		-- Modo memória
		else
			cnt := q;
		end if;

		return cnt;
	end decre_q;

begin

	q <= reset_q(enable, q) when areset='1' else
		  decre_q(enable, count_en, q) when low2high(clk);
	
end architecture downcounter2_a;
