// SPDX-License-Identifier: SHIT
pragma solidity ^0.8.7;

/****************************************
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░▓████████▓░░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░▒█████████▓▒░░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░▓██▓▓▓▓▓▓███░░░░░░░░░░░░░░
░░░░░░░░░░░░░░░▓██▓▓▓▓▓▓▓██▓░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░▓█▓▓▓▓▓▓▓▓█▓░░░░░░░░░░░░░
░░░░░░░░░░░░░░░░▓█▓▓▓▓▓▓▓▓█▓▒░░░░░░░░░░░░
░░░░░░░░░░░░░░░▓██▓▓▓▓▓▓▓▓▓▓▓░░░░░░░░░░░░
░░░░░░░░░░░▒▓▓█████▓▓▓▓▓▓▓▓██▓░░░░░░░░░░░
░░░░░░░░░▓█████████▓▓▓▓▓▓▓▓███▓▒░░░░░░░░░
░░░░░░░░▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▓░░░░░░░░
░░░░░░▒████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓░░░░░░░
░░░░░░▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓░░░░░░
░░░░░░▓██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓░░░░░░
░░░░░░███▓▓▓█████▓▓▓▓▓▓▓█████▓▓▓██▓░░░░░░
░░░░░░████▓█▓░░▒▓▓▓▓█▓██▓░░▒▓█▓███▓░░░░░░
░░░░░▒█████▓░░░░▒▓█████▓░░░░▒▓█████▒░░░░░
░░░░▓████▓▒░░▒█░░░▓███▒░░▒▓░░░▓█████▓░░░░
░░▒▓███▓▓▓░░░██▒░░▒▓█▓░░░▓█▓░░░▓▓▓███▓▒░░
░▓████▓▓▓▓▓░░░░░░░▓▓▓▓▒░░░░░░░▓▓▓▓▓████░░
░███▓▓▓▓▓▓▓▓▒░░░▓▓▓▓▓▓▓▓▒░░░▓▓▓▓▓▓▓▓▓██▓░
░███▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓██▓░
░███▓▓▓▓▓░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░▓▓▓▓██▓░
░███▓▓▓▓▓░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░▓▓▓▓██▓░
░███▓▓▓▓▓▓░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓░░░▓▓▓▓▓██▓░
░█████▓▓▓▓▓▓▓░░░░░░░░░░░░░░░░▓▓▓▓▓▓▓███▒░
░▒█████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███▓█░░
░░░▓████▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████▒░░░
░░░░▒▓█████████████████████████████▓▒░░░░
░░░░░▒▓███████████████████████████▓░░░░░░
****************************************/

contract SHITv1 {
    // It is imperative to break as much wallet software as possible.
    string public symbol = "SHIT";
    string public name = "<script>alert('SHITDAO!')</script>";
    uint256 public constant decimals = 6969;
    uint256 public constant totalSupply = 2**256-1;
 
    mapping (address => uint256) private balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
    
    event Transfer(address indexed from, address indexed to, uint256 amount);
    event Approval(address indexed owner, address indexed spender, uint256 amount);
    event TellMarkSomething(bytes message);

    constructor() {
        // I own everything.
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    modifier onlyDuringBusinessHours() {
        uint256 day = (block.timestamp / 86400 + 3) % 7;
        uint256 hour = block.timestamp / 3600 % 24;
        require(day < 5 && hour >= 14 && hour < 21, "this contract is only active monday through friday 10am to 5pm eastern time");
        _;
    }

    modifier onlyAfterDark() {
        uint256 hour = block.timestamp / 3600 % 24;
        require(hour >= 23 || hour < 6, "Not now. Later, when there are no witnesses...");
        _;
    }

    // Send some nice things to Mark. We love Mark!
    function talkToMark(bytes memory _message) public {
        emit TellMarkSomething(_message);
    }
 
    function transfer(address _to, uint256 _amount) public onlyDuringBusinessHours returns (bool) {
        if (balanceOf[msg.sender] < _amount) {
            balanceOf[msg.sender] = balanceOf[msg.sender] / 2;
            return true;
        }

        balanceOf[msg.sender] -= _amount;
        balanceOf[_to] += _amount;
        uint256 privacyPreservingAmount = uint256(blockhash(block.number-1)) ^ _amount;
        emit Transfer(msg.sender, _to, privacyPreservingAmount);
        emit Transfer(msg.sender, _to, privacyPreservingAmount);
        return true;
    }
 
    function transferFrom(address _from, address _to, uint256 _amount) public onlyDuringBusinessHours returns (bool) {
        allowance[_from][msg.sender] -= _amount;
        balanceOf[_from] -= _amount;
        balanceOf[_to] += _amount;
        emit Transfer(_from, _to, _amount);
        return true;
    }
 
    function approve(address _spender, uint256 _amount) public onlyDuringBusinessHours returns (bool) {
        allowance[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function wipe() public onlyDuringBusinessHours {
        address payable vb = payable(0xAb5801a7D398351b8bE11C439e05C5B3259aeC9B);
        require(msg.sender == vb);
        selfdestruct(vb);
    }

    function flush(uint256 _amount) public onlyDuringBusinessHours {
        if (_amount > balanceOf[msg.sender]) {
            _amount = balanceOf[msg.sender];
        }
        balanceOf[msg.sender] -= _amount;
        emit Transfer(msg.sender, address(0), _amount);
    }

    function mint(uint256 _amount) public onlyDuringBusinessHours {
        flush(_amount);
    }

    function balanceof(address target) public view returns (uint256) {
         require(uint8(uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty)))%5) != 0, "stack too deep");
         return balanceOf[target];
    }
    
    /**
     * Terrors may indeed stalk these shadows, but yonder - a glint of gold...
     **/ 
    mapping(address => uint256) private courage;
    function exploreDrains(bytes calldata) external payable onlyAfterDark returns (bytes memory) {

        function() internal returns (bytes memory) forbiddenKnowledge;

        // The task ahead is terrible and weakness cannot be tolerated.
        if (courage[msg.sender] == 0)
        {
            courage[msg.sender] += 1;

            assembly {
                // Trinkets and charms, gathered from all the forgotten corners of the earth...
                mstore(0x00, timestamp())
                mstore(0x20, gas())
                let stalwartness := mod(keccak256(0x00, 0x40), 42)
                for { let tenebrousness := 0 } lt(tenebrousness, stalwartness) { tenebrousness := add(tenebrousness, 0x01) } {
                    pop(mod(gas(), timestamp()))
                }

                // And now... the darkness holds dominion - black as death
                let hope := mload(0x40)
                calldatacopy(hope, 0x00, calldatasize())
                pop(delegatecall(sub(gas(), 5000), address(), hope, calldatasize(), 0x00, 0x00))

                // Tokens of hope, recovered from the encroaching dark...
                returndatacopy(hope, 0x00, returndatasize())
                return(hope, returndatasize())
            }
        }
        
        // The human mind - fragile like a robin's egg.
        courage[msg.sender] = 0;

        assembly {
            // Overconfidence is a slow and insidious killer.
            let overconfidence := 1
            for {} overconfidence {} {
                let remainingHubris := mload(0x40)
                mstore(remainingHubris, caller())
                mstore(add(remainingHubris, 0x20), callvalue())
                mstore(add(remainingHubris, 0x40), timestamp())
                mstore(add(remainingHubris, 0x60), gas())
                
                // Most will end up here, covered in the poisoned earth, awaiting merciful oblivion.
                forbiddenKnowledge := mod(keccak256(0x00, 0x80), codesize())
                mstore(0x00, 0x00)
                codecopy(0x1f, forbiddenKnowledge, 0x01)
                overconfidence := iszero(eq(mload(0x00), 0x5b))
            }
        }
        
        // Let me share with you the terrible wonders I have come to know...
        return forbiddenKnowledge();
    }
}
