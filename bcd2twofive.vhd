-------------------------------------------
-- Delivery #13
-- Fabrício da Costa Guimarães - 21950515
-- Engenharia da Computação - FT UFAM
-- ED2 e LED - 2021/01 - Equipe 06
-------------------------------------------


-- Entidade
entity bcd2twofive is
	port(
		enable: in bit; -- Entrada enable
		bcd: in integer range (2**4 - 1) downto 0; -- Entrada bcd tipo inteiro (9...0)
		activ: out bit; -- Saída activ para sinalizar se o bcd é válido na faixa (9...0)
		twofive: out bit_vector(4 downto 0) -- Saída do conversor twofive
	);
end entity bcd2twofive;

-- Arquitetura
architecture bcd2twofive_a of bcd2twofive is
	
	-- Função para a conversão para bcd2twofive
	function bcd2twofive_function (bcd : integer) return bit_vector is
		variable  twofive_buf  :  bit_vector (4 downto 0);
	begin
		case bcd is -- Uso do case/when para facilitar o conversor
			when 0 => twofive_buf := "00011";
			when 1 => twofive_buf := "00101";
			when 2 => twofive_buf := "00110";
			when 3 => twofive_buf := "01001";
			when 4 => twofive_buf := "01010";
			when 5 => twofive_buf := "01100";
			when 6 => twofive_buf := "10001";
			when 7 => twofive_buf := "10010";
			when 8 => twofive_buf := "10100";
			when 9 => twofive_buf := "11000";
			when others => twofive_buf := "00000" ; 
		end case;

		return twofive_buf;
	end bcd2twofive_function;
  
  
	-- Função para verificar se o valor do bcd está na faixa ideal de (9..0)
	-- Retirada do package dsf_std
	function is_range (data : integer; min, max : integer) return bit is 
		variable  flag  :  bit;
	begin
		if (data >= min) and (data <= max) then
      -- O valor fornecido está na faixa.
			flag := '1';
		else 
	  -- O valor fornecido NÃO está na faixa. 
			flag := '0';
		end if;
 
		return flag;
	end is_range;
  
begin

	twofive <= bcd2twofive_function(bcd) when (enable = '1') else "00000";
					
	activ <= is_range(bcd, 0, 9);
	
end architecture bcd2twofive_a;