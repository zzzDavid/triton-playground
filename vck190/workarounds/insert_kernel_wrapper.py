import re

def insert_before_last_brace(text, code_to_insert):
    # Replace the last "}" with `code_to_insert` + "}"
    # The regex looks for any character (.) zero or more times (*) 
    # followed by "}", but because it's greedy, it'll match the last "}".
    return re.sub(r'^(.*)\}', r'\1' + code_to_insert + '\n}', text, flags=re.DOTALL)

text = """
{
    int x = 10;
    int y = 20;
}
"""

new_text = insert_before_last_brace(text, "    int z = 30;")
print(new_text)
