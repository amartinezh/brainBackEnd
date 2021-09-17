import { DataBaseService } from '../../db/dev/dataBaseService';
import * as uuid from "uuid";
import { User } from 'models/ETLBackEnd/user';
import { LogEnum } from '../../models/ETLBackEnd/log.enum';
import { LogDAO } from './logDAO';
import * as bcrypt from 'bcrypt'

export class UserDAO {

    private log: LogDAO;
    private connection;
    constructor() {
        this.connection = DataBaseService.getInstance();
        this.log = new LogDAO()
    }

    public async insertPeople(people: User) {
        try {
            this.connection.pool.query('INSERT INTO test.tbl_user (id, name, email, apppassword, cellphone, birth_date) VALUES ($1, $2, $3, $4, $5, $6)', [people.id, people.name, people.email, people.apppassword, people.cellphone, people.birth_date], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              })
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${UserDAO.name} -> ${this.insertPeople.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async getPeople() {
        try {
            var res = await this.connection.pool.query('SELECT * FROM test.tbl_user', "").then(res => { return res.rows })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${UserDAO.name} -> ${this.getPeople.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async getPeopleById(peopleId: User) {
        try {
            var res = await this.connection.pool.query('SELECT * FROM test.tbl_user where id = $1', [peopleId.id], "").then(res => { return res.rows[0] })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${UserDAO.name} -> ${this.getPeopleById.name}: ${error}`)
            return new Error(error);
        }
    }

    public async updatePeople(people: User) {
        try {
            this.connection.pool.query('UPDATE test.tbl_user SET name = $2, apppassword = $3, email = $4, cellphone = $5, birth_date = $6   WHERE id = $1', [people.id, people.name, people.apppassword, people.email, people.cellphone, people.birth_date], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              });
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${UserDAO.name} -> ${this.updatePeople.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async deletePeople(peopleId: string) {
        try {
            this.connection.pool.query('DELETE FROM test.tbl_user WHERE id = $1', [peopleId], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              });
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${UserDAO.name} -> ${this.deletePeople.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async val(email: string, pass: string) {
        try {
            var res = await this.connection.pool.query('SELECT * FROM test.tbl_user where email = $1 and apppassword = $2', [email, pass], "").then(res => { return res.rows[0] })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${UserDAO.name} -> ${this.getPeopleById.name}: ${error}`)
            return new Error(error);
        }
    }

}
