	//
//  AppDelegate.swift
//  mb_cnt
//
//  Created by mj on 11/13/17.
//  Copyright © 2017 mj. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    
    @IBOutlet weak var menuMain: NSMenu!
    
    @IBOutlet weak var theLabel: NSTextField!
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var theButton: NSButton!
    
    var buttonPresses = 0;
    var colorToggle = 0;
    
    var statusBar = NSStatusBar.systemStatusBar()
    var statusBarItem : NSStatusItem = NSStatusItem()
    var menu: NSMenu = NSMenu()
    var menuItem : NSMenuItem = NSMenuItem()
    var menuItem2 : NSMenuItem = NSMenuItem()
    var menuItem3 : NSMenuItem = NSMenuItem()
    
    override func awakeFromNib() {
        theLabel.stringValue = "You've pressed the button \n \(buttonPresses) times!"
        
        //Add statusBarItem
        statusBarItem = statusBar.statusItemWithLength(-1)
        statusBarItem.menu = menu
        statusBarItem.title = "Test"
        
        //Add menuItem to menu
        menuItem.title = "GetWindow"
        menuItem.action = Selector("setWindowVisible:")
        menuItem.keyEquivalent = ""
        menu.addItem(menuItem)
        
        menuItem2.title = "Reset"
        menuItem2.action = Selector("resetButtonPresses:")
        menu.addItem(menuItem2)
       
        menuItem3.title = "Quit"
//        menuItem3.action = Selector("applicationWillTerminate:")
        menuItem3.action = Selector("terminate:")
        menu.addItem(menuItem3)
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
//        window.backgroundColor = NSColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1)
        self.window!.orderOut(self)
           }
    
    @IBAction func buttonPressed(sender: NSButton) {
        
        theLabel.textColor = NSColor(red: 1, green: 1, blue: 0, alpha: 1);
        if colorToggle == 0 {
            colorToggle = 1;
            window.backgroundColor = NSColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1);
            theLabel.backgroundColor = NSColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1);
        } else if colorToggle == 1 {
            colorToggle = 0;
            window.backgroundColor = NSColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1);
            theLabel.backgroundColor = NSColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1)
        }
        
        buttonPresses+=1
        theLabel.stringValue = "You've pressed the button \n \(buttonPresses) times!"
//        theLabel.stringValue = "colorToggle =   \(colorToggle)"
        menuItem.title = "Clicked \(buttonPresses)"
        statusBarItem.title = "Test \(buttonPresses)"
    }
    
    func setWindowVisible(sender: AnyObject){
        self.window!.orderFront(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
//         menu.removeAllItems(menu)
//        statusBarItem
       
    }
    
    func resetButtonPresses(sender: AnyObject){
        buttonPresses = 0;
        window.backgroundColor = NSColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1);
        theLabel.backgroundColor = NSColor(red: 1, green: 0, blue: 0, alpha: 1);
        theLabel.textColor = NSColor(red: 0, green: 0, blue: 0, alpha: 1);
        theLabel.stringValue = "You've pressed the button \n \(buttonPresses) times!"
        menuItem.title = "Clicked \(buttonPresses)"
        statusBarItem.title = "Test \(buttonPresses)"
        menuItem.title = "GetWindow"
    }


}

