//
//  ViewController.swift
//  WebAppGenerator
//
//  Created by LIPL-227 on 16/02/22.
//

import Cocoa
import Foundation
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet weak var progressView : NSProgressIndicator!
    
    @IBOutlet weak var mywebview: WKWebView!
    @IBOutlet weak var backButton   : NSButton!
    @IBOutlet weak var forButton    : NSButton!

    var homeUrl_str = "https://www.apple.com"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        mywebview.navigationDelegate = self
        mywebview.uiDelegate = self
        let url = URL(string: homeUrl_str)!
        mywebview.load(URLRequest(url: url))
        mywebview.allowsBackForwardNavigationGestures = true
        
        self.backButton.isEnabled = false
        forButton.isEnabled = false

        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func  homeAction(_ sender: Any) {
    print("home")
        
        let url = URL(string: homeUrl_str)!
        mywebview.load(URLRequest(url: url))
    }
    
    @IBAction func  backAction(_ sender: Any) {
        
        if mywebview.canGoBack {
            mywebview.goBack()
        }
    
    }
    
    @IBAction func  forwordAction(_ sender: Any) {
        if mywebview.canGoForward {
            mywebview.goForward()
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}



extension ViewController: WKNavigationDelegate , WKUIDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
      setLoading(false,
                 canGoBack: webView.canGoBack,
                 canGoForward: webView.canGoForward)
         
    }
    
    public func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        setLoading(false)
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        setLoading(false, error: error)
    }
    
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        setLoading(true)
    }
    
    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
      setLoading(true,
                 canGoBack: webView.canGoBack,
                 canGoForward: webView.canGoForward)
    }
    
    public func webView(_ webView: WKWebView,
                        decidePolicyFor navigationAction: WKNavigationAction,
                        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
    
        setLoading(false)
        decisionHandler(.allow)
    }
    func setLoading(_ isLoading: Bool,
                    canGoBack: Bool? = nil,
                    canGoForward: Bool? = nil,
                    error: Error? = nil) {
        
        if mywebview.canGoBack {
            self.backButton.isEnabled = true
            
        } else {
            self.backButton.isEnabled = false
        }
        
        if mywebview.canGoForward {
            forButton.isEnabled = true
        } else {
            forButton.isEnabled = false
        }
        
        if isLoading != false {
            progressView.startAnimation(self)
        }else {
            progressView.stopAnimation(self)
        }
        progressView.isHidden = !isLoading
       
       
    }
}
