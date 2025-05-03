// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract TodoList {
    enum Status {
        Pending,
        InProgress,
        Completed
    }

    struct Todo {
        uint256 id;
        string content;
        Status status;
    }

    uint[] private todoIds;
    mapping(uint => Todo) private allTodos;

    function addTodo(string memory _content) public {
        uint id = todoIds.length + 1;

        Todo memory todo = Todo({ id: id, content: _content, status: Status.Pending });
        allTodos[id] = todo;
        todoIds.push(id);
    }

    function updateStatus(uint _id, Status _status) public{
        Todo storage todo = allTodos[_id];
        
        todo.id = _id;
        todo.status = _status;
    }

    function getTodo(uint _id) public view returns (Todo memory){
        require((_id < todoIds.length + 1) && (_id > 0), "Todo does not exist");
        return allTodos[_id];
    }
}