def get_full_name(char):
    base_name = "AlchemyElement."
    if char == 'p':
        return base_name + "materiaPrima"
    elif char == 'n':
        return base_name + "materiaNulla"
    elif char == 'r':
        return base_name + "rebis"
    elif char == 'c':
        return base_name + "caeleum"
    elif char == 'q':
        return base_name + "quebrith"

    raise Exception("Character '" + char + "' not recognized!")


def gen_file(file_path, patterns):
    def gen_case(index):
        file.write("      case " + str(index) + ":\n")

        if_cases = {}

        for return_elem, pattern in patterns.items():
            if pattern[index] in if_cases:
                if_cases[pattern[index]].append(return_elem)
            else:
                if_cases[pattern[index]] = [return_elem]

        for if_elem, return_elems in if_cases.items():
            file.write("        if (tile.alchemyElement == " + get_full_name(if_elem) + ") {\n")
            for elem in return_elems:
                file.write("          matchesFoundMap[" + get_full_name(elem) + "] = matchesFoundMap[")
                file.write(get_full_name(elem) + "]! + 1;\n")
            file.write("        }\n")

        file.write("        break;\n")

    file = open(file_path, 'w')
    file.write("//\n")
    file.write("// Generated file. Do not edit.\n")
    file.write("//\n\n")
    file.write("import 'package:materia_optima/core/alchemy_element.dart';\n")
    file.write(
        "import 'package:materia_optima/core/models/board_tile_model.dart';\n\n")

    file.write(
        "AlchemyElement matchPattern(List<BoardTileModel> boardTiles,\n")
    file.write("    [int tileCount = 16]) {\n")
    file.write("  Map<AlchemyElement, int> matchesFoundMap = {};\n")
    file.write("  for (var element in AlchemyElement.values) {\n")
    file.write("    matchesFoundMap[element] = 0;\n")
    file.write("  }\n\n")

    file.write("  for (var tile in boardTiles) {\n")
    file.write("    switch (tile.position.index) {\n")

    for i in range(16):
        gen_case(i)

    file.write("      default:\n")
    file.write("        throw Exception('Unexpected TilePosition index');\n")
    file.write("    }\n")
    file.write("  }\n\n")

    file.write("  for (var match in matchesFoundMap.entries) {\n")
    file.write("    if (match.value == tileCount) {\n")
    file.write("      return match.key;\n")
    file.write("    }\n")
    file.write("  }\n")
    file.write("  return AlchemyElement.materiaNulla;\n")
    file.write("}\n")

    file.close()


def main():
    file_path = '../lib/core/match_pattern.dart'
    patterns = {
        'r': [
            'n', 'p', 'p', 'p',
            'p', 'p', 'p', 'p',
            'p', 'p', 'p', 'p',
            'p', 'p', 'p', 'p',
        ],
        'c': [
            'n', 'r', 'r', 'p',
            'p', 'p', 'p', 'p',
            'p', 'p', 'p', 'p',
            'p', 'r', 'r', 'p',
        ],
        'q': [
            'n', 'r', 'r', 'p',
            'c', 'p', 'p', 'c',
            'c', 'p', 'p', 'c',
            'p', 'r', 'r', 'p',
        ],
    }
    gen_file(file_path, patterns)


if __name__ == "__main__":
    main()
