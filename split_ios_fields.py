import os, re

input_file = '/Users/admin/Desktop/Gazgin/gazgin-ios/Packages/Core/Sources/DesignSystem/API/InputField/InputFields.swift'
directory = os.path.dirname(input_file)

with open(input_file, 'r') as f:
    content = f.read()

parts = re.split(r'(?m)^// MARK: - (.+)', content)
imports = ["import SwiftUI\n\n"]

previews = {
    'CodeField': '''
#Preview("CodeField States") {
    @Previewable @State var text = ""
    HStack(spacing: 12) {
        CodeField(value: $text)
        CodeField(value: .constant("1"))
        CodeField(value: .constant("2"), isError: true)
        CodeField(value: .constant("3"), enabled: false)
    }
    .padding()
    .gazginTheme()
}
''',
    'PasswordField': '''
#Preview("PasswordField States") {
    @Previewable @State var text = ""
    VStack(spacing: 16) {
        PasswordField(value: $text, placeholder: "Password")
        PasswordField(value: .constant("secret123"), placeholder: "Visible", passwordVisible: true)
        PasswordField(value: .constant("secret123"), placeholder: "Masked", passwordVisible: false)
        PasswordField(value: .constant("secret123"), placeholder: "Error", isError: true)
    }
    .padding()
    .gazginTheme()
}
''',
    'default': '''
#Preview("{name} States") {{
    @Previewable @State var text = ""
    VStack(spacing: 16) {{
        {name}(value: $text, placeholder: "{name} Default")
        {name}(value: .constant("Filled state"), placeholder: "{name} Filled")
        {name}(value: .constant("Error state"), placeholder: "Error", isError: true)
        {name}(value: .constant("Disabled"), placeholder: "Disabled", enabled: false)
    }}
    .padding()
    .gazginTheme()
}}
'''
}

components = {}
for i in range(1, len(parts), 2):
    header = parts[i].strip()
    body = parts[i+1]
    
    name_match = re.match(r'^([A-Za-z]+(?:Field|Area))', header)
    if not name_match:
        continue
    name = name_match.group(1)
    
    components[name] = (header, body)

for name, (header, body) in components.items():
    file_content = "".join(imports) + f"// MARK: - {header}\n" + body.lstrip()
    if name in previews:
        preview = previews[name]
    else:
        preview = previews['default'].format(name=name)
        
    file_content += preview
    
    out_path = os.path.join(directory, f"{name}.swift")
    with open(out_path, 'w') as f:
        f.write(file_content)

os.remove(input_file)
print("Successfully extracted iOS InputFields!")
