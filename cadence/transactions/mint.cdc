import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import FanfareNFTContract from "../contracts/FanfareNFTContract.cdc"

transaction(mediaURI: String, creatorAddress: Address, recipient: Address, data: String) {
    prepare(signer: AuthAccount) {
        let admin = signer.borrow<&FanfareNFTContract.ContentCreator>(from: FanfareNFTContract.ContentCreatorStoragePath)
            ?? panic("cannot get a valid creatorproxy resource for the signer")

        admin.mintNFT(mediaURI: mediaURI, creatorAddress: creatorAddress, recipient: recipient, data: data)

        log("Minted to recipients collection")
    }
}