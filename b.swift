import Foundation

// MARK: - Note Values
let notes: [String: Int] = [
    "C": 60, "C#": 61, "D": 62, "D#": 63, "E": 64,
    "F": 65, "F#": 66, "G": 67, "G#": 68, "A": 69,
    "A#": 70, "B": 71
]

// MARK: - Scales
let scales: [String: [Int]] = [
    "C MAJOR": [60, 62, 64, 65, 67, 69, 71, 72],
    "C# MAJOR": [61, 63, 65, 66, 68, 70, 72, 73],
    "D MAJOR": [62, 64, 66, 67, 69, 71, 73, 74],
    "D# MAJOR": [63, 65, 67, 68, 70, 72, 74, 75],
    "E MAJOR": [64, 66, 68, 69, 71, 73, 75, 76],
    "F MAJOR": [65, 67, 69, 70, 72, 74, 76, 77],
    "F# MAJOR": [66, 68, 70, 71, 73, 75, 77, 78],
    "G MAJOR": [67, 69, 71, 72, 74, 76, 78, 79],
    "G# MAJOR": [68, 70, 72, 73, 75, 77, 79, 80],
    "A MAJOR": [69, 71, 73, 74, 76, 78, 80, 81],
    "A# MAJOR": [70, 72, 74, 75, 77, 79, 81, 82],
    "B MAJOR": [71, 73, 75, 76, 78, 80, 82, 83],

    "C MINOR": [60, 62, 63, 65, 67, 68, 70, 72],
    "C# MINOR": [61, 63, 64, 66, 68, 69, 71, 73],
    "D MINOR": [62, 64, 65, 67, 69, 70, 72, 74],
    "D# MINOR": [63, 65, 66, 68, 70, 71, 73, 75],
    "E MINOR": [64, 66, 67, 69, 71, 72, 74, 76],
    "F MINOR": [65, 67, 68, 69, 71, 72, 74, 75],
    "F# MINOR": [66, 68, 69, 71, 73, 74, 76, 78],
    "G MINOR": [67, 69, 70, 72, 74, 75, 77, 79],
    "G# MINOR": [68, 70, 71, 73, 75, 76, 78, 80],
    "A MINOR": [69, 71, 72, 74, 76, 77, 79, 81],
    "A# MINOR": [70, 72, 73, 75, 77, 78, 80, 82],
    "B MINOR": [71, 73, 74, 76, 78, 79, 81, 83]
]

// MARK: - Time Value Durations
let timeValueDurations: [String: Double] = [
    "whole_note": 4,
    "dotted_whole_note": 6,
    "half_note": 2,
    "dotted_half_note": 3,
    "quarter_note": 1,
    "dotted_quarter_note": 1.5,
    "eighth_note": 0.5,
    "dotted_eighth_note": 0.75,
    "sixteenth_note": 0.25,
    "dotted_sixteenth_note": 0.375,
    "thirty_second_note": 0.125,
    "dotted_thirty_second_note": 0.1875,
    "sixty_fourth_note": 0.0625,
    "dotted_sixty_fourth_note": 0.09375,
    "one_hundred_twenty_eighth_note": 0.03125,
    "dotted_one_hundred_twenty_eighth_note": 0.046875,
    "two_hundred_fifty_sixth_note": 0.015625,
    "dotted_two_hundred_fifty_sixth_note": 0.0234375
]

// MARK: - Chords
let chords: [String: [Int]] = [
    "Major": [0, 4, 7],
    "Minor": [0, 3, 7],
    "Diminished": [0, 3, 6],
    "Augmented": [0, 4, 8],
    "Major 7th": [0, 4, 7, 11],
    "Minor 7th": [0, 3, 7, 10],
    "Dominant 7th": [0, 4, 7, 10],
    "Diminished 7th": [0, 3, 6, 9],
    "Half-Diminished 7th": [0, 3, 6, 10],
    "Augmented 7th": [0, 4, 8, 10],
    "9th": [0, 4, 7, 10, 14],
    "Major 9th": [0, 4, 7, 11, 14],
    "Minor 9th": [0, 3, 7, 10, 14],
    "11th": [0, 4, 7, 10, 14, 17],
    "13th": [0, 4, 7, 10, 14, 21],
    "Suspended 2nd (sus2)": [0, 2, 7],
    "Suspended 4th (sus4)": [0, 5, 7],
    "6th": [0, 4, 7, 9],
    "Minor 6th": [0, 3, 7, 9],
    "Add 9": [0, 4, 7, 14],
    "Minor Add 9": [0, 3, 7, 14],
    "7th Flat 5": [0, 4, 6, 10],
    "7th Sharp 5": [0, 4, 8, 10],
    "Major 7th Sharp 5": [0, 4, 8, 11],
    "Minor 7th Flat 5": [0, 3, 6, 10]
]

// MARK: - Inversions
let inversions: [String: Any] = [
    "Major": [
        "Inversion 0": [0, 4, 7],
        "Inversion 1": [4, 7, 12],
        "Inversion 2": [7, 12, 16]
    ],
    "Minor": [
        "Inversion 0": [0, 3, 7],
        "Inversion 1": [3, 7, 12],
        "Inversion 2": [7, 12, 15]
    ],
    "Diminished": [
        "Inversion 0": [0, 3, 6],
        "Inversion 1": [3, 6, 12],
        "Inversion 2": [6, 12, 15]
    ],
    "Augmented": [
        "Inversion 0": [0, 4, 8],
        "Inversion 1": [4, 8, 12],
        "Inversion 2": [8, 12, 16]
    ],
    "Major 7th": [
        "Inversion 0": [0, 4, 7, 11],
        "Inversion 1": [4, 7, 11, 12],
        "Inversion 2": [7, 11, 12, 16],
        "Inversion 3": [11, 12, 16, 19]
    ],
    "Minor 7th": [
        "Inversion 0": [0, 3, 7, 10],
        "Inversion 1": [3, 7, 10, 12],
        "Inversion 2": [7, 10, 12, 15],
        "Inversion 3": [10, 12, 15, 19]
    ],
    "9 sus": [
        "Inversion 0": [0, 2, 7, 10],
        "Inversion 1": [2, 7, 10, 12],
        "Inversion 2": [7, 10, 12, 14],
        "Inversion 3": [10, 12, 14, 19]
    ],
    "6": [
        "Major 6": [
            "Inversion 0": [0, 4, 7, 9],
            "Inversion 1": [4, 7, 9, 12],
            "Inversion 2": [7, 9, 12, 16],
            "Inversion 3": [9, 12, 16, 19]
        ],
        "Minor 6": [
            "Inversion 0": [0, 3, 7, 9],
            "Inversion 1": [3, 7, 9, 12],
            "Inversion 2": [7, 9, 12, 15],
            "Inversion 3": [9, 12, 15, 19]
        ]
    ],
    "5": [
        "Inversion 0": [0, 7],
        "Inversion 1": [7, 12],
        "Inversion 2": [12, 19]
    ]
]
