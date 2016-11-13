#Constraint programmatically
##example ActivityIndicatorView
* code location viewDidLoad()

##case 1
<pre>
<code>
//create activityIndicatorView
let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
indicatorView.startAnimating()
indicatorView.translatesAutoresizingMaskIntoConstraints = false   //false => autolayout setting

//constraint create ( parentView: UIView (toItem) , childView: indicatorView (item) )
let xConstraint = NSLayoutConstraint(item: indicatorView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
let yConstraint = NSLayoutConstraint(item: indicatorView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)

//activate constraints
NSLayoutConstraint.activate([xConstraint, yConstraint])

//add indicatorView
view.addSubview(indicatorView)
</code>
</pre>

##case 2
<pre>
<code>
//create activityIndicatorView
let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
indicatorView.startAnimating()
indicatorView.translatesAutoresizingMaskIntoConstraints = false   //false => autolayout setting
        
//constraint create ( parentView: UIView (toItem) , childView: indicatorView (item) )
let xConstraint = NSLayoutConstraint(item: indicatorView, attribute: .centerX, relatedBy: .equal, toItem: webView, attribute: .centerX, multiplier: 1, constant: 0)
let yConstraint = NSLayoutConstraint(item: indicatorView, attribute: .centerY, relatedBy: .equal, toItem: webView, attribute: .centerY, multiplier: 1, constant: 0)
        
//add indicatorView
webView.addSubview(indicatorView)
        
//after add constraint
webView.addConstraint(xConstraint)
webView.addConstraint(yConstraint)
</code>
</pre>
