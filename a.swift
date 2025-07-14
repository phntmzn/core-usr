import Foundation
import CoreMIDI

let notes: [String: Int] = [
    "C": 0, "C#": 1, "D": 2, "D#": 3, "E": 4,
    "F": 5, "F#": 6, "G": 7, "G#": 8, "A": 9,
    "A#": 10, "B": 11
]

let chords: [String: [Int]] = [
    "Major 7th": [0, 4, 7, 11],
    "Minor": [0, 3, 7]
]

let inversions: [String: [String: [Int]]] = [
    "Minor": [
        "Inversion 0": [0, 3, 7],
        "Inversion 1": [3, 7, 12],
        "Inversion 2": [7, 12, 15]
    ]
]

let timeValueDurations: [String: Double] = [
    "sixteenth_note": 0.25
]

let BARS = 32
let BEATS_PER_BAR = 4
let TOTAL_BEATS = BARS * BEATS_PER_BAR
let TEMPO = 156.0

let HIHAT_NOTE = 60
let SNARE_NOTE = 60
let KICK_NOTE = 60
let CHORD_CHANNEL: UInt8 = 1

let desktopPath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop")

func getOutputFolder() -> URL {
    print("Enter a name for the output folder (or press Enter to use a timestamp): ", terminator: "")
    if let input = readLine(), !input.isEmpty {
        return desktopPath.appendingPathComponent(input)
    } else {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd_HH-mm-ss"
        let timestamp = formatter.string(from: Date())
        return desktopPath.appendingPathComponent("music_\(timestamp)")
    }
}

// Placeholder – replace with actual MIDI export using your framework
func writeMIDIFile(_ filename: URL, notes: [(note: Int, time: Double, velocity: Int)], channel: UInt8 = 1) {
    print("Would write \(filename.lastPathComponent) with \(notes.count) notes")
}

// Pattern generators

func generateDrumPatterns(baseFolder: URL) {
    var hihat: [(Int, Double, Int)] = []
    var snare: [(Int, Double, Int)] = []
    var kick: [(Int, Double, Int)] = []

    for t in 0..<(TOTAL_BEATS * 2) {
        hihat.append((HIHAT_NOTE, Double(t) * 0.5, 100))
    }

    for t in 0..<BARS {
        snare.append((SNARE_NOTE, Double(t * BEATS_PER_BAR + 2), 100))
    }

    for t in stride(from: 0, to: BARS, by: 2) {
        kick.append((KICK_NOTE, Double(t * BEATS_PER_BAR), 100))
        kick.append((KICK_NOTE, Double(t * BEATS_PER_BAR + 3), 100))
    }

    writeMIDIFile(baseFolder.appendingPathComponent("hihat.mid"), notes: hihat)
    writeMIDIFile(baseFolder.appendingPathComponent("snare.mid"), notes: snare)
    writeMIDIFile(baseFolder.appendingPathComponent("kick.mid"), notes: kick)
}

func generateChordProgression(baseFolder: URL) {
    let roots = ["F#", "D", "A", "C#"]
    let invNames = ["Inversion 0", "Inversion 1", "Inversion 2"]
    var pattern: [(Int, Double, Int)] = []

    for (i, rootName) in roots.enumerated() {
        guard let root = notes[rootName],
              let inversion = inversions["Minor"]?[invNames[i % invNames.count]] else { continue }

        let time = Double(i * 4 * BEATS_PER_BAR)
        for n in inversion {
            pattern.append((root + n + 60, time, 100))
        }
    }

    writeMIDIFile(baseFolder.appendingPathComponent("chords.mid"), notes: pattern, channel: CHORD_CHANNEL)
}

func generateArpeggio(baseFolder: URL) {
    guard let root = notes["C"] else { return }
    let intervals = chords["Major 7th"] ?? []
    let duration = timeValueDurations["sixteenth_note"] ?? 0.25
    var pattern: [(Int, Double, Int)] = []

    var fullNotes: [Int] = []
    for octave in 4...6 {
        for i in intervals {
            fullNotes.append(12 * octave + (root % 12) + i)
        }
    }

    for i in 0..<32 {
        let note = fullNotes[i % fullNotes.count]
        pattern.append((note, Double(i) * duration, 100))
    }

    writeMIDIFile(baseFolder.appendingPathComponent("arpeggio.mid"), notes: pattern, channel: CHORD_CHANNEL)
}

// Optional: stub to match Python script
func generateVelocityLayeredTriad() {
    print("Placeholder: generateVelocityLayeredTriad()")
}

// Entry point
let baseFolder = getOutputFolder()
try? FileManager.default.createDirectory(at: baseFolder, withIntermediateDirectories: true)

generateDrumPatterns(baseFolder: baseFolder)
generateChordProgression(baseFolder: baseFolder)
generateArpeggio(baseFolder: baseFolder)
generateVelocityLayeredTriad()

print("Generated MIDI files saved in: \(baseFolder.path)")
