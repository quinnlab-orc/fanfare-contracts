import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

pub fun main(account: Address): [UInt64] {
    // Get the public collection of the owner of the token

    var receiver: Capability<&{FanfareNFTContract.FanfareNFTCollectionPublic}> = getAccount(account).getCapability<&{FanfareNFTContract.FanfareNFTCollectionPublic}>(FanfareNFTContract.CollectionPublicPath)
    var r2 = receiver.borrow()!

    // Borrow a reference to a specific NFT in the collection
    let nfts = r2.getIDs()

    log("SUCCESS")

    return nfts
}
