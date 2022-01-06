import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

transaction(mediaURI: String, creatorAddress: Address, recipient: Address, metadata: String) {
    prepare(signer: AuthAccount) {
        let admin = signer.borrow<&FanfareNFTContract.ContentCreator>(from: FanfareNFTContract.ContentCreatorStoragePath)
            ?? panic("cannot get a valid creatorproxy resource for the signer")

        admin.mintNFT( creatorAddress: creatorAddress, recipient: recipient, metadata: metadata)

        log("Minted to recipients collection")
    }
}