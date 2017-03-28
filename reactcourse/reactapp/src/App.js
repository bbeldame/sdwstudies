import React, { Component } from 'react';
import './App.css';
import CatList from './CatList';
import CatSelected from './CatSelected';
import CatCreation from './CatCreation';
import { cats } from './db/cats.json';

class App extends Component {
  constructor(props) {
    super(props);

    const smartCats = cats.map(cat => {
      return {...cat, selected: false};
    });

    this.state = {
      cats: smartCats
    };
  }

  select(index) {
    const cats = this.state.cats;

    cats[index].selected = !cats[index].selected;
    this.setState({
      cats
    });
  }

  addCat(newCat) {
    console.log(newCat);
    let cats = this.state.cats;

    cats.unshift(newCat);
    this.setState({ cats });
  }

  render() {
    return (
      <div className="App">
        <div className="App-header">
          <h2>Welcome to Cat Battle</h2>
        </div>
        <CatCreation addCat={this.addCat.bind(this)}/>
        <CatSelected cats={this.state.cats}/>
        <hr/>
        <CatList cats={this.state.cats} select={this.select.bind(this)}/>
      </div>
    );
  }
}

export default App;
