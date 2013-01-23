# Command-line usage: `coffee mygov-discovery`
require('fs').writeFile 'mygov-discovery.json', JSON.stringify
  endpoints: [
    name: "Pages"
    methods: [
      MethodName: "Get a page by URL"
      Synopsis: "Lookup a page by its URL"
      HTTPMethod: "GET"
      URI: "/pages"
      parameters: [
        Name: "url"
        Required: "Y"
        Default: "http://"
        Type: "string"
        Description: "URL Of the page to lookup"
      ,
        Name: "callback"
        Required: "N"
        Type: "string"
        Description: "Optional JSONP callback with which to wrap the response"
      ]
    ,  
      MethodName: "Get a page by ID"
      Synopsis: "Retrieve a page by its ID"
      HTTPMethod: "GET"
      URI: "/pages/:id"
      parameters: [
        Name: "id",
        Required: "Y",
        Type: "integer",
        Description: "The Page ID"
      ,
        Name: "related"
        Required: "N"
        Type: "integer"
        Description: "Number of related pages to return, must be between 0 and 25."
      ,
        Name: "callback"
        Required: "N"
        Type: "string"
        Description: "Optional JSONP callback with which to wrap the response"
      ]
    ,
      MethodName: "Update a page"
      Synopsis: "Rate a page or update its tags"
      HTTPMethod: "POST"
      URI: "/pages/:id"
      parameters: [
        Name: "id",
        Required: "Y",
        Type: "integer",
        Description: "The Page ID"
      ,
        Name: "rating"
        Required: "N"
        Type: "integer"
        Description: "Rating, between 1 and 5"
      ,
        Name: "tag_list"
        Required: "N"
        Type: "string"
        Description: "Comma separated list of tags, existing list will be replaced"
      ,
        Name: "callback"
        Required: "N"
        Type: "string"
        Description: "Optional JSONP callback with which to wrap the response"
      ]
    ]
  ,
    name: "Tags"
    methods: [
      MethodName: "Pages by tag"
      Synopsis: "Retrieve a page by tag(s)"
      HTTPMethod: "GET"
      URI: "/tags/:tag.json"
      parameters: [
        Name: "tag"
        Required: "Y"
        Type: "string"
        Description: "Tag or comma separated list of tags"
      ]
    ,
      MethodName: "Tags Query"
      Synopsis: "Lookup Tags by query"
      HTTPMethod: "GET"
      URI: "/tags.json"
      parameters: [
        Name: "q"
        Required: "Y"
        Type: "string"
        Description: "Tag or partial tag to look for"
      ,
        Name: "callback"
        Required: "N"
        Type: "string"
        Description: "Optional JSONP callback with which to wrap the response"
      ]
    ]
  ,
    name: "Domains"
    methods: [
      MethodName: "Domain Lookup"
      Synopsis: "Lookup domains by ID"
      HTTPMethod: "GET"
      URI:  "/domains/:id"
      parameters: [
        Name: "id"
        Type: "integer"
        Required: "Y"
        Description: "The domain ID"
      ,
        Name: "callback"
        Required: "N"
        Type: "string"
        Description: "Optional JSONP callback with which to wrap the response"
      ]
    ,
      MethodName: "Domain Query"
      Synopsis: "Lookup domains by reverse name"
      HTTPMethod: "GET"
      URI: "/domains"
      parameters: [
        Name: "q"
        Type: "string"
        Required: "Y"
        Description: "The reverse domain with trailing slash, e.g., gov. or gov.whitehouse."
      ,
        Name: "page"
        Type: "integer"
        Required: "N"
        Description: "Page to retrieve. Results limited to 25 domains per page. Default page is 1"
      ,
        Name: "callback"
        Required: "N"
        Type: "string"
        Description: "Optional JSONP callback with which to wrap the response"
      ]  
    ]
  ]
, null, 2