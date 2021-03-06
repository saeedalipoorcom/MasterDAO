//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DAOToken is ERC20Votes, Ownable {
    constructor(uint256 _amountToMint)
        ERC20("DAOToken", "DAOToken")
        ERC20Permit("DAOToken")
    {
        _mint(msg.sender, _amountToMint);
    }

    function _afterTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override(ERC20Votes) {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount) internal override(ERC20Votes) {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20Votes)
    {
        super._burn(account, amount);
    }

    function addPower(address _userAddress) public onlyOwner returns (bool) {
        _delegate(_userAddress, _userAddress);
        return true;
    }
}
