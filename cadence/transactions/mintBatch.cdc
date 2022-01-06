import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

transaction(creatorAddress: Address, recipient: Address, quantity: UInt64, metadata: String) {
    prepare(signer: AuthAccount) {
        let admin = signer.borrow<&FanfareNFTContract.ContentCreator>(from: FanfareNFTContract.ContentCreatorStoragePath)
            ?? panic("cannot get a valid creatorproxy resource for the signer")

        var i: UInt64 = 0;
            
        while i < quantity {
            admin.mintNFT(creatorAddress: creatorAddress, recipient: recipient, metadata: metadata)
            i = i + 1
        }

        log("Minted to recipients collection")
    }
}