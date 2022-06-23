//SPOX-License-Identifier: MIT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{

    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(string => uint) private notas_materias;
    string[] private _materias;

    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }

    function apellido() public view returns (string memory){
        return _apellido;
    }

    function nombre_completo() public view returns (string memory){
       return string(bytes.concat(bytes(_nombre), " ", bytes(_apellido)));
    }

    function curso() public view returns (string memory){
        return _curso;
    }

    function set_nota_materia(string memory materia, uint nota) public {
        require (_docente == msg.sender, "No sos el docente");
            if(notas_materias[materia] != 0){
            _materias.push(materia);
            }
            notas_materias[materia] = nota;
    }

    function nota_materia(string memory materia) public view returns (uint){
        return notas_materias[materia];
    }

    function aprobo(string memory materia) public view returns (bool){
        if(notas_materias[materia] >= 6){
            return true;
        }
        else{
            return false;
        }
    }

    function promedio() public view returns (uint){
        uint _promedio = 0;
        for(uint i = 0; i < _materias.length; i++){
            _promedio += notas_materias[_materias[i]];
        }
        return _promedio / _materias.length;
    }
}