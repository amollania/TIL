from tkinter import *

class tkinterFrame(frame):
    def __init__(self, master):
        img = PhotoImage(file='ugit.jpg')
        lbl = Label(image)
        lbl = img
        lbl.place(x=0, u=0)
    
    def main():
        root = Tk()
        root.title('Show image')
        root.geometry('500x400+10+10')
        root.tkinterFrame(root)
        root.main()

    if __name__ == '__main__':
        main()