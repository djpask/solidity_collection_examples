pragma solidity ^0.4.15;

contract ProofOfExistence{
  bytes32[] private proofs;
  address public owner;
// ho dovuto creare la variabile lenght dato che proofs.lenght chiamandola da checkDocument dà errore
  uint256 private lenght;
  
  // constructor
  function ProofOfExistence() public {owner = owner_();}
  function owner_() private view returns (address){
   return msg.sender;
  }
  
  function notarize (string document) public {
   bytes32 proof = proofFor(document);
   storeProof(proof);
   lenght++;
  }
  
  function storeProof(bytes32 proof) private {
    proofs.push(proof);   
  }

  function proofFor(string document) private pure returns (bytes32){
   return sha256(document);
  } 
 
  function checkDocument(string document) public constant returns(bool){
       for(uint256 i=0; i < lenght; i++) {
          if (proofs[i]==proofFor(document)) {return true;}  }
          return false;
  }
  
  
}
