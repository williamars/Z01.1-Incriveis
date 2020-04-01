-- Elementos de Sistemas
-- by Luciano Soares
-- BinaryDigit.vhd

Library ieee;
use ieee.std_logic_1164.all;

entity BinaryDigit is
	port(
		clock:   in STD_LOGIC;
		input:   in STD_LOGIC;
		load:    in STD_LOGIC;
		output: out STD_LOGIC
	);
end entity;

architecture rtl of BinaryDigit is

	component FlipFlopD is
		port(
			clock:  in std_logic;
			d:      in std_logic;
			clear:  in std_logic;
			preset: in std_logic;
			q:     out std_logic
		);
	end component;

	component Mux2Way is
		port (
			a:   in  STD_LOGIC;
			b:   in  STD_LOGIC;
			sel: in  STD_LOGIC;
			q:   out STD_LOGIC
		);
	end component;

	
	signal dffout,muxout, clear, preset: std_logic;

begin

	u1: FlipFlopD port map (
		clock => clock,
		d => muxout,
		clear => clear,
		preset => preset,
		q => dffout
	);

	u2: Mux2Way port map (
		a => dffout,
		b => input,
		sel => load,
		q => muxout
	);

	output <= dffout when load = '0' else
		      input  when load = '1';
						  			
						  
	

end architecture;