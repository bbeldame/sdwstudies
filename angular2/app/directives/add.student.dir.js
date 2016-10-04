"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var core_1 = require('@angular/core');
var config_1 = require('../config');
var student_data_model_1 = require('../dataModel/student.data.model');
var AddStudentDirective = (function () {
    function AddStudentDirective() {
        this.addbtn = config_1.Config.add_btn;
        this.sendNewStudentData = new core_1.EventEmitter();
    }
    AddStudentDirective.prototype.addStudent = function (event) {
        this.sendNewStudentData.emit(this.newStudent);
    };
    __decorate([
        core_1.Input(), 
        __metadata('design:type', student_data_model_1.Student)
    ], AddStudentDirective.prototype, "newStudent", void 0);
    __decorate([
        core_1.Output(), 
        __metadata('design:type', Object)
    ], AddStudentDirective.prototype, "sendNewStudentData", void 0);
    AddStudentDirective = __decorate([
        core_1.Component({
            selector: 'add-student',
            templateUrl: 'app/partials/directives/add.student.dir.html'
        }), 
        __metadata('design:paramtypes', [])
    ], AddStudentDirective);
    return AddStudentDirective;
}());
exports.AddStudentDirective = AddStudentDirective;
//# sourceMappingURL=add.student.dir.js.map