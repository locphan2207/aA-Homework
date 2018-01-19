import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    // your code here
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
    this.state = {
      input1: "",
      input2: "",
      result: 0
    };
  }
  //fdsafdsa
  // your code here

  render() {
    const {input1, input2, result} = this.state;
    return (
      <div>
        <input onChange={this.setNum1} value={input1}/>
        <input onChange={this.setNum2} value={input2}/>
        <h1>{result}</h1>
        <button onClick ={this.add}>Add</button>
        <button onClick ={this.subtract}>Subtract</button>
        <button onClick ={this.multiply}>Multiply</button>
        <button onClick ={this.divide}>Divide</button>

        <button onClick={this.clear}>Clear Form</button>
      </div>
    );
  }

  clear(e) {
    e.preventDefault();
    this.setState({input1: "", input2: "", result: 0});
  }

  setNum1(e) {
    const input1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({input1: input1});
  }

  setNum2(e) {
    const input2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({input2: input2});
  }

  add(e) {
    e.preventDefault();
    this.setState({result: this.state["input1"] + this.state["input2"]});
  }

  subtract(e) {
    e.preventDefault();
    this.setState({result: this.state["input1"] - this.state["input2"]});
  }

  multiply(e) {
    e.preventDefault();
    this.setState({result: this.state["input1"] * this.state["input2"]});
  }

  divide(e) {
    e.preventDefault();
    this.setState({result: this.state["input1"] / this.state["input2"]});
  }
}

export default Calculator;
