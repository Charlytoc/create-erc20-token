const CharlyToken = artifacts.require("CharlyToken");

module.exports = function(deployer) {
  const initialSupply = 123456789; // Ajusta la cantidad inicial según tus necesidades
  deployer.deploy(CharlyToken, initialSupply);
};