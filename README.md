# MartianDemoApp
Test interview
## Requirements
- iOS 12/ Swift 5
- Xcode 11


## - Mreza:  3 poziva API demo.martian.agency
All use  this MBID identifier for loading and fetching the data
Sometimes API returns some metadata that is not with identifier I show them currently in the app
but the identifier is missing so there is no Albums in detail screen

1. search.topArtist (SearchViewController)
2. artist.getTopAlbums (AlbumsVC)
3. album.getInfo (DetailVC)

## - Persistent data: Realm
Saving AlbumInfo object and deleting it with identifier MBID

1. fetch.albumsInfo (Main View Controller is visible if user navigate back)
2. delete.albumInfo managed object

## The basic user flow in place:
required cocoapods :
Alamofire
AlamofireImage
SHSearchBar


## Nedostatci:
Kudos i ostalo https://github.com/realm/realm-cocoa/issues/6163
- Connecting APIClient and APIRouter was not finished successfully so I went end finished all through
  APIClient instead ( refactoring )- fixed
- Error handling is not implemented fully
- AlbumsViewController has logic for shoving bookmark indictor from detailVC- this was required to be view controller to delete the call from saving  to core data, I was not sure on that one.  - fixed
