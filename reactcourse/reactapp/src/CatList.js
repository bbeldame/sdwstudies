import React, { Component } from 'react';
import './App.css';

class CatList extends Component {
  catList() {
    const listcats = this.props.cats.map((cat, index) =>
      <img
        onClick={() => this.props.select(index)}
        key={cat.id}
        alt={cat.slug}
        src={cat.url}
        className={cat.selected ? 'selected' : 'notselected'} />
    );
    return (
      <div>{listcats}</div>
    );
  }

  render() {
    return (
      <div>{this.catList()}</div>
    );
  }
}

export default CatList;