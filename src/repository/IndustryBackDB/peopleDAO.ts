//    ETLBackEnd
//    Copyright (c) 2021 ETLBackEnd
//
//    This file is part of ETLBackEnd
//    @uthor: Andrés Mauricio Martinez Hincapié
//
//    ETLBackEnd is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    ETLBackEnd is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with ETLBackEnd.  If not, see <http://www.gnu.org/licenses/>.

import { DataBaseService } from '../../db/dev/dataBaseService';
import * as uuid from "uuid";
import { People } from 'models/ETLBackEnd/people';
import { LogEnum } from '../../models/ETLBackEnd/log.enum';
import { LogDAO } from './logDAO';
import * as bcrypt from 'bcrypt'

export class PeopleDAO {

    private log: LogDAO;
    private connection;
    constructor() {
        this.connection = DataBaseService.getInstance();
        this.log = new LogDAO()
    }

    public async insertPeople(people: People) {
        try {
            this.connection.pool.query('INSERT INTO adm.tbl_people (id, name, apppassword) VALUES ($1, $2, $3)', [people.id, people.name, people.apppassword], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              })
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${PeopleDAO.name} -> ${this.insertPeople.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async getPeople() {
        try {
            var res = await this.connection.pool.query('SELECT id, name, apppassword FROM adm.tbl_people', "").then(res => { return res.rows })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${PeopleDAO.name} -> ${this.getPeople.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async getPeopleById(peopleId: People) {
        try {
            var res = await this.connection.pool.query('SELECT id, name, apppassword FROM adm.tbl_people where id = $1', [peopleId.id], "").then(res => { return res.rows[0] })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${PeopleDAO.name} -> ${this.getPeopleById.name}: ${error}`)
            return new Error(error);
        }
    }

    public async updatePeople(people: People) {
        try {
            this.connection.pool.query('UPDATE adm.tbl_people SET name = $2, apppassword = $3  WHERE id = $1', [people.id, people.name, people.apppassword], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              });
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${PeopleDAO.name} -> ${this.updatePeople.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async deletePeople(peopleId: string) {
        try {
            this.connection.pool.query('DELETE FROM adm.tbl_people WHERE id = $1', [peopleId], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              });
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${PeopleDAO.name} -> ${this.deletePeople.name}: ${error}`)
            throw new Error(error)
        }
    }
    
    public async val(id: string, pass: string) {
        try {
            var res = await this.connection.pool.query('SELECT id, name, apppassword FROM adm.tbl_people where id = $1 and apppassword = $2', [id, pass], "").then(res => { return res.rows[0] })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${PeopleDAO.name} -> ${this.getPeopleById.name}: ${error}`)
            return new Error(error);
        }
    }

}
