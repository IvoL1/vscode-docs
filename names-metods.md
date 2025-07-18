
# 📚 **Nomes de métodos para Controller / Service / Repository**

## 🟦 **CRUD Básico (User, Team, Task, etc.)**

| Controller         | Service             | Repository           | Descrição                                 |
|--------------------|---------------------|----------------------|-------------------------------------------|
| create             | create              | create               | Criar novo registro                       |
| getAll             | getAll              | findAll              | Buscar todos os registros                 |
| getById            | getById             | findById             | Buscar por ID                             |
| update             | update              | update               | Atualizar registro                        |
| delete             | delete              | delete               | Deletar registro                          |

---

## 🟩 **Busca e Filtros**

| Controller         | Service             | Repository           | Descrição                                 |
|--------------------|---------------------|----------------------|-------------------------------------------|
| getByEmail         | getByEmail          | findByEmail          | Buscar por email                          |
| getByUsername      | getByUsername       | findByUsername       | Buscar por username                       |
| getByTeam          | getByTeam           | findByTeam           | Buscar por time                           |
| getByStatus        | getByStatus         | findByStatus         | Buscar por status (ex: tarefas)           |
| getByPriority      | getByPriority       | findByPriority       | Buscar por prioridade (ex: tarefas)       |

---

## 🟨 **Autenticação e Sessão**

| Controller         | Service             | Repository           | Descrição                                 |
|--------------------|---------------------|----------------------|-------------------------------------------|
| login              | login               | findByEmail          | Login/autenticação                        |
| logout             | logout              | -                    | Logout (se aplicável)                     |
| refreshToken       | refreshToken        | -                    | Renovar token (se aplicável)              |

---

## 🟧 **Relacionamentos (Times, Membros, etc.)**

| Controller         | Service             | Repository           | Descrição                                 |
|--------------------|---------------------|----------------------|-------------------------------------------|
| addMember          | addMember           | addMember            | Adicionar membro a time                   |
| removeMember       | removeMember        | removeMember         | Remover membro de time                    |
| getMembers         | getMembers          | findMembersByTeam    | Listar membros de um time                 |

---

## 🟫 **Tarefas (Tasks)**

| Controller         | Service             | Repository           | Descrição                                 |
|--------------------|---------------------|----------------------|-------------------------------------------|
| assignTask         | assignTask          | assignTask           | Atribuir tarefa a usuário                 |
| changeStatus       | changeStatus        | updateStatus         | Alterar status da tarefa                  |
| changePriority     | changePriority      | updatePriority       | Alterar prioridade da tarefa              |

---

## 🟪 **Outros nomes úteis**

| Nome               | Uso típico          | Descrição                                 |
|--------------------|---------------------|-------------------------------------------|
| count              | count               | Contar registros                          |
| exists             | exists              | Verificar existência                      |
| search             | search              | Busca avançada                            |
| list               | list                | Listar registros (sinônimo de getAll)     |

---

## 🎯 **Dicas de nomenclatura**

- **Controller:** use nomes voltados para a ação HTTP (get, create, update, delete).
- **Service:** use nomes que expressem a lógica de negócio (getUserById, assignTask).
- **Repository:** use nomes que expressem a operação no banco (findById, findAll, update, delete).

---

## 📝 **Exemplo prático para User**

```typescript
// Controller
create(req, res)
getAll(req, res)
getById(req, res)
update(req, res)
delete(req, res)
login(req, res)

// Service
create(data)
getAll()
getById(id)
update(id, data)
delete(id)
login(credentials)

// Repository
create(data)
findAll()
findById(id)
update(id, data)
delete(id)
findByEmail(email)
```
