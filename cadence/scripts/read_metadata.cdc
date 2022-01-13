import FanfareNFTContract from 0xe3d6aefbdc74f65f

pub fun main(account: Address, id: UInt64): &FanfareNFTContract.NFT {
    // Get the public collection of the owner of the token
    var receiver: Capability<&{FanfareNFTContract.FanfareNFTCollectionPublic}> = getAccount(account).getCapability<&{FanfareNFTContract.FanfareNFTCollectionPublic}>(FanfareNFTContract.CollectionPublicPath)
    var r2 = receiver.borrow()!
    // Borrow a reference to a specific NFT in the collection
    let nft = r2.borrowNFTMetadata(id: id)

    log("SUCCESS")

    return nft!

}
