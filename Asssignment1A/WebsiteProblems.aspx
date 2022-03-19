<%@ Page Title="" Language="C#" MasterPageFile="~/CosmoplanesMaster.Master" AutoEventWireup="true" CodeBehind="WebsiteProblems.aspx.cs" Inherits="Asssignment1A.WebsiteProblems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="CPMain" runat="server">
    <header>
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4">Cosmoplanes</h1>
                <p class="lead"><a href="https://www.cosmoplanes.com/">Click her to view the website</a></p>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="row">
            <div class="col">
                <p class="h2 text-center">HTML5 Compliance</p>
                <p>The Cosmoplanes website has many inconsistency and errors. The website is not HTML5 compliant. As per
                    <a href="https://validator.w3.org/nu/?doc=https%3A%2F%2Fwww.cosmoplanes.com%2F" target="_blank">W3C HTML Mark-Up 
                   Validator</a> the website had a total of 213 warnings and errors.
                    Few inconsistancies examples were as follows:
                </p>
                <ul class="list-group">
                    <li class="list-group-item list-group-item-danger">
                        Error. It had multiple duplicated IDs.
                    </li>
                    <li class="list-group-item list-group-item-warning">
                        Warning: The type attribute is unnecessary for JavaScript resources.
                    </li>
                    <li class="list-group-item list-group-item-danger">
                        Error: Element span not allowed as child of element ul in this context. 
                    </li>
                    <li class="list-group-item list-group-item-danger">
                        Error: An img element must have an alt attribute, except under certain conditions
                    </li>
                    <li class="list-group-item list-group-item-danger">
                        Error: The align attribute on the div element is obsolete.
                    </li>
                </ul>
                <p>
                    As shown in the few examples the web page has errror in  its 
                    code. It has reused ID for tags in multiple instances. This is a
                    bad practice as id for each tag should be unique. </p>
                <p>
                    The website has not followed the heirarchy of elements used. In 
                    multiple instance elements that should are not allowed to be a child
                    element of certain element which makes it an invalid HTML code.In
                    the example above the span element has been used as a child of ul
                    element which is non compliant as per HTML5 rules.</p>
                <p>
                    The web page has not used proper attributes in many of the elements
                    used in the source. It has used align in div element which is 
                    obsolete.The web page also has 
                    missing alt attribute in many of the images used.
                </p>
                <p>
                    The website has not used CSS in many places. The designing of the 
                    different elements in the webpage should have been done using CSS.
                    Insted the website has styling attribute used in most of its elements
                    which is not the best practice when designing webpage with HTML5
                </p>
            </div>
         </div>
        <div class="row">
            <div class="col">
                <p class="h2 text-center">Why is the Website Hard to Use?</p>
                <p>
                    Cosmoplanes is a social media and a market place platform. Despite 
                    being a useful website it has many flaws in its design. In the first
                    look it is hard to determine what the website is actually for. It is
                    navigate through the website.
                 </p>
                <p>
                    The website has made use of many images in attempt to make the site
                    attactive,but the images used are not of appropriate sizes. Most
                    pictures used in the website has been resized which has made the 
                    website look unprofessional. Moreover, the background image with 
                    coupled with semi-transparent background background for contents 
                    makes it harder to focus on the contents of the website.
                </p>
                <p>
                    The website has a navigation bar which is over loaded with contents.
                    The navigation bar contains a list of every single contents of the 
                    website which make it look unorganized and makes it hard to use. It
                    hard to navigate to any page when the navigation bar is unorganized
                    and over filled with contents. Most items in the navigation bar has
                    a drop down linked to it which actually makes it more complicated 
                    to use the website. To make things worst the navigation bar does not 
                    stay at the top of the page as we scroll down.
                </p>
                <p>
                    The main home page of the website is completely filled with contents
                    of all the item that can be found in the website. The contents of the
                    are not aligned. We can find certain contents aligned on the right 
                    side of the page while others are in the left or the center of the 
                    page. This makes the entire page look clustered and unprofessional.
                    Moreover, the website refreshes the whole page when any of the link
                    has been clicked. This can make it annoying to use the website.
                </p>
            </div>
        </div>
    </div>
</asp:Content>
