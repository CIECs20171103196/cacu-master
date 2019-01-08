//
//  ViewController.swift
//  cacu
//
//  Created by s20171103196 on 2018/10/27.
//  Copyright © 2018 s20171103196. All rights reserved.
//

import UIKit
class Stack <T>{
    var top:Int = -1
    var num = [T]()
    
    public func IsEmpty()->Int
    {
        if top == -1{
            return 1
        }
        else if top > -1{
            return 0;
        }
        return -1
    }
    public func PushStack(x:T)->Int{
        num.append(x)
        top=top+1
        return 1
    }
    public func PopStack()->T?{
        let f=num.removeLast()
        top=top-1
        return f
    }
    public func inspectTop()->T?{
        if(top == -1){
            return nil;
        }
        else{
            return num[top]
        }
    }
    public func GetTop()->Int{
        return top
    }
    public func DelStack() -> Int
    {
        while IsEmpty() != 1
        {
            PopStack()
        }
        return 1
    }
};

class calculate {
    var flag = 0
    var y1 = Stack<Double>()
    var z1 = Stack<String>()
    public func judge(x:String)->Int
    {
        if x == "="
        {
            flag = 0
        }
        if x == "*"
        {
            flag = 4
        }
        if x == "/"
        {
            flag = 4
        }
        if x == "+"
        {
            flag = 2
        }
        if x == "-"
        {
            flag = 2
        }
        return flag
    }
    
    public func compare(x1:String,y1:Stack<Double>,z1:Stack<String>)
    {
        var str:String = "0"
        var p1:Double = 0
        var p2:Double = 0
        while(z1.IsEmpty() != 1&&judge(x: x1) < judge(x:z1.inspectTop()!)+1)
        {
            str = z1.PopStack()!;
            if str == "+"
            {
                p1 = y1.PopStack()!;
                p2 = y1.PopStack()!
                y1.PushStack(x: p1 + p2)
            }
            if str == "-"
            {
                p1 = y1.PopStack()!;
                p2 = y1.PopStack()!
                y1.PushStack(x: p2 - p1)
            }
            if str == "*"
            {
                p1 = y1.PopStack()!;
                p2 = y1.PopStack()!
                y1.PushStack(x: p1 * p2)
            }
            if str == "/"
            {
                p1 = y1.PopStack()!;
                p2 = y1.PopStack()!
                y1.PushStack(x: p2 / p1)
            }
            
        }
        
    }
    
};

class ViewController: UIViewController {
    var stack1 = Stack<Double>()
    var stack2 = Stack<String>()
    var calcu = calculate()
    var temp = 1.0
    var operatorFlag:Int=0
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var result2: UITextField!
   
    @IBAction func b1(_ sender: Any) {
        result.text = result.text!+"1"
        result2.text = result2.text!+"1"
    }
    @IBAction func b2(_ sender: Any) {
        result.text = result.text!+"2"
        result2.text = result2.text!+"2"
    }
    
    @IBAction func b3(_ sender: Any) {
        result.text = result.text!+"3"
        result2.text = result2.text!+"3"
    }
    @IBAction func b4(_ sender: Any) {
        result.text = result.text!+"4"
        result2.text = result2.text!+"4"
    }
    @IBAction func b5(_ sender: Any) {
        result.text = result.text!+"5"
        result2.text = result2.text!+"5"
    }
    @IBAction func b6(_ sender: Any) {
        result.text = result.text!+"6"
        result2.text = result2.text!+"6"
    }
    @IBAction func b7(_ sender: Any) {
        result.text = result.text!+"7"
        result2.text = result2.text!+"7"
    }
    @IBAction func b8(_ sender: Any) {
        result.text = result.text!+"8"
        result2.text = result2.text!+"8"
    }
    @IBAction func b9(_ sender: Any) {
        result.text = result.text!+"9"
        result2.text = result2.text!+"9"
    }
    @IBAction func b0(_ sender: Any) {
        result.text = result.text!+"0"
        result2.text = result2.text!+"0"
    }
    @IBAction func Add(_ sender: Any) {
        if result2.text != ""
        {
            stack1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if stack2.IsEmpty() == 1
        {
            stack2.PushStack(x: "+")
        }
        else
        {
            calcu.compare(x1: "+", y1: stack1, z1: stack2)
            stack2.PushStack(x: "+")
        }
        
        
        result.text = result.text! + "+"
    }
    @IBAction func AC(_ sender: Any) {
        result.text = ""
        result2.text = ""
        stack1.DelStack()
        stack2.DelStack()
    }
    @IBAction func Subtraction(_ sender: Any) {
        if result2.text != ""
        {
            stack1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if stack2.IsEmpty() == 1
        {
            stack2.PushStack(x: "-")
        }
        else
        {
            calcu.compare(x1: "-", y1: stack1, z1: stack2)
            stack2.PushStack(x: "-")
        }
        
        
        result.text = result.text! + "-"
    }
    @IBAction func multiply(_ sender: Any) {
        if result2.text != ""
        {
            stack1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if stack2.IsEmpty() == 1
        {
            stack2.PushStack(x: "*")
        }
        else
        {
            calcu.compare(x1: "*", y1: stack1, z1: stack2)
            stack2.PushStack(x: "*")
        }
        
        
        result.text = result.text! + "*"
    }
    @IBAction func Except(_ sender: Any) {
        if result2.text != ""
        {
            stack1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        
        if stack2.IsEmpty() == 1
        {
            stack2.PushStack(x: "/")
        }
        else
        {
            calcu.compare(x1: "/", y1: stack1, z1: stack2)
            stack2.PushStack(x: "/")
        }
        
        
        result.text = result.text! + "/"
    }
    
    @IBAction func buttonResult(_ sender: Any) {
        if result2.text != ""
        {
            stack1.PushStack(x: Double(result2.text!)!)
            result2.text = ""
        }
        calcu.compare(x1: "=", y1: stack1, z1: stack2)
        var t = stack1.PopStack()
        
        result.text = result.text! + "=" + "\(t ?? 0)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

