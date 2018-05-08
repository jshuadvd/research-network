# Decentralized Research Collaboration

One of the core flows that we want to test is decentralized research collaboration. So we’re specifying a very minimal initial research network based on bounties, to build as one of our first MVPs.


# Network participants

**Creators**: Create research topics. A research topic is a self-contained scientific question, hypothesis or problem to solve. A Creator is just a Researcher with extra privileges within a specific research topic.

**Researchers**: Contribute to research topics to help answer or solve them.

**Donors**: Provide funds to incentivise researchers to contribute to a particular research topic.

**Arbiters**: Third parties with knowledge and reputation in the research field corresponding to the research topic.

**Editor**: Writes a paper that communicates the findings that happened in a research topic.

## Research Topic Flow

![Alt text](minimal-mvp.png "DApp")

To start, a Creator launches a new `ResearchTopic`. She needs to include:

-   An Arbiter that will mediate the topic. The Arbiter´s address could easily be a multisig with multiple arbiters behind the address.
-   Hypothesis / Question / Problem
-   Description (Extra info)
-   Percentage of reward that will go to the Editor
-   Percentage of rewards that the Creator will keep
-   Optionally send RES as initial funds to the contract.

Once the `ResearchTopic` is live, Researchers can start sending contributions. A contribution would be the hash of an IPFS file with the actual text. Donors can send RES at any point before the Arbiter closes the topic. The Arbiter can also at any point call the research finished and close the topic. The Arbiter should rank each contribution as:

-   Unhelpful
-   Small Contribution
-   Medium Contribution
-   Key Contribution

The percentage of funds reserved for Researchers will be distributed between all contributions with Key contributions earning more than Medium, those more than Small and Unhelpful contributions not earning any rewards. The percentage of rewards reserved for the Creator will be sent to her. The percentage reserved for the Editor will be kept locked, once the contract enters this stage, any Editor can submit a paper proposal. If accepted by the Arbiter, the Editor will receive the reward, the paper will be linked with the topic, and the topic will be finalized.

----

# Smart Contracts

## Required environment

* node & npm
* ipfs server (https://ipfs.io/docs/getting-started/)
* ganache-cli (also you can use testrpc, geth or parity)
* truffle

## Steps to run the dapp

### Tab 1

    user ~/go-ipfs $ ./ipfs daemon

### Tab 2

    user ~/ $ ganache-cli

### Tab 3

    user ~/protofire-dapp-test $ truffle console
    user ~/protofire-dapp-test $ compile
    user ~/protofire-dapp-test $ migrate --reset

### Tab 4

    user ~/protofire-dapp-test $ npm install
    user ~/protofire-dapp-test $ npm run dev