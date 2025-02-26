
extension Entity {
    func applyToChildren(matching: (Entity) -> Bool, action: (Entity) -> Void) {
        for child in children {
            if matching(child) {
                action(child)
            }
            child.applyToChildren(matching: matching, action: action)
        }
    }

    func getModelEntity() -> ModelEntity? {
        if let modelEntity = self as? ModelEntity {
            return modelEntity
        }
        return children.lazy.compactMap { $0.getModelEntity() }.first
    }

    func recursivelyEnableAnimations() {
        // Enable animations on this entity
        for anim in availableAnimations {
            playAnimation(anim.repeat())
        }
        // Do the same for it's children
        for child in children {
            child.recursivelyEnableAnimations()
        }
    }
}
