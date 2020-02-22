import tkinter

window=tkinter.Tk()

window.title("You in here")
window.geometry("640x400+100+100")
window.resizable(False, False)

label=tkinter.Label(window, text="Hello!!")
label.pack()

window.mainloop()