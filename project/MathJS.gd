extends Node

# Example usage
func _ready():
    if OS.has_feature('web'):
        JavaScriptBridge.eval("""
            console.log('The JavaScriptBridge singleton is available')
        """)
    else:
        print("The JavaScriptBridge singleton is NOT available")
        return
    
    var mathJS = JavaScriptBridge.get_interface("math")
    print(mathJS.add(1, 2))
    print(mathJS.derivative('x^2', 'x').toString())
    
    var renderLatex = func(katexExpression: String) -> void:
        JavaScriptBridge.eval("renderLatex('" + katexExpression.replace("\\", "\\\\") + "')")

    renderLatex.call("\\sqrt{a^2 + b^2}")