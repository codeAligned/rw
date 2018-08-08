# Matt Motto
# GUI Example

from PyQt4 import QtGui
import sys

app = QtGui.QApplication(sys.argv)

def addNums():
    
    global Num1
    global Num2
    global result
    
    x = float(Num1.text())
    y = float(Num2.text())
    res = x + y
    result.setText(str(res))

def subNums():
    
    global Num1
    global Num2
    global result
    
    x = float(Num1.text())
    y = float(Num2.text())
    res = x - y
    result.setText(str(res))

def multNums():
    
    global Num1
    global Num2
    global result
    
    x = float(Num1.text())
    y = float(Num2.text())
    res = x * y
    result.setText(str(res))

def divNums():

    global Num1
    global Num2
    global result
    
    x = float(Num1.text())
    y = float(Num2.text())
    res = x / y
    result.setText(str(res))
  

top = QtGui.QWidget()

grid = QtGui.QGridLayout(top)

addButton = QtGui.QPushButton(top)
addButton.setText("Add")
addButton.clicked.connect(addNums)
grid.addWidget(addButton)

subButton = QtGui.QPushButton(top)
subButton.setText("Subtract")
subButton.clicked.connect(subNums)
grid.addWidget(subButton)

multButton = QtGui.QPushButton(top)
multButton.setText("Multiply")
multButton.clicked.connect(multNums)
grid.addWidget(multButton)

divButton = QtGui.QPushButton(top)
divButton.setText("Divide")
divButton.clicked.connect(divNums)
grid.addWidget(divButton)

Num1 = QtGui.QLineEdit(top)
grid.addWidget(Num1)

Num2 = QtGui.QLineEdit(top)
grid.addWidget(Num2)

label = QtGui.QLabel(top)
label.setText("Result:")
grid.addWidget(label)

result = QtGui.QLineEdit(top)
result.setReadOnly(True)
grid.addWidget(result)

addButton.show()
subButton.show()
multButton.show()
divButton.show()
Num1.show()
Num2.show()
label.show()
result.show()
top.show()

sys.exit(app.exec_())
