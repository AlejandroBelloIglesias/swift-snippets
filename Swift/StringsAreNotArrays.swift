//https://www.hackingwithswift.com/read/24/2/strings-are-not-arrays

extension String {
  subscript(i: Int) -> String {
    return String(self[index(startIndex, offsetBy: i)])
  }
}

//Usage
someString[index]

//instead of 
someString[someString[index(someString.startIndex, offsetBy: index)]]
