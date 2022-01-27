-------------------------------------------
-- Delivery #11
-- Fabrício da Costa Guimarães - 21950515
-- Engenharia da Computação - FT UFAM
-- ED2 e LED - 2021/01 - Equipe 06
-------------------------------------------

-- Bibliotecas
library ieee;
use ieee.std_logic_1164.all;

-- Entidade
entity bin2gray is
	port(
		bin: in std_logic_vector(2 downto 0); -- Sinal de entrada
		gray: out std_logic_vector(2 downto 0) -- Sinal de saída
	);
end entity bin2gray;

-- Arquitetura
architecture bin2gray_a of bin2gray is
begin
	process(bin) -- Início do process()
		variable y_buf : std_logic_vector(2 downto 0); -- Variável buffer
	begin
		case bin is -- Uso do case/when para facilitar o decodificador'
			when "000" => y_buf := "000";
			when "001" => y_buf := "001";
			when "010" => y_buf := "011";
			when "011" => y_buf := "010";
			when "100" => y_buf := "110";
			when "101" => y_buf := "111";
			when "110" => y_buf := "101";
			when "111" => y_buf := "100";
		end case;
		gray <= y_buf; -- Atribuindo ao sinal de saída
	end process;
end architecture bin2gray_a;