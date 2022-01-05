import NonFungibleToken from 0x1d7e57aa55817448
import FanfareNFTContract from 0xe3d6aefbdc74f65f

pub fun main(account: Address): [UInt64] {
    // Get the public collection of the owner of the token
    let collectionRef = getAccount(account)
        .getCapability(/public/FanfareNFTCollection)
        .borrow<&{NonFungibleToken.CollectionPublic}>()
        ?? panic("Could not borrow capability from public collection")

    // Borrow a reference to a specific NFT in the collection
    let nfts = collectionRef.getIDs()

    log("SUCCESS")

    return nfts
}