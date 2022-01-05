import FanfareNFTContract from 0xe3d6aefbdc74f65f

pub fun main(account: Address, id: UInt64): &FanfareNFTContract.NFT {
    // Get the public collection of the owner of the token
     var receiver = getAccount(account).getCapability<&{FanfareNFTContract.FanfareNFTCollectionPublic}>(FanfareNFTContract.CollectionPublicPath)
            let collectionRef = receiver.borrow()!
   
    // Borrow a reference to a specific NFT in the collection
    let nft = collectionRef.borrowNFTMetadata(id: id)

    log("SUCCESS")

    return nft!

}