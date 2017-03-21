import React, { Component } from 'react';
import './App.css';

class CatSelected extends Component {
  catList(selectedCats) {
    const listcats = selectedCats.map(cat =>
        <img
            key={cat.id}
            alt={cat.slug}
            src={cat.url}/>
        );
    return (
      <div>{listcats}</div>
    );
  }

  render() {
    const selectedCats = this.props.cats.filter(cat => cat.selected);
    return (
      <div>{this.catList(selectedCats)}</div>
    );
  }
}

export default CatSelected;