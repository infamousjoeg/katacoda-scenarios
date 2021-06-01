# Making a Web App Secure

TODO: Replace with true intro video
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/KeJJ34BvA7Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

In this scenario, we'll create a webpage that makes a database connection to MySQL using hard-coded credentials in a PHP script.  After that, we'll use [CyberArk Conjur](https://conjur.org) to secure the database connection credentials and fetch it as needed using the REST API, removing the hard-coded credentials in the process.