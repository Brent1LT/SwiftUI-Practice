//
//  ParseContent.swift
//  wkwebview
//
//  Created by Brent Bumann on 5/28/24.
//

import Foundation
import Ink

class ParseContent {
    var markdown = """
    # An exhibit of Markdown

    This note demonstrates some of what [Markdown][1] is capable of doing.

    *Note: Feel free to play with this page. Unlike regular notes, this doesn't automatically save itself.*

    ## Basic formatting

    Paragraphs can be written like so. A paragraph is the basic block of Markdown. A paragraph is what text will turn into when there is no reason it should become anything else.

    Paragraphs must be separated by a blank line. Basic formatting of *italics* and **bold** is supported. This *can be **nested** like* so.

    ## Lists
    
    ### Ordered list

    1. Item 1
    2. A second item
    3. Number 3
    4. Ⅳ

    *Note: the fourth item uses the Unicode character for [Roman numeral four][2].*

    ### Unordered list

    * An item
    * Another item
    * Yet another item
    * And there's more...
    
    ## Paragraph modifiers

    ### Code block

        `Code blocks are very useful for developers and other people who look at code or other things that are written in plain text. As you can see, it uses a fixed-width font.`

    You can also make `inline code` to add code into other things.

    ### Quote

    > Here is a quote. What this is should be self explanatory. Quotes are automatically indented when they are used.
    
    # Code highlighting in a WebView
    When you build a site, it is important to respect the correct structure for your texts, images and buttons. That's because search engines will read your content and index it based on your structure. Some basic rules are:

    - Every page needs an **h1** for title.
    - Every page needs meta tags specifically for search engines: **title**, **description**, **keywords**, etc.
    - Every image needs an **alt** properties to explain what the image is about. This is also great for accessibility.

      ```jsx
      <img src="/images/logos/logo.svg" alt="logo" />
      <h1>Design and code React apps</h1>
      <p>
        Don’t skip design. Learn design and code by building real apps with
        React and Swift. Complete courses about the best tools.
      </p>
    """
    
    func parse() -> String {
        let parser = MarkdownParser()
        let html = parser.html(from: markdown)
        
        let htmlStart = "<HTML><HEAD><link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/styles/atom-one-dark.min.css\"></HEAD style=\"padding: 40px; font-size: 20px; font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Open Sans,Helvetica Neue,sans-serif\"><BODY>"
        let htmlEnd = "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.7.2/highlight.min.js\"></script><script>hljs.highlightAll();</script></BODY></HTML>"
        
        let codeRegex = "<code.*?"
        let contentWithCodeStyling = html.replacingOccurrences(of: codeRegex, with: "$0" + " style=\" margin-bottom: 20px; overflow: scroll; border-radius: 10px; padding: 20px; padding-right: 0; font-family: SF Mono,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Open Sans,Helvetica Neue,sans-serif; font-size: 15px; font-weight: 500; line-height: 20px;", options: .regularExpression, range: nil)

        
        return htmlStart + contentWithCodeStyling + htmlEnd
    }
}
