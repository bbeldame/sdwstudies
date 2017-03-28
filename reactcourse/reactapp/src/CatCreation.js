import React, { Component } from 'react';
import './App.css';
import uuid from 'uuid';

class CatCreation extends Component {
    state = {
        url: ''
    }

    changeHandler = (e) => {
        this.setState({
            url: e.target.value
        });
    }

    getId = (url) => {
        return (uuid.v1());
    }

    submitHandler = () => {
        if (this.state.url.length >= 10) {
            this.props.addCat({
                url: this.state.url,
                strength: Math.floor(Math.random() * (100 - 1)),
                id: this.getId(this.state.url)
            });
            this.setState({url: ''});
        }
    }

    render() {
        return (
            <div>
                <h1>Création de chats</h1>
                <div>
                    <label htmlFor='url'></label>
                    <input
                        type='text'
                        name='url'
                        value={this.state.url}
                        onChange={this.changeHandler}/>
                    <input
                        type='submit'
                        onClick={this.submitHandler}/>
                </div>
            </div>
        );
    }
}

export default CatCreation;