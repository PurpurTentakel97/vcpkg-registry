# Update a Package
## Package Repo
- update version in vcpkg.json
- update dependecies in 'cmake/{pkg}-config.cmake'
- bring it to main branch
    - ether PR or Merge or whatever
    - it seams to be more logic to use main branch hashes insteed of feature branch hashes
- release with same version tag.
## vcpkg-registry
- update baseline in 'versions/baseline.json'
    - enter pkg-version here
- add new version in 'versions/{p}-/{pkg}.json'
    - set 'version' to pkg-version
    - set 'port-version' to 0
    - just add some 'git-tree' for now
- update version in 'ports/{pkg}/vcpkg.json'
    - set 'port-version' to pkg-version
- try install it with vcpkg
    - 'vcpkg install {pkg} --overlay-ports=ports/{pkg}'
    - it will fail
- copy hash into 'ports/{pkg}/portfile.cmake'
    - set it at 'SHA512'
- try install again with vcpkg
    - just to make sure
    - it should work right now
- commit changes
- parse commit hash
    - 'git rev-parse HEAD:ports/{pkg}'
- copy hash into 'versions/{p}-/{pkg}.json'
    - set new 'git-tree'
- commit amend so that the hash stays
- bring it to main branch
    - ether PR or Merge or whatever
    - it seams to be more logic to use main branch hashes insteed of feature branch hashes
## use of new version
- update 'vcpkg-registry-baseline' in 'vcpkg.json'
    - use newest main branch hash of 'vcpkg-registy'