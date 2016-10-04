"use strict";
var Config = (function () {
    function Config() {
    }
    Object.defineProperty(Config, "app_title", {
        get: function () {
            return 'Aids Factory';
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Config, "app_subtitle", {
        get: function () {
            return 'code avec le cul';
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Config, "edit_pls", {
        get: function () {
            return 'edit pls :';
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Config, "add_btn", {
        get: function () {
            return 'Add new';
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Config, "edit_btn", {
        get: function () {
            return 'Edit';
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Config, "state", {
        get: function () {
            return ['Present', 'Absent', 'Retard'];
        },
        enumerable: true,
        configurable: true
    });
    Object.defineProperty(Config, "STUDENTS", {
        get: function () {
            return [
                {
                    id: 1,
                    firstname: 'Pierro',
                    lastname: 'Stone',
                    state: 1
                },
                {
                    id: 2,
                    firstname: 'Toto',
                    lastname: 'Richard',
                    state: 3
                },
                {
                    id: 3,
                    firstname: 'Alfred',
                    lastname: 'Cactus',
                    state: 2
                },
                {
                    id: 4,
                    firstname: 'Antoine',
                    lastname: 'Voiture',
                    state: 1
                },
                {
                    id: 5,
                    firstname: 'Albert',
                    lastname: 'Arthiro',
                    state: 2
                },
                {
                    id: 6,
                    firstname: 'Sami',
                    lastname: 'Remi',
                    state: 3
                }
            ];
        },
        enumerable: true,
        configurable: true
    });
    return Config;
}());
exports.Config = Config;
//# sourceMappingURL=config.js.map