pragma solidity ^0.4.18;

import "./ERC20.sol";

contract UndefinedName {

	enum TopicState {
		Open,
		Closed,
		Finished
	}

	struct Donation {
		address sender;
		uint256 value;
	}

	struct Multihash {
		bytes32 hash;
		uint8 hash_function;
		uint8 size;
	}

	struct Topic {
		address creator;
		address arbiter;
		Multihash title;
		Multihash description;
		uint8 editorReward;
		uint8 arbiterReward;
		uint8 creatorReward;
	}

	ERC20 RESToken = ERC20("0x00");
	Topic[] public topics;
	Donation[] public donations;

	function createTopic(
		address _arbiter,
		bytes32 _titleHash,
		uint8 _titleFunction,
		uint8 _titleSize,
		bytes32 _descriptionHash,
		uint8 _descriptionFunction,
		uint8 _descriptionSize,
		uint8 _editorReward,
		uint8 _arbiterReward,
		uint8 _creatorReward
	) public {

		/**
		 * @dev see https://ethereum.stackexchange.com/questions/17094/how-to-store-ipfs-hash-using-bytes
		 */
		Multihash memory _title = Multihash(_titleHash, _titleFunction, _titleSize);
		Multihash memory _description = Multihash(_descriptionHash, _descriptionFunction, _descriptionSize);

		Topic memory topic = Topic(msg.sender, _arbiter, _title, _description, _editorReward, _arbiterReward, _creatorReward);
		topics.push(topic);
	}

	function donate(uint256 value) public {
		
		/**
		 * @dev https://medium.com/@jgm.orinoco/ethereum-smart-service-payment-with-tokens-60894a79f75c?source=user_profile---------14----------------
		 */
		require(RESToken.transferFrom(msg.sender, address(this), value));
		Donation memory _donation = Donation(msg.sender, value);
		donations.push(_donation);
	}

}