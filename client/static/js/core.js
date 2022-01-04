const is_core = true;
const TAR_NETWORK = 80001;
var ins_ethereum = {};

const initialState = {
  locked: false,
  is_connected: null,
  current_address: null
}

const state = new StateManager(initialState);

// @Tai: Polymorphism is stupid
const ELEMS = {
  cardsId: "card_id"
}

function StateManager(_initialState){
  let state = Object.assign({},_initialState);

  __lock = () => {
    state.locked = true;
  }

  __unlock = () => {
    state.locked = false;
  }

  __changeState = (_key, _value) => {
    __lock();
    state[_key] = _value; 
    __unlock();
  }

  __getState = (_key) => {
    return state[_key];
  }

  this.getState = (_key) => {
    return __getState(_key)
  }

  this.setState = (_key, _value) => {
    !state.locked? __changeState(_key, _value) : false;
    console.log(state)
  }

}

function checkForMetamask(_window) {
    if (_window.ethereum && _window.ethereum.isMetaMask) {
      console.log("아싸! Metamask Detected, Motherfucker.");
      return ethereum;
    } else {
      console.log("Please Install Metamask, Pencil Prick.");
      return false;
    };
}

$(document).ready(()=>{
  ins_ethereum = checkForMetamask(window)
})

