import { Student } from './dataModel/student.data.model'

export class Config {
    public static get app_title() : string {
        return 'Aids Factory';
    }
    public static get app_subtitle() : string {
        return 'code avec le cul';
    }
    public static get edit_pls() : string {
        return 'edit pls :';
    }
    public static get add_btn() : string {
        return 'Add new';
    }
    public static get edit_btn() : string {
        return 'Edit';
    }
    public static get state() : [string] {
       return ['Present', 'Absent', 'Retard'];
    }
    public static get STUDENTS(): [Student] {
        return [
            {
                id: 1,
                firstname:'Pierro',
                lastname:'Stone',
                state: 1
            },
            {
                id: 2,
                firstname:'Toto',
                lastname:'Richard',
                state: 3
            },
            {
                id: 3,
                firstname:'Alfred',
                lastname:'Cactus',
                state: 2
            },
            {
                id: 4,
                firstname:'Antoine',
                lastname:'Voiture',
                state: 1
            },
            {
                id: 5,
                firstname:'Albert',
                lastname:'Arthiro',
                state: 2
            },
            {
                id: 6,
                firstname:'Sami',
                lastname:'Remi',
                state: 3
            }
        ]
    }
}