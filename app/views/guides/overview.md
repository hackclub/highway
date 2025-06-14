# Guides

Welcome! This is a tab where Hack Clubbers (just like you!) can write tips n' tricks, guides, and pretty much any info on projects that they've previously built. 

The goal is to have a collection of resources that grows as highway goes on.

The first one is on how to make a Game Console - check it out on the sidebar!

#### Contributing

To contribute, make a markdown file in the app/views/guides folder! Put your guide in there.

Next, open app/views/guides/_sidebar.html.erb. Copy this:  
```
<%= link_to "YOUR PROJECT TYPE", guides_page_path(".MD FILE NAME"), class: "#{current_page?(guides_page_path(".MD FILE NAME")) ? 'bg-[#564CAD]' : 'hover:bg-[#564CAD]'} bg-[#2E2A54] p-2 px-6 rounded transition duration-100 block font-dystopian" %>
```
and paste where instructed in that file. Replace the placeholders with your guide, and make a PR with all of your changes!

**In return, you'll get rewarded 1 free point for adding a *finished* guide**

