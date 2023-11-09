// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract BlockChainRealEstate {
    struct houseAdvertisement {
        uint id;
        uint sqft;
        uint price;
        string location;
        address owner;
        address costumer;
        bool ownerCheck;
        bool costumerCheck;
        bool finalSituation;
        bool withdrawalStatus;
    }

    uint public id = 0;
    mapping(uint => houseAdvertisement) public Advertisements;

    function buyHouse(uint _id) public payable {
        houseAdvertisement storage houseAdvertisement = Advertisements[_id];

        require(houseAdvertisement.owner != msg.sender);
        require(houseAdvertisement.price <= msg.value);

        houseAdvertisement.costumer = msg.sender;
    }

    function sellhouse(uint _sqft, uint _price, string memory _location) public {
        houseAdvertisement memory houseAdvertisement = houseAdvertisement({
            id: id, 
            m2: _sqft,
            price: _price,
            location: _location,
            owner: msg.sender,
            costumer: msg.sender,
            ownerCheck: false,
            costumerCheck: false,
            finalSituation: false,
            withdrawalStatus: false
            });
        Advertisements[id] = houseAdvertisement;
        id++;

        houseAdvertisement.owner = msg.sender;
    }

    function accept(uint _id) public {
        houseAdvertisement storage houseAdvertisement = Advertisement[_id];

        require(houseAdvertisement.owner != houseAdvertisement.costumer);
        require(msg.sender == houseAdvertisement.owner || msg.sender == houseAdvertisement.costumer);
        
        if (msg.sender == houseAdvertisement.owner) {
            houseAdvertisement.ownerCheck = true;
        } else if (msg.sender == houseAdvertisement.costumer) {
            houseAdvertisement.costumerCheck = true;
        }

        if (houseAdvertisement.costumerCheck == true && houseAdvertisement.ownerCheck == true) {
            houseAdvertisement.finalSituation = true;
        }
    }

    function withdrawMoney(uint _id) public {
        houseAdvertisement storage houseAdvertisement = Advertisement[_id];

        require(houseAdvertisement.owner == msg.sender);
        require(houseAdvertisement.finalSituation == true);

        payable(houseAdvertisement.owner).transferhouseAdvertisement.price);

    }
}
