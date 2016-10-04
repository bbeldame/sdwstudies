import { Component, Input, Output, EventEmitter } from '@angular/core';
import { Config } from '../config';
import { Student } from '../dataModel/student.data.model';

@Component({
    selector: 'add-student',
    templateUrl: 'app/partials/directives/add.student.dir.html'
})

export class AddStudentDirective {
    addbtn = Config.add_btn;
    @Input() newStudent: Student;
    @Output() sendNewStudentData = new EventEmitter();
    addStudent(event: any){
        this.sendNewStudentData.emit(this.newStudent);
    }
}