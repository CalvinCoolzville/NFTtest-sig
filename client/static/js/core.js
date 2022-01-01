const is_core = true;
const TAR_NETWORK = 80001;
var ins_ethereum = null;


// @Tai: Polymorphism is stupid
const ELEMS = {
  cardsId: "card_id"
}

function checkForMetamask(_window) {
    console.log("WINDOW",_window);
    if (_window.ethereum && _window.ethereum.isMetaMask) {
      console.log("아싸! Metamask Detected, Motherfucker.");
      return ethereum;
    } else {
      console.log("Please Install Metamask, Pencil Prick.");
      return false;
    };
}


function connectWallet() {
  // Handle Connection
  // assert correct Network if not, then provide link for adding preferred Network and Disconnect
  ins_ethereum = checkForMetamask(window);

  if (!ethereum) {
    alert("Metamask is Not Installed")
    return;
  }
  ethereum.enable();

}
