//
//  Album.swift
//  ChromAR
//
//  Created by Tom Hansen on 9/21/19.
//  Copyright © 2019 Rithvik Arun. All rights reserved.
//

import Foundation

class Album {
    var album: [Palette]
    
    init() {
        album = [Palette]()
    }
    
    func addPalette () {
        album.append(Palette())
    }
    
    func removePalette (index: Int) {
        album.remove(at: index);
    }
    
    func getAlbum () -> [PaletteWrapper] {
        var wrappedPalettes = [PaletteWrapper]()
        for (i, palette) in album.enumerated() {
            wrappedPalettes.append(PaletteWrapper(
                palette: palette,
                index: i
            ))
        }
        return wrappedPalettes
    }
}
