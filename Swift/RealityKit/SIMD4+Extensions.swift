import Foundation
import RealityKit

extension SIMD4 {

    var xyz: SIMD3<Scalar> {
        self[SIMD3(0, 1, 2)]
    }

    func position() -> SIMD3<Float> {
        let col3 = columns.3
        return [col3.x, col3.y, col3.z]
    }

    /// Calculates a position in front of user head
    ///
    /// - Parameters:
    ///     - distance: distance between user and desired position in meters
    ///     - height: height above (positive) or below (negative) head position
    ///
    /// - Returns: desired position or nil if head position couldn't be tracked
    public func positionInFrontOfUser(distance: Float, height: Float) -> SIMD3<Float>? {
        let finalPosition: SIMD3<Float> = [
            -columns.2.x,
            height,
            -columns.2.z,
        ] * distance
        return position() + finalPosition
    }
}