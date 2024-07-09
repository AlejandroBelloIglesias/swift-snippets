func downloadFile(from remoteURL: URL) async throws -> URL {
      
      //Create local URL in a temp directory
      let localURL: URL!
      
      if remoteURL.pathExtension.isEmpty {
          let localURL = FileManager.default.temporaryDirectory
              .appendingPathComponent(UUID().uuidString)
              .appendingPathExtension(remoteURL.pathExtension)
      } else {
          let localURL = FileManager.default.temporaryDirectory
              .appendingPathComponent(UUID().uuidString)
      }
      
      do {
          // Download the file
          let (tempFileURL, _) = try await URLSession.shared.download(from: remoteURL)
          
          do {
              // Move the downloaded file to the desired location
              try FileManager.default.moveItem(at: tempFileURL, to: localURL)
          } catch {
              throw FileDownloadError.fileMoveError(error)
          }
          
          return localURL
      } catch {
          throw FileDownloadError.networkError(error)
      }
  }

enum FileDownloadError: Error {
      case networkError(Error)
      case fileMoveError(Error)
  }
