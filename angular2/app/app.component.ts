import { Component } from '@angular/core';
import { Config } from './config';
import { Student } from './dataModel/student.data.model';

@Component({
    selector: 'my-app',
    //template: '<h1>My First Angular App</h1>',
    styleUrls:['app/styles/app.styles.css'],
    templateUrl: 'app/partials/app.component.html'
})
export class AppComponent {
    studentList = Config.STUDENTS;
    newStudent: Student;
    selectedStudent: Student;
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
    onSelect(student: Student): void {
        this.selectedStudent = student;
    };
    state = Config.state;
    title = Config.app_title;
    subtitle= Config.app_subtitle;
    editpls= Config.edit_pls;
    addbtn= Config.add_btn;
    editbtn= Config.edit_btn;
}
