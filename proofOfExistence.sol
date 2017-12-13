pragma solidity ^0.4.15;

contract ProofOfExistence{
  bytes32[] public proofs;
  address public owner;
  
  // constructor
  function ProofOfExistence() public {owner = owner_();}
  
  function storeProof(bytes32 proof) private {
    proofs.push(proof);  
  } 
  
  function notarize (string document) public {
   bytes32 proof = proofFor(document);
   storeProof(proof);
  }

  function proofFor(string document) private pure returns (bytes32){
   return sha256(document);
  }
  
  function checkDocument(string document) public constant returns(bool){
      uint256 L=proofs.lenght;
      for(uint256 i=0; i < proofs.lenght; i++) {
          if (proofs[i]==proofFor(document)) {return true;}  }
          return false;
  }
  
  function owner_() private view returns (address){
   return msg.sender;
  }
}
