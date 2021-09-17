import { DataBaseService } from '../../db/dev/dataBaseService';
import * as uuid from "uuid";
import { Adult } from 'models/ETLBackEnd/adult';
import { LogEnum } from '../../models/ETLBackEnd/log.enum';
import { LogDAO } from './logDAO';
import * as bcrypt from 'bcrypt'

export class AdultDAO {

    private log: LogDAO;
    private connection;
    constructor() {
        this.connection = DataBaseService.getInstance();
        this.log = new LogDAO()
    }

    public async insertAdult(adult: Adult) {
        try {
            this.connection.pool.query('INSERT INTO test.tbl_adult (id, name, birth_date) VALUES ($1, $2, $3)', [adult.id, adult.name, adult.birth_date], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              })
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${AdultDAO.name} -> ${this.insertAdult.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async getAdult() {
        try {
            var res = await this.connection.pool.query('SELECT * FROM test.tbl_adult', "").then(res => { return res.rows })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${AdultDAO.name} -> ${this.getAdult.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async getAdultById(adultId: Adult) {
        try {
            var res = await this.connection.pool.query('SELECT * FROM test.tbl_adult where id = $1', [adultId.id], "").then(res => { return res.rows[0] })
                .catch(e => console.error(e.stack));
            return res;
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${AdultDAO.name} -> ${this.getAdultById.name}: ${error}`)
            return new Error(error);
        }
    }

    public async updateAdult(adult: Adult) {
        try {
            this.connection.pool.query('UPDATE test.tbl_adult SET name = $2, birth_date = $3  WHERE id = $1', [adult.id, adult.name, adult.birth_date], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              });
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${AdultDAO.name} -> ${this.updateAdult.name}: ${error}`)
            throw new Error(error)
        }
    }

    public async deleteAdult(adultId: string) {
        try {
            this.connection.pool.query('DELETE FROM test.tbl_adult WHERE id = $1', [adultId], (error, results) => {
                if (error) {
                  throw error
                }
                return results;
              });
        } catch (error) {
            this.log.insertLog(LogEnum.ERROR, `${AdultDAO.name} -> ${this.deleteAdult.name}: ${error}`)
            throw new Error(error)
        }
    }

}
