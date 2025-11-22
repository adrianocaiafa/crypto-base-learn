// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SimpleInteractions
/// @notice Conta quantos endereços únicos interagiram com o contrato
contract SimpleInteractions {
    // Total de usuários únicos que já interagiram
    uint256 public totalUniqueUsers;

    // Marca se um endereço já interagiu pelo menos 1 vez
    mapping(address => bool) public hasInteracted;

    // Quantas vezes cada endereço já interagiu
    mapping(address => uint256) public interactionsCount;

    // Evento para facilitar rastreio em explorers
    event Interacted(address indexed user, uint256 userCount, uint256 totalUniqueUsers);

    /// @notice Função de interação simples
    /// @dev Cada chamada gera uma transação e atualiza o estado
    function interact() external {
        // Se é a primeira vez desse address, conta como usuário único
        if (!hasInteracted[msg.sender]) {
            hasInteracted[msg.sender] = true;
            totalUniqueUsers += 1;
        }

        // Incrementa o contador de interações desse address
        interactionsCount[msg.sender] += 1;

        emit Interacted(msg.sender, interactionsCount[msg.sender], totalUniqueUsers);
    }

    /// @notice Helper pra ver quantas vezes VOCÊ já chamou o contrato
    function myInteractions() external view returns (uint256) {
        return interactionsCount[msg.sender];
    }
}
