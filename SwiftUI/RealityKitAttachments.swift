
RealityView { content, attachments in

    //...

    let test = attachments.entity(for: "test")! //Forced! must exist
    content.add(test)
    //Posicionamiento
    //Delante: -z
    //Arriba: +y
    //Derecha: +x

} attachments: {
    //1. Attachment
    Attachment(id: "test") {
        //2. SwiftUI View
        Button("test") {
            //...
        }
    }
}