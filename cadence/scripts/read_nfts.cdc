import NonFungibleToken from 0x1d7e57aa55817448
import FanfareNFTContract from 0xe3d6aefbdc74f65f

pub fun main(account: Address): [UInt64] {
    // Get the public collection of the owner of the token

    var receiver: Capability<&{FanfareNFTContract.FanfareNFTCollectionPublic}> = getAccount(account).getCapability<&{FanfareNFTContract.FanfareNFTCollectionPublic}>(FanfareNFTContract.CollectionPublicPath)
    var r2 = receiver.borrow()!

    // Borrow a reference to a specific NFT in the collection
    let nfts = r2.getIDs()

    log("SUCCESS")

    return nfts
}
