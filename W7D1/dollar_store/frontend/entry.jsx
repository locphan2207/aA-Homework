import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './widget';
import store from './store';

document.addEventListener("DOMContentLoaded", function(){
  const root = document.getElementById('root');
  ReactDOM.render(<Widget store={store}/>, root);
});
