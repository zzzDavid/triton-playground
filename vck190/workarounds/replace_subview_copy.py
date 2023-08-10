import re

def substitute_line(line):
    # Regular expression to match the pattern
    pattern = r"memref\.copy (%subview_\d+), (%subview_\d+) : (memref<.*?>) to (memref<.*?>)"
    
    # Replacement format
    replacement = r"linalg.copy ins(\1 : \3) outs(\2 : \4)"
    
    return re.sub(pattern, replacement, line)

def main():
    input_filename = "input.mlir"
    output_filename = "output.mlir"

    with open(input_filename, "r") as f:
        content = f.readlines()

    # Apply substitution to each line
    new_content = [substitute_line(line) for line in content]

    # Write the modified content to a new file
    with open(output_filename, "w") as f:
        f.writelines(new_content)

if __name__ == "__main__":
    main()
