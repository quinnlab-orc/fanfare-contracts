import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

pub fun main(account: Address): [&FanfareNFTContract.NFT?] {
    // Get the public collection of the owner of the token

    var receiver: Capability<&{FanfareNFTContract.FanfareNFTCollectionPublic}> = getAccount(account).getCapability<&{FanfareNFTContract.FanfareNFTCollectionPublic}>(FanfareNFTContract.CollectionPublicPath)
    var r2 = receiver.borrow()!

    // Borrow a reference to a specific NFT in the collection
    let nfts = r2.getIDs()
    let finalnfts: [&FanfareNFTContract.NFT?] = []
    var i: Int = 0;
    while i < nfts.length {
        let nft = r2.borrowNFTMetadata(id: nfts[i])
        finalnfts.append(nft)
        i = i + 1
    }
    log("SUCCESS")

    return finalnfts
}