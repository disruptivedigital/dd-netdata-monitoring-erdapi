# Elrond real-time node performance and health monitoring
# powered by DisruptiveDigital 2020

# shellcheck shell=bash
# no need for shebang - this file is loaded from charts.d.plugin

# if this chart is called elrond.chart.sh, then all functions and global variables
# must start with elrond_

# update_every is a special variable - it holds the number of seconds
# between the calls of the _update() function
elrond_update_every=20

# the priority is used to sort the charts on the dashboard
# 1 = the first chart
elrond_priority=1

# to enable this chart, you have to set this to 12345
# (just a demonstration for something that needs to be checked)
elrond_magic_number=12345

# global variables to store our collected data
# remember: they need to start with the module name elrond_
elrond_current_round_node0=
elrond_current_round_node1=
elrond_current_round_node2=
elrond_synced_round_node0=
elrond_synced_round_node1=
elrond_synced_round_node2=
elrond_node_type_node0=
elrond_node_type_node1=
elrond_node_type_node2=
elrond_peer_type_node0=
elrond_peer_type_node1=
elrond_peer_type_node2=
elrond_shard_id_node0=
elrond_shard_id_node1=
elrond_shard_id_node2=
elrond_app_version_node0=
elrond_app_version_node1=
elrond_app_version_node2=
elrond_epoch_number_node0=
elrond_epoch_number_node1=
elrond_epoch_number_node2=
elrond_connected_peers_node0=
elrond_connected_peers_node1=
elrond_connected_peers_node2=
elrond_connected_validators_node0=
elrond_connected_validators_node1=
elrond_connected_validators_node2=
elrond_connected_nodes_node0=
elrond_connected_nodes_node1=
elrond_connected_nodes_node2=
elrond_bls_node0=
elrond_bls_node1=
elrond_bls_node2=
elrond_tempRating_node0=
elrond_tempRating_node1=
elrond_tempRating_node2=
elrond_count_consensus_node0=
elrond_count_consensus_node1=
elrond_count_consensus_node2=
elrond_count_consensus_accepted_blocks_node0=
elrond_count_consensus_accepted_blocks_node1=
elrond_count_consensus_accepted_blocks_node2=
elrond_count_leader_node0=
elrond_count_leader_node1=
elrond_count_leader_node2=
elrond_count_accepted_blocks_node0=
elrond_count_accepted_blocks_node1=
elrond_count_accepted_blocks_node2=
elrond_num_leader_success_node0=
elrond_num_leader_success_node1=
elrond_num_leader_success_node2=
elrond_num_leader_failure_node0=
elrond_num_leader_failure_node1=
elrond_num_leader_failure_node2=
elrond_num_validator_success_node0=
elrond_num_validator_success_node1=
elrond_num_validator_success_node2=
elrond_num_validator_failure_node0=
elrond_num_validator_failure_node1=
elrond_num_validator_failure_node2=
elrond_num_validator_ignored_signatures_node0=
elrond_num_validator_ignored_signatures_node1=
elrond_num_validator_ignored_signatures_node2=
elrond_total_num_leader_success_node0=
elrond_total_num_leader_success_node1=
elrond_total_num_leader_success_node2=
elrond_total_num_leader_failure_node0=
elrond_total_num_leader_failure_node1=
elrond_total_num_leader_failure_node2=
elrond_total_num_validator_success_node0=
elrond_total_num_validator_success_node1=
elrond_total_num_validator_success_node2=
elrond_total_num_validator_failure_node0=
elrond_total_num_validator_failure_node1=
elrond_total_num_validator_failure_node2=
elrond_total_num_validator_ignored_signatures_node0=
elrond_total_num_validator_ignored_signatures_node1=
elrond_total_num_validator_ignored_signatures_node2=

elrond_get() {

  elrond_current_round_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_current_round )"
  elrond_current_round_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_current_round )"
  elrond_current_round_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_current_round )"
  elrond_synced_round_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_synchronized_round )"
  elrond_synced_round_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_synchronized_round )"
  elrond_synced_round_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_synchronized_round )"
  elrond_node_type_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_node_type )"
  elrond_node_type_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_node_type )"
  elrond_node_type_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_node_type )"
  elrond_peer_type_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_peer_type )"
  elrond_peer_type_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_peer_type )"
  elrond_peer_type_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_peer_type )"
  elrond_shard_id_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_shard_id | head -c2 )"
  elrond_shard_id_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_shard_id | head -c2 )"
  elrond_shard_id_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_shard_id | head -c2 )"
  elrond_app_version_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_app_version | head -c10 )"
  elrond_app_version_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_app_version | head -c10 )"
  elrond_app_version_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_app_version | head -c10 )"
  elrond_epoch_number_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_epoch_number )"
  elrond_epoch_number_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_epoch_number )"
  elrond_epoch_number_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_epoch_number )"
  elrond_connected_peers_node0="$( curl -sSL http://localhost:8080/node/status | jq .data.metrics.erd_num_connected_peers )"
  elrond_connected_peers_node1="$( curl -sSL http://localhost:8081/node/status | jq .data.metrics.erd_num_connected_peers )"
  elrond_connected_peers_node2="$( curl -sSL http://localhost:8082/node/status | jq .data.metrics.erd_num_connected_peers )"
  elrond_connected_validators_node0="$( curl -sSL http://localhost:8080/node/heartbeatstatus | jq '.' | grep peerType | grep -c -v observer )"
  elrond_connected_validators_node1="$( curl -sSL http://localhost:8081/node/heartbeatstatus | jq '.' | grep peerType | grep -c -v observer )"
  elrond_connected_validators_node2="$( curl -sSL http://localhost:8082/node/heartbeatstatus | jq '.' | grep peerType | grep -c -v observer )"
  elrond_connected_nodes_node0="$( curl -sSL http://localhost:8080/node/status | jq .data.metrics.erd_connected_nodes )"
  elrond_connected_nodes_node1="$( curl -sSL http://localhost:8081/node/status | jq .data.metrics.erd_connected_nodes )"
  elrond_connected_nodes_node2="$( curl -sSL http://localhost:8082/node/status | jq .data.metrics.erd_connected_nodes )"
  elrond_bls_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_public_key_block_sign )"
  elrond_bls_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_public_key_block_sign )"
  elrond_bls_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_public_key_block_sign )"
  elrond_tempRating_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".tempRating' | head -c5 )"
  elrond_tempRating_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".tempRating' | head -c5 )"
  elrond_tempRating_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".tempRating' | head -c5 )"
  elrond_count_consensus_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_count_consensus )"
  elrond_count_consensus_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_count_consensus )"
  elrond_count_consensus_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_count_consensus )"
  elrond_count_consensus_accepted_blocks_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_count_consensus_accepted_blocks )"
  elrond_count_consensus_accepted_blocks_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_count_consensus_accepted_blocks )"
  elrond_count_consensus_accepted_blocks_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_count_consensus_accepted_blocks )"
  elrond_count_leader_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_count_leader )"
  elrond_count_leader_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_count_leader )"
  elrond_count_leader_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_count_leader )"
  elrond_count_accepted_blocks_node0="$( curl -sSL http://localhost:8080/node/status | jq -r .data.metrics.erd_count_accepted_blocks )"
  elrond_count_accepted_blocks_node1="$( curl -sSL http://localhost:8081/node/status | jq -r .data.metrics.erd_count_accepted_blocks )"
  elrond_count_accepted_blocks_node2="$( curl -sSL http://localhost:8082/node/status | jq -r .data.metrics.erd_count_accepted_blocks )"
  elrond_num_leader_success_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".numLeaderSuccess' )"
  elrond_num_leader_success_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".numLeaderSuccess' )"
  elrond_num_leader_success_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".numLeaderSuccess' )"
  elrond_num_leader_failure_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".numLeaderFailure' )"
  elrond_num_leader_failure_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".numLeaderFailure' )"
  elrond_num_leader_failure_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".numLeaderFailure' )"
  elrond_num_validator_success_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".numValidatorSuccess' )"
  elrond_num_validator_success_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".numValidatorSuccess' )"
  elrond_num_validator_success_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".numValidatorSuccess' )"
  elrond_num_validator_failure_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".numValidatorFailure' )"
  elrond_num_validator_failure_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".numValidatorFailure' )"
  elrond_num_validator_failure_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".numValidatorFailure' )"
  elrond_num_validator_ignored_signatures_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".numValidatorIgnoredSignatures' )"
  elrond_num_validator_ignored_signatures_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".numValidatorIgnoredSignatures' )"
  elrond_num_validator_ignored_signatures_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".numValidatorIgnoredSignatures' )"
  elrond_total_num_leader_success_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".totalNumLeaderSuccess' )"
  elrond_total_num_leader_success_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".totalNumLeaderSuccess' )"
  elrond_total_num_leader_success_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".totalNumLeaderSuccess' )"
  elrond_total_num_leader_failure_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".totalNumLeaderFailure' )"
  elrond_total_num_leader_failure_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".totalNumLeaderFailure' )"
  elrond_total_num_leader_failure_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".totalNumLeaderFailure' )"
  elrond_total_num_validator_success_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".totalNumValidatorSuccess' )"
  elrond_total_num_validator_success_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".totalNumValidatorSuccess' )"
  elrond_total_num_validator_success_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".totalNumValidatorSuccess' )"
  elrond_total_num_validator_failure_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".totalNumValidatorFailure' )"
  elrond_total_num_validator_failure_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".totalNumValidatorFailure' )"
  elrond_total_num_validator_failure_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".totalNumValidatorFailure' )"
  elrond_total_num_validator_ignored_signatures_node0="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node0'".totalNumValidatorIgnoredSignatures' )"
  elrond_total_num_validator_ignored_signatures_node1="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node1'".totalNumValidatorIgnoredSignatures' )"
  elrond_total_num_validator_ignored_signatures_node2="$( curl -sSL https://api.elrond.com/validator/statistics | jq '.data.statistics."'$elrond_bls_node2'".totalNumValidatorIgnoredSignatures' )"

  # this should return:
  #  - 0 to send the data to netdata
  #  - 1 to report a failure to collect the data
  return 0
}

# _check is called once, to find out if this chart should be enabled or not
elrond_check() {
  # this should return:
  #  - 0 to enable the chart
  #  - 1 to disable the chart

  # check something
  [ "${elrond_magic_number}" != "12345" ] && error "manual configuration required: you have to set elrond_magic_number=$elrond_magic_number in example.conf to start example chart." && return 1
  
  # check for required commands
  require_cmd curl || return 1
  require_cmd jq || return 1
  
  # check that we can collect data
  elrond_get || return 1

  return 0
}

# _create is called once, to create the charts
elrond_create() {
  # create the chart

  elrond_get || return 1

  cat << EOF
CHART elrond.sync-node0 '' "$elrond_node_type_node0/$elrond_peer_type_node0 E:$elrond_epoch_number_node0 S:$elrond_shard_id_node0 P/V/N:$elrond_connected_peers_node0/$elrond_connected_validators_node0/$elrond_connected_nodes_node0 R:$elrond_tempRating_node0 $elrond_app_version_node0" "Round" "Consensus round" round line $((elrond_priority)) $elrond_update_every
DIMENSION current 'Current' absolute 1 1
DIMENSION synced 'Synced' absolute 1 1
CHART elrond.sync-node1 '' "$elrond_node_type_node1/$elrond_peer_type_node1 E:$elrond_epoch_number_node1 S:$elrond_shard_id_node1 P/V/N:$elrond_connected_peers_node1/$elrond_connected_validators_node1/$elrond_connected_nodes_node1 R:$elrond_tempRating_node1 $elrond_app_version_node1" "Round" "Consensus round" round line $((elrond_priority + 1)) $elrond_update_every
DIMENSION current 'Current' absolute 1 1
DIMENSION synced 'Synced' absolute 1 1
CHART elrond.sync-node2 '' "$elrond_node_type_node2/$elrond_peer_type_node2 E:$elrond_epoch_number_node2 S:$elrond_shard_id_node2 P/V/N:$elrond_connected_peers_node2/$elrond_connected_validators_node2/$elrond_connected_nodes_node2 R:$elrond_tempRating_node2 $elrond_app_version_node2" "Round" "Consensus round" round line $((elrond_priority + 2)) $elrond_update_every
DIMENSION current 'Current' absolute 1 1
DIMENSION synced 'Synced' absolute 1 1
CHART elrond.validatorblocks-node0 '' "Validator blocks signed/accepted" "Blocks" "Validator blocks" blocks area $((elrond_priority + 3)) $elrond_update_every
DIMENSION signedblocks 'Signed' absolute 1 1
DIMENSION signedaccepted 'Accepted' absolute 1 1
CHART elrond.validatorblocks-node1 '' "Validator blocks signed/accepted" "Blocks" "Validator blocks" blocks area $((elrond_priority + 4)) $elrond_update_every
DIMENSION signedblocks 'Signed' absolute 1 1
DIMENSION signedaccepted 'Accepted' absolute 1 1
CHART elrond.validatorblocks-node2 '' "Validator blocks signed/accepted" "Blocks" "Validator blocks" blocks area $((elrond_priority + 5)) $elrond_update_every
DIMENSION signedblocks 'Signed' absolute 1 1
DIMENSION signedaccepted 'Accepted' absolute 1 1
CHART elrond.leaderblocks-node0 '' "Leader blocks proposed/accepted" "Blocks" "Leader blocks" blocks area $((elrond_priority + 6)) $elrond_update_every
DIMENSION leaderproposed 'Proposed' absolute 1 1
DIMENSION leaderaccepted 'Accepted' absolute 1 1
CHART elrond.leaderblocks-node1 '' "Leader blocks proposed/accepted" "Blocks" "Leader blocks" blocks area $((elrond_priority + 7)) $elrond_update_every
DIMENSION leaderproposed 'Proposed' absolute 1 1
DIMENSION leaderaccepted 'Accepted' absolute 1 1
CHART elrond.leaderblocks-node2 '' "Leader blocks proposed/accepted" "Blocks" "Leader blocks" blocks area $((elrond_priority + 8)) $elrond_update_every
DIMENSION leaderproposed 'Proposed' absolute 1 1
DIMENSION leaderaccepted 'Accepted' absolute 1 1
CHART elrond.rating-node0 '' "Current rating" "Rating" "Current rating" rating stacked $((elrond_priority + 9)) $elrond_update_every
DIMENSION rating 'Rating' absolute 1 1
CHART elrond.rating-node1 '' "Current rating" "Rating" "Current rating" rating stacked $((elrond_priority + 10)) $elrond_update_every
DIMENSION rating 'Rating' absolute 1 1
CHART elrond.rating-node2 '' "Current rating" "Rating" "Current rating" rating stacked $((elrond_priority + 11)) $elrond_update_every
DIMENSION rating 'Rating' absolute 1 1
CHART elrond.epoch-node0 '' "Current epch" "Epoch" "Current epoch" epoch stacked $((elrond_priority + 12)) $elrond_update_every
DIMENSION epoch 'Epoch' absolute 1 1
CHART elrond.epoch-node1 '' "Current epch" "Epoch" "Current epoch" epoch stacked $((elrond_priority + 13)) $elrond_update_every
DIMENSION epoch 'Epoch' absolute 1 1
CHART elrond.epoch-node2 '' "Current epch" "Epoch" "Current epoch" epoch stacked $((elrond_priority + 14)) $elrond_update_every
DIMENSION epoch 'Epoch' absolute 1 1
CHART elrond.peers-node0 '' "Connected peers" "Connected peers" Peers peers stacked $((elrond_priority + 15)) $elrond_update_every
DIMENSION peers 'Peers' absolute 1 1
CHART elrond.peers-node1 '' "Connected peers" "Connected peers" Peers peers stacked $((elrond_priority + 16)) $elrond_update_every
DIMENSION peers 'Peers' absolute 1 1
CHART elrond.peers-node2 '' "Connected peers" "Connected peers" Peers peers stacked $((elrond_priority + 17)) $elrond_update_every
DIMENSION peers 'Peers' absolute 1 1
CHART elrond.validators_nodes-node0 '' "Connected validators/nodes" "Validators/Nodes" "Validators/Nodes" pvn area $((elrond_priority + 18)) $elrond_update_every
DIMENSION validators 'Validators' absolute 1 1
DIMENSION nodes 'Nodes' absolute 1 1
CHART elrond.validators_nodes-node1 '' "Connected validators/nodes" "Validators/Nodes" "Validators/Nodes" pvn area $((elrond_priority + 19)) $elrond_update_every
DIMENSION validators 'Validators' absolute 1 1
DIMENSION nodes 'Nodes' absolute 1 1
CHART elrond.validators_nodes-node2 '' "Connected validators/nodes" "Validators/Nodes" "Validators/Nodes" pvn area $((elrond_priority + 20)) $elrond_update_every
DIMENSION validators 'Validators' absolute 1 1
DIMENSION nodes 'Nodes' absolute 1 1
CHART elrond.num_leader-node0 '' "Num leader success/failure" "Leader success/failure" "Leader success/failure" lsf area $((elrond_priority + 21)) $elrond_update_every
DIMENSION leader_success 'Success' absolute 1 1
DIMENSION leader_failure 'Failure' absolute 1 1
CHART elrond.num_leader-node1 '' "Num leader success/failure" "Leader success/failure" "Leader success/failure" lsf area $((elrond_priority + 22)) $elrond_update_every
DIMENSION leader_success 'Success' absolute 1 1
DIMENSION leader_failure 'Failure' absolute 1 1
CHART elrond.num_leader-node2 '' "Num leader success/failure" "Leader success/failure" "Leader success/failure" lsf area $((elrond_priority + 23)) $elrond_update_every
DIMENSION leader_success 'Success' absolute 1 1
DIMENSION leader_failure 'Failure' absolute 1 1
CHART elrond.num_validator-node0 '' "Num validator success/failure" "Validator success/failure" "Validator success/failure" vsf area $((elrond_priority + 24)) $elrond_update_every
DIMENSION validator_success 'Success' absolute 1 1
DIMENSION validator_failure 'Failure' absolute 1 1
CHART elrond.num_validator-node1 '' "Num validator success/failure" "Validator success/failure" "Validator success/failure" vsf area $((elrond_priority + 25)) $elrond_update_every
DIMENSION validator_success 'Success' absolute 1 1
DIMENSION validator_failure 'Failure' absolute 1 1
CHART elrond.num_validator-node2 '' "Num validator success/failure" "Validator success/failure" "Validator success/failure" vsf area $((elrond_priority + 26)) $elrond_update_every
DIMENSION validator_success 'Success' absolute 1 1
DIMENSION validator_failure 'Failure' absolute 1 1
CHART elrond.ignored_signatures-node0 '' "Ignored signatures" "Signatures" "Ignored signatures" ignored_signatures stacked $((elrond_priority + 27)) $elrond_update_every
DIMENSION validator_ignored_signatures 'Ignored' absolute 1 1
CHART elrond.ignored_signatures-node1 '' "Ignored signatures" "Signatures" "Ignored signatures" ignored_signatures stacked $((elrond_priority + 28)) $elrond_update_every
DIMENSION validator_ignored_signatures 'Ignored' absolute 1 1
CHART elrond.ignored_signatures-node2 '' "Ignored signatures" "Signatures" "Ignored signatures" ignored_signatures stacked $((elrond_priority + 29)) $elrond_update_every
DIMENSION validator_ignored_signatures 'Ignored' absolute 1 1
CHART elrond.total_num_leader-node0 '' "Total num leader success/failure" "Leader success/failure" "Total leader success/failure" tlsf area $((elrond_priority + 30)) $elrond_update_every
DIMENSION total_leader_success 'Success' absolute 1 1
DIMENSION total_leader_failure 'Failure' absolute 1 1
CHART elrond.total_num_leader-node1 '' "Total num leader success/failure" "Leader success/failure" "Total leader success/failure" tlsf area $((elrond_priority + 31)) $elrond_update_every
DIMENSION total_leader_success 'Success' absolute 1 1
DIMENSION total_leader_failure 'Failure' absolute 1 1
CHART elrond.total_num_leader-node2 '' "Total num leader success/failure" "Leader success/failure" "Total leader success/failure" tlsf area $((elrond_priority + 32)) $elrond_update_every
DIMENSION total_leader_success 'Success' absolute 1 1
DIMENSION total_leader_failure 'Failure' absolute 1 1
CHART elrond.total_num_validator-node0 '' "Total num validator success/failure" "Validator success/failure" "Total vldt. success/failure" tvsf area $((elrond_priority + 33)) $elrond_update_every
DIMENSION total_validator_success 'Success' absolute 1 1
DIMENSION total_validator_failure 'Failure' absolute 1 1
CHART elrond.total_num_validator-node1 '' "Total num validator success/failure" "Validator success/failure" "Total vldt. success/failure" tvsf area $((elrond_priority + 34)) $elrond_update_every
DIMENSION total_validator_success 'Success' absolute 1 1
DIMENSION total_validator_failure 'Failure' absolute 1 1
CHART elrond.total_num_validator-node2 '' "Total num validator success/failure" "Validator success/failure" "Total vldt. success/failure" tvsf area $((elrond_priority + 35)) $elrond_update_every
DIMENSION total_validator_success 'Success' absolute 1 1
DIMENSION total_validator_failure 'Failure' absolute 1 1
CHART elrond.total_ignored_signatures-node0 '' "Total ignored signatures" "Signatures" "Total ignored signatures" "Total ignored signatures" stacked $((elrond_priority + 36)) $elrond_update_every
DIMENSION total_validator_ignored_signatures 'Ignored' absolute 1 1
CHART elrond.total_ignored_signatures-node1 '' "Total ignored signatures" "Signatures" "Total ignored signatures" "Total ignored signatures" stacked $((elrond_priority + 37)) $elrond_update_every
DIMENSION total_validator_ignored_signatures 'Ignored' absolute 1 1
CHART elrond.total_ignored_signatures-node2 '' "Total ignored signatures" "Signatures" "Total ignored signatures" "Total ignored signatures" stacked $((elrond_priority + 38)) $elrond_update_every
DIMENSION total_validator_ignored_signatures 'Ignored' absolute 1 1
EOF

  return 0
}

# _update is called continuously, to collect the values
elrond_update() {
  # the first argument to this function is the microseconds since last update
  # pass this parameter to the BEGIN statement (see bellow).

  elrond_get || return 1

  # write the result of the work.
  cat << VALUESEOF
BEGIN elrond.sync-node0 $1
SET current = $elrond_current_round_node0
SET synced = $elrond_synced_round_node0
END
BEGIN elrond.sync-node1 $1
SET current = $elrond_current_round_node1
SET synced = $elrond_synced_round_node1
END
BEGIN elrond.sync-node2 $1
SET current = $elrond_current_round_node2
SET synced = $elrond_synced_round_node2
END
BEGIN elrond.validatorblocks-node0 $1
SET signedblocks = $elrond_count_consensus_node0
SET signedaccepted = $elrond_count_consensus_accepted_blocks_node0
END
BEGIN elrond.validatorblocks-node1 $1
SET signedblocks = $elrond_count_consensus_node1
SET signedaccepted = $elrond_count_consensus_accepted_blocks_node1
END
BEGIN elrond.validatorblocks-node2 $1
SET signedblocks = $elrond_count_consensus_node2
SET signedaccepted = $elrond_count_consensus_accepted_blocks_node2
END
BEGIN elrond.leaderblocks-node0 $1
SET leaderproposed = $elrond_count_leader_node0
SET leaderaccepted = $elrond_count_accepted_blocks_node0
END
BEGIN elrond.leaderblocks-node1 $1
SET leaderproposed = $elrond_count_leader_node1
SET leaderaccepted = $elrond_count_accepted_blocks_node1
END
BEGIN elrond.leaderblocks-node2 $1
SET leaderproposed = $elrond_count_leader_node2
SET leaderaccepted = $elrond_count_accepted_blocks_node2
END
BEGIN elrond.rating-node0 $1
SET rating = $elrond_tempRating_node0
END
BEGIN elrond.rating-node1 $1
SET rating = $elrond_tempRating_node1
END
BEGIN elrond.rating-node2 $1
SET rating = $elrond_tempRating_node2
END
BEGIN elrond.epoch-node0 $1
SET epoch = $elrond_epoch_number_node0
END
BEGIN elrond.epoch-node1 $1
SET epoch = $elrond_epoch_number_node1
END
BEGIN elrond.epoch-node2 $1
SET epoch = $elrond_epoch_number_node2
END
BEGIN elrond.peers-node0 $1
SET peers = $elrond_connected_peers_node0
END
BEGIN elrond.peers-node1 $1
SET peers = $elrond_connected_peers_node1
END
BEGIN elrond.peers-node2 $1
SET peers = $elrond_connected_peers_node2
END
BEGIN elrond.validators_nodes-node0 $1
SET validators = $elrond_connected_validators_node0
SET nodes = $elrond_connected_nodes_node0
END
BEGIN elrond.validators_nodes-node1 $1
SET validators = $elrond_connected_validators_node1
SET nodes = $elrond_connected_nodes_node1
END
BEGIN elrond.validators_nodes-node2 $1
SET validators = $elrond_connected_validators_node2
SET nodes = $elrond_connected_nodes_node2
END
BEGIN elrond.num_leader-node0 $1
SET leader_success = $elrond_num_leader_success_node0
SET leader_failure = $elrond_num_leader_failure_node0
END
BEGIN elrond.num_leader-node1 $1
SET leader_success = $elrond_num_leader_success_node1
SET leader_failure = $elrond_num_leader_failure_node1
END
BEGIN elrond.num_leader-node2 $1
SET leader_success = $elrond_num_leader_success_node2
SET leader_failure = $elrond_num_leader_failure_node2
END
BEGIN elrond.num_validator-node0 $1
SET validator_success = $elrond_num_validator_success_node0
SET validator_failure = $elrond_num_validator_failure_node0
END
BEGIN elrond.num_validator-node1 $1
SET validator_success = $elrond_num_validator_success_node1
SET validator_failure = $elrond_num_validator_failure_node1
END
BEGIN elrond.num_validator-node2 $1
SET validator_success = $elrond_num_validator_success_node2
SET validator_failure = $elrond_num_validator_failure_node2
END
BEGIN elrond.ignored_signatures-node0 $1
SET validator_ignored_signatures = $elrond_num_validator_ignored_signatures_node0
END
BEGIN elrond.ignored_signatures-node1 $1
SET validator_ignored_signatures = $elrond_num_validator_ignored_signatures_node1
END
BEGIN elrond.ignored_signatures-node2 $1
SET validator_ignored_signatures = $elrond_num_validator_ignored_signatures_node2
END
BEGIN elrond.total_num_leader-node0 $1
SET total_leader_success = $elrond_total_num_leader_success_node0
SET total_leader_failure = $elrond_total_num_leader_failure_node0
END
BEGIN elrond.total_num_leader-node1 $1
SET total_leader_success = $elrond_total_num_leader_success_node1
SET total_leader_failure = $elrond_total_num_leader_failure_node1
END
BEGIN elrond.total_num_leader-node2 $1
SET total_leader_success = $elrond_total_num_leader_success_node2
SET total_leader_failure = $elrond_total_num_leader_failure_node2
END
BEGIN elrond.total_num_validator-node0 $1
SET total_validator_success = $elrond_total_num_validator_success_node0
SET total_validator_failure = $elrond_total_num_validator_failure_node0
END
BEGIN elrond.total_num_validator-node1 $1
SET total_validator_success = $elrond_total_num_validator_success_node1
SET total_validator_failure = $elrond_total_num_validator_failure_node1
END
BEGIN elrond.total_num_validator-node2 $1
SET total_validator_success = $elrond_total_num_validator_success_node2
SET total_validator_failure = $elrond_total_num_validator_failure_node2
END
BEGIN elrond.total_ignored_signatures-node0 $1
SET total_validator_ignored_signatures = $elrond_total_num_validator_ignored_signatures_node0
END
BEGIN elrond.total_ignored_signatures-node1 $1
SET total_validator_ignored_signatures = $elrond_total_num_validator_ignored_signatures_node1
END
BEGIN elrond.total_ignored_signatures-node2 $1
SET total_validator_ignored_signatures = $elrond_total_num_validator_ignored_signatures_node2
END
VALUESEOF

  return 0
}
