import { Component } from '@angular/core';
import { Config } from './config';

export class Student {
    id: number;
    firstname: string;
    lastname: string;
    state: number;
}

const STUDENTS: Student[] = [
    {
        id: 1,
        firstname:'Pierre',
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
];

@Component({
    selector: 'my-app',
    //template: '<h1>My First Angular App</h1>',
    styleUrls:['app/styles/app.styles.css'],
    templateUrl: 'app/partials/app.component.html'
})
export class AppComponent {
    state1 = 'Present';
    state2 = 'Retard';
    state3 = 'Absent';
    studentList = STUDENTS;
    newStudent: Student;
    constructor() {
        this.resetInput();
    };
    addStudent() {
        this.studentList.push(this.newStudent);
        this.resetInput();
    };
    resetInput() {
        this.newStudent = {id:0,firstname:'',lastname:'',state:1};
    };
    title = Config.app_title;
    subtitle='code avec le cul'
}
