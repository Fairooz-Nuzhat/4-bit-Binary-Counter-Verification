// Four-bit binary counter with parallel load
module Binary_Counter(
	output reg [3: 0] 	A_count,	// Data output
	output 			C_out,		// Output carry
	input [3:0] 		Data_in,	// Data input
	input 			Enable,		// Activate the circuit
	input 			Count,		// Active high to count
	input 			Load,		// Active high to load
	input 			CLK,		// Positive-edge sensitive
	input 			reset		// Active low
);

`pragma protect begin_protected
`pragma protect encrypt_agent="NCPROTECT"
`pragma protect encrypt_agent_info="ncprotect	15.20-s086	 Sep 06, 2024 at 16:41:41 +06"
`pragma protect data_keyowner="Cadence Design Systems."
`pragma protect data_keyname="CDS_DATA_KEY"
`pragma protect data_method="AES256-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 832)
`pragma protect data_block
\UcE;?aVDb999999GDMBcutZyMcrZZJUwAEKAGLnN2jzFca93JBKm3DwuopvhAvk/G02HLvYvgUK
9WuIGJdalhIesYarox/1C/nF+vKcQwIw4ClsC+hjeb/42T7m4oHyOZib4SOMYNMcACBgsnBfe2/T
9mhw9mjZcbVK8NGBw+x2fZuDmr+e8QV8EwCjxmX1S6j8UPEQrNu8DXp9FhPah5cY7h0rJ32iLpyA
lSCSjvhMhr8GN4tgjzUXK9CLNSlXFLyGYrXwUVKoW3lTSg3xaE9OyijoMUVEiZr9rXXCZfAOVeaB
JZtwpbchnmr0e2xMtCechzCoWqDxhy9sT+u2obbNRZDdQogVfYXoUW548mXEKp42r6bveAVu2pxS
KJN+nP72/UdxllrUbc8e741lDrhHSVoQgcjgjDukUY/YHIjk4K8qc9yqPzJQPmSvxCPi0DE5nFYT
jq8Ewfp9KhJ/+jBrFX6r5JobXqNdur2JQXMOF47+/99ikIOYMR/ECl4z88qfTu8iYMI8lzKKfoQ/
2owRGEPKCPz6KxroQ7Xs/BQE8EHJAfTdpIzTK61xTTSWmj9WJjbWAteXlO8ffw46e84WjTcFNi+e
fbkf2iJyGP78c7F9X59UFRDm/s//K8lWNQMu+bCbAnNzNaV8mAx8m0WmpVd38JhCFhAvwJhVH+PF
pkAXcNd5kJUs8FvVTdHzuR2IGsZYKzluUOATVAXr6KT1nY+of+P9s4/nQGmeH7SZOd+O6T1kRbUz
KBlSECRmve9Ow3e6FHlLJIp/J3ZW9OuQGPzbY07fQPtzyKYjH6Ulx3jJsqNTCwIj6BvAWnbdhAMM
QIYbGhb5dpXwUqfpGRYqmr5Q5HL08SO6fEo/1IwdN4L7eYlzrK7/KSuem5BXu0ndPcY9Pq/a5huW
2zrEzbkxJmmsx6DyrhfDba+hkAgVGymWLf6L6YBdhS21JCAsADU9BHIdRXUm0GpHRrqfQCYSIHnt
sdPNjgEA4fY/H0Hp5/a7CmUwP+EsZukDav7UZXDA6zIHJuQPMQ5bpKhfe7Ma4RcYgn9+AkjwArc2
OTOpai7RlsCNQ7+AFslkDx0h0IPqVi1epRHjEmQLhSF97gg36gciNiBBFPyNgA==


`pragma protect end_protected
endmodule


/*
// ----------------- SPECIFICATION ----------------- //

* This is Four-bit binary counter Circuit have following functions:
	1. Load data into register
	2. Up-counting operation
	3. Down-counting operation

// Signal Descriptions
-----------------------

* A_count is an output data signal of 4 bits width
* C_out is an output data signal of 1 bits width, its an output carry

* Data_in is an input data signal of 4 bits width

* Enable, Load, Count are control signals

// Circuit Functionality
-------------------------

* Active Low reset signal which resets circuit when reset = 0

* Enable = 0, then the circuit keeps its current state
  Enable = 1, then load, up-counting and down-counting operations will work

* Load = 0, then the circuit keeps its current state
  Load = 1, then load Data_in data into the circuit
  
* Count = 0, down-counts the current data, -1
  Count = 1, up-counts the current data, +1

*/


