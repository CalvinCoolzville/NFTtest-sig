if (!is_core || !state || !ins_ethereum) {
    alert("@DEV: Needs Core");
}

function connectWallet() {
    // Handle Connection
    // assert correct Network if not, then provide link for adding preferred Network and Disconnect
  
    if (!ins_ethereum) {
      alert("Metamask is Not Installed")
      return;
    }
    ins_ethereum.enable();
  
    state.setState("current_address", ins_ethereum.selectedAddress);
    const current_address = state.getState("current_address");
    $("#wallet_button").text(current_address);
  }
  
  function setListeners () {
    
  }