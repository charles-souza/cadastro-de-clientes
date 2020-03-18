# Cadastro de Clientes

O sistema tem os seguintes atributos e validações:

- Código
- Nome
- Endereço
- Cidade
- UF (Utilizar componente TDbComboBox)
- CPF
- Data de nascimento
- Limite de crédito.


1) A aplicação deverá ter as seguintes operações:
a) Cadastrar
b) Editar
c) Excluir
d) Listar (em grid)

Regras do programa:

1) Não será permitido cadastrar clientes menores de 18 anos de idade.

2) Os registro pré-inseridos deverão ser gravados em arquivo (DataSet.SaveToFile() e DataSet.LoadFromFile() )

3) O limite inicial deverá ser proporcional à idade:
a) 18-22: Limite máximo de R$4.000
b) 23-30: Limite máximo de R$10.000
c) Acima de 31 não haverá limites.

4) A lista de UFs deverá ser pre-estabelecida (Utilizem a propriedade Items)

5) O código do cliente é único, e a aplicação deve gera-lô na inserção de um novo registro(implementar lógica para criar sequencial)

6) A tela de cadastro deve ser diferente da tela de listagem(show ou showModal)

