# Introduction #
This document outlines the design of the P2P networking protocol.  This is a work in progress, and will change drastically as development progresses.  Please note that this document is intended for **DEVELOPERS ONLY** however anyone is more than welcome to read.

This protocol is designed with latency in mind, not only of network latency but also input latency, and any apparent pauses or skips in gameplay.  Perhaps the most crucial issue when playing any game is distortion of sound, followed by delays in video.  It is our goal to have no distortion of sound or video due to netplay (except perhaps in cases where the connection is interrupted or severed completely), to have very little input lag (hopefully comparable to network latency), and above all, a level playing field.

An additional want that is planned for inclusion, are peers who are not playing along with the emulation, but merely spectating.  Once the initial hurdles of establishing and maintaining sync between the players has been conquered, this too will see inclusion in the design.

## Terminology ##

  * Input Latency - The delay between a button being pressed on a controller, and it's effects becoming apparent in gameplay.  This should be kept as equal as possible to ensure fairness.
  * Network Latency - The delay from when information is sent from one host to when it arrives at another host over a network.  Commonly referred to as ping time.

More to come

# Implementation #

One of the needs placed upon the p2p system is that a global state among certain peers should be maintained.  For example, when a new peer joins the network, all existing nodes should be aware of this new peer should any new requests come in.  Since this need to negotiate a consistent state between certain subsets of peers is apparent in a few places, a standardized notion of negotiating contracts is implemented.  This contract negotiation is a multi-step process, and for certain situations only specific parts of the negotiation may be used.

## Contracts ##

Contracts are a useful construct which suit three purposes:
  1. Ensuring important updates are enacted simultaneously by a given subset of peers
  1. Allowing certain updates to be negotiated, even rejected
  1. Providing an interface to see what contracts are currently in effect for a given peer

For negotiation purposes, each instance of a contract will have an identifier that acts as a lookup key.  Therefore, when replying to a notification of a pending contract, only that lookup key and it's response need be transmitted.  In addition, each instance of the contract has a state, contract-specific transitions to other states, and contract-specific responses.  Besides the per-instance information, contracts will also identify peers to which a contract may apply.  For example, a contract may be between all peers, or between a single peer and a particular subset of peers.  Thus individual peers have bitmasked id's assigned to them, which identify what groups they respond to.  In our case we will likely only create 4 classes of users, but this can be done with two bits where one identifies if a peer is in control of game-state (eg what rom is being used, pause, save state/load state etc), and the other bit identifies if a peer is participating in the emulation (are they playing with a plugged in controller)  This allows pure spectators, spectators who are in control of the game settings, players with control of the game settings, and players with no control of game settings.

The basic states that an instance of a contract may be in are:
  1. Terminate - Disabling pending copy of contract, must announce to peers that contract is no longer valid
  1. Disabled - Contract is deactivated.  This state frees the instance for future use
  1. Pending - Contract is pending approval from peers, must query non-responsive peers at timeout.  Once all peers have approved, or any hosts have denied the contract, we must either go into a terminate or issued state.
  1. Issued - Contract instance has either received all it's approvals for a pending, or is not meant to be negotiable.  These packets are sent as a part of a sync frame, and thus no handshaking is performed, once packets have been sent to all clients via sync frames, this instance should change it's state, usually to Disabled
  1. Queued - Contract instance has been distributed (or received) and is pending execution when it's event triggers.  Again changing it's state usually to Disabled, or Active.
  1. Active - If the contract is persistent, and it has been executed from the queue, it may sit in an active state until which time it is canceled, and put into the Disabled State.  This allows peers to poll each other for the state of a contract.

The standardized messages for a contract are as follow:
  1. Pending - Request for Approval or Denial of new negotiable contract
  1. Approve - Approval of pending negotiable contract
  1. Terminate - Denial of pending negotiable contract
  1. Issued - Packet is either non-negotiable, or has been approved, set time to execute event
  1. Request - Request state of contract instance on target peer, peer replies with it's state

# Establishing a Connection #
## Issues ##
In the spirit of P2P, any client is capable of acting as a server, and all connected clients must collectively act as one bootstrapping server.  All nodes should be able to handle requests by new players wanting to join, and should respond with all the needed information for that new client to connect to the other peers, currently:
  1. IP addresses of connected peers
  1. Unique identifier to assign to the joining node (player number/spectator number)

Now, a node that's just received a join request from a new client cannot immediately respond with a list of clients and id number.  Considering the case where we have two players already connected (players 1 and 2) and two simultaneous join requests are sent by two new players, (new player A, and new player B).  If both players 1 & 2 respond immediately to the join requests, without first confirming the slots are still available, than both new players A&B may be assigned the slot for player 3.

## Implementation ##
Taking advantage of the contracts mentioned before, a join request is handled by a contract, identifying the the groups of users.  The join request actually uses all of the states except for active.  First off when a new player wants to join it may request be be both or either a game-admin and game-player.  That player will be assigned an ID that may or may not satisfy that request.  For example, if no player slots are available or the admin has locked admin joins, than the new player may be given a pure-spectator connection instead.
Upon approval of the join request, the join event is scheduled for execution in the future, and the new client is sent it's join information, then both hosts are to begin transmitting sync frames, and do not start expecting packets from a host until they receive one.  Once both hosts receive one packet directly, they are connected, and once a client has connected to all hosts, it should announce the successful completion of the join request.  If the join request times out, before that peer connects to all hosts it has the option of terminating the join instead of announcing success.  It may be advantageous to allow some peers to connect partially to the network, and leave it to them to decide if they can keep up with the emulation with the connections they could make.

# Staying in Sync #
## Issues ##
Due to issues with network latency, and possible delays in emulation nodes may fall behind or lead ahead of other nodes.  Either of these scenarios are problematic.  For this reason all nodes in the network use a frame counter that is synchronized using a flocking technique.  Every sync frame is stamped with the frame number of the sending host, and upon receiving a frame, the difference in the stamp and the local frame number will be the sum of the network delay and the difference in relative synchronizations.  The difference due to ping time will always be positive, however the relative synchronizations will be positive at one host and negative at the other.  Therefore, when the frame difference calculated locally matches the frame difference calculated remotely the systems are in perfect sync.  Any disparity between these values gives us the relative clock skew, and an averaged value can be found among the playing & controlling peers which gives us the needed local speed up/slowdown factor.

If I get the time I'll throw in some equations detailing this process.

# Tables #
## Packet Structure ##
2-byte header
  * 0xFFFF - Join request
  * 0x0000-0x7FFF - Frame counters, these packets can contain 'piggybacked' packets including start-emulation requests, input updates, and join-detail packets.  Frame counters should be unique throughout the network, to ensure spectators can request all needed frames.  Presently with 15 bits we get 32768 frames, which are unique up to a minimum of 9 minutes, this means that spectators that are buffering may do so for a maximum of 9 minutes, and should in practice buffer far less than that.  This is even enough time to allow save-states to be transmitted between spectators should a new spectator or player be connected during emulation.

Every frame transmitted contains any contracted chunks for that host (latency info, input data, control data, tracked requests), and may contain additional untracked chunks.  Tracked information is guaranteed to arrive unless the system loses sync, untracked info however is not guaranteed to arrive.  Tracked info has the added cost of being broadcast to all peers that an affected node may request retransmissions from.

A sync-frame may therefore look like the following:
> `[HHLC0C1T0]U0U1U2`
  * HH=frame header 2-byte counter)
  * L=latency information 1-byte
  * C0/1=chunks for active contracts 0/1 (controller input for example)
  * T0=additional tracked chunks (start/stop/join/terminate requests)
  * U0-2=data for untracked chunks (may be in a single, or multiple wrapper chunks)

The biggest advantage of contracted data transmission is that it allows us to reduce the extra information sent, for example the player number or frame number.

All tracked chunks are timestamped and originate on particular host, thus when they are sent in the sync frame tracked portion, they have a source, and a frame counter.  If they are being relayed through another host they go in the untracked portion and must be encapsulated in a wrapper chunk.  This wrapper identifies the originating host, and the frame the chunks contained were created.

Chunks therefore can be listed in multiples, and a END\_LIST chunk exists.  Listed below are some of the different chunks used:
  1. END\_LIST\_CHUNK - This chunk identifies the end of a list of chunks, used in wrapper chunks that can contain several sub-chunks.  No extra data
  1. WRAPPER\_CHUNK - Container for chunks that are tracked being forwarded, contains the frame the tracked events were created and the id of the originating host.
  1. JOIN\_CHUNK - Container for a live peer's host & port information to give to any unestablished peers joining the network.  This chunk IS tracked
  1. PENDING\_CHUNK - Notification of new pending instance of contract, contains the id of new contract, the class of that contract, and any extra contract-specific information. This chunk IS NOT tracked
  1. APPROVE\_CHUNK - Notification of approval of new pending contract, contains id of the contract being approved, and contract-specific information if necessary. This chunk IS NOT tracked
  1. TERMINATE\_CHUNK - Notification of rejection of pending contract, contains id of contract and contract-specific information.  This chunk IS NOT tracked.
  1. ISSUED\_CHUNK - Notification of issued contract instance, that must be acted upon. Contains any contract-specific info.  This chunk IS tracked.
  1. REQUEST\_CHUNK - Request for state of a contract on a particular node, this chunk is not tracked, and the payload is contract-specific.