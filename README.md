Voting Smart Contract on Base Testnet Network
This is a simple smart contract written in Solidity that enables users to vote for a specific option on the Base Testnet Network. The contract keeps track of the votes and allows for vote counting.

How it Works
The contract utilizes two mappings:

votes: Maps each voter's address to their chosen option.
voteCount: Maps each option to the number of votes it has received.
Functions
vote(uint256 _option) external: Allows users to cast their votes for a specific option. The chosen option must be greater than 0.

getVote(address _voter) external view returns (uint256): Retrieves the option voted for by a specific voter.

getCount(uint256 _option) external view returns (uint256): Retrieves the total count of votes received for a specific option.

countVotes(uint256 _option) external: Manually counts the votes for a specific option. This function is useful for auditing purposes.

Events
The contract emits two events:

VoteCast: Triggered when a voter casts their vote. It includes the voter's address and the chosen option.

VoteCounted: Triggered when votes are manually counted for a specific option. It includes the option and the vote count.

Usage
Deploy the smart contract on the Base Testnet Network.

Users can call the vote function to cast their votes by providing the chosen option.

Call the getVote function to retrieve the option voted for by a specific voter.

Call the getCount function to get the total count of votes received for a specific option.

To audit the votes, call the countVotes function with the desired option.

Note
This contract is deployed on the Base Testnet Network for testing purposes only. It should not be used for any production deployment.

Feel free to explore and experiment with the smart contract on the Base Testnet Network.

Stay as Omega! 🌟





