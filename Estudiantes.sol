//SPOX-License-Identifier: MIT
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Estudiante{

    string private nombre;
    string private _apellido;
    string private _curso;
    address private docente;
    mapping(string => uint) private notas_materias;
    string[] private materias;

    constructor(string memory _nombre, string memory apellido_, string memory curso_){
        nombre = _nombre;
        _apellido = apellido_;
        _curso = curso_;
        docente = msg.sender;
    }

    function apellido() public view returns (string memory){
        return _apellido;
    }

    function nombre_completo() public view returns (string memory){
       return string(bytes.concat(bytes(nombre), " ", bytes(_apellido)));
    }

    function curso() public view returns (string memory){
        return _curso;
    }

    function set_nota_materia(string memory materia, uint nota) public {
        require (docente == msg.sender, "No sos el docente");
            notas_materias[materia] = nota;
            materias.push(materia);
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
        for(uint i = 0; i < materias.length; i++){
            _promedio += notas_materias[materias[i]];
        }
        return _promedio / materias.length;
    }
}