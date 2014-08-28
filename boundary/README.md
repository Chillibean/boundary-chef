Boundary Cookbook
=================

This cookbook install graphdat-agent and graphdat-relay.

Requirements
------------


To display data on Nginx Relay plugin, It requires that nginx server has enabled 'nginx_status'. 


#### packages
- `nodejs` - boundary needs nodejs to run relay plugins.

Attributes
----------

#### boundary::default
<table>
  <tr>
    <th>Key</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['boundary']['agent_token']</tt></td>
    <td>Your agent token for agent configuration</td>
    <td><tt></tt></td>
  </tr>
    <tr>
    <td><tt>['boundary']['api_token']</tt></td>
    <td>Your api token for relay configuration</td>
    <td><tt></tt></td>
  </tr>
    <tr>
    <td><tt>['boundary']['email']</tt></td>
    <td>Your amail</td>
    <td><tt></tt></td>
  </tr>
</table>


Contributing
------------


e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
