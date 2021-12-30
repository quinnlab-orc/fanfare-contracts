import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

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