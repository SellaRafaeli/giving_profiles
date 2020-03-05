A social network based on donations. 

TODOs:
mobile css 
add share-to-fb buttons

(infrastructure)
homepage
login for admins, logout
user profile page with user details
edit your details
add a donation by amount to existing org
edit details of org (type, website) 
search users
search organizations
search with facets 
add donation to new organization
admin: see all users, donations, organizations

on profile page: set my pinned cause & org + explanation text
view feed: see activity in my network
view organization: see who from my friends donated to this org
User profile Pic
Login with FB
 
Additions for 20.11
- add donation form (only accepts positive amounts, existing orgs)
- edit org page: only for admins (currently erez, me)
- view amounts of donation - only for yourself 
- org page: show donors pics with link back to them 
- user name and address: from profile 
- header changes by layout (+ "home" which is very standard)
- login page by layout
- basic feed
- search results: show total amount raised, plus actual faces 



this weeks' additions:
- add list of organizations from Amazon (260k)
- ability to add more orgs manually (from any org page), for admins
- some visual refinements to account for long organization names 
- performance improvements to account for the 260k orgs we now have
- option to delete single donation 
- option to set organization type
- user profile: show badge if donating more than 10% of yearly income
- enable "verifying" a user by admin (blue checkmark) from /admin

next steps (please commnt: 
- user profile: visualization of donations by cause, type 
  - note: most orgs don't have a type
- delete account (soft deletion)
- all site pages should now be mobile-friendly
- view organizations by type (from search page)
- reverse donation list order 
- Share to facebook (a donation or organization)
- embed facebook posts in feed

next steps:
done
====
1. settings page: change 'address' name to 'location' 
2. featured organizations -> add 'featured cause' 
their income so they can get the badge 
3. add explanation text in the settings page, telling the user they need us to verify 
4. hide users when searching by org type 
5. custom domain 
6. on re-sign up: un-delete a profile 
7. org types - crowdsourced (as well as website and facebook page)
8. safari header improvements
9. causes distribution - by amount of money (not # of orgs)
10. Profile can also be shared 
11. User can enter as many featured organizations / causes as they want
12. "Verified" interface - added on-screen explanation text as to how to use it

Coming up this week:
1. UI touches, match design, prettify 
2. FB posts on feed (with crowd-sourced FB pages)
3. FAQ section, contact us
- magnifying glass: lead to search page
- org page: separate section to edit organization's info 
- share profile: fix on Safari 

4. privacy of donations 
5. Check email parsing

- org edit: let anyone edit website and facebook page 
- fix for user with no favorite organizations
- fix database 

- settings page: add featured cause/org
  - choose cause/org from the ones you have already donated to (and haven't already selected) - from the ones you have donated to. 
  - be able to order them 

questions: can you give me:
- a list of "causes"
- a list of "types" of organization (e.g. envrionmental, human rights, etc)
- do organizations have both a cause and a type?
- how to recognize somebody's network from facebook? Perhaps just let them choose a network on the site? (this would also allow non-FB people to sign up and also make things easier for me.)
- what are badges given for?

Comments:
Homepage, Org page - Erez will send designs 
2. Feed - show donations, 'announcements' (like earning a badge, or maybe 'expressing interest in a charity') - FB posts 
3. Supply your total yearly income
4. donations - don't show amount 
5. User profile page - featured organizations and causes (not just one) with text. 
6. Charity Badges: a charity gets a badge if it gets rated by givewell's top-rated charities. 
7. User badges: 1. whether total donations reaches some percentage of income, 2. whether a % of donations are to 'highly effective charities' (those with givewell rating). 

.. 

8. Users can only see donations by others in the same group as them?

-- 
Privacy Settings:
- For the profile: 1. completely private (only you can see your profile), 2. only your Facebook friends can see, and 3. completely public.  
- For a given organization: 1. completely private: is never announced and is excluded from your profile, 2. gets included in your profile and on your FB friends' news feeds.
- For individual donations: 1. completely privates never announced and is excluded from your profile, 2. gets included in your profile and on your FB friends' news feeds.

List of charities - the link you sent, as far as I can tell, will not give us a list of charities, but we can find those elsewhere. For example https://en.wikipedia.org/wiki/List_of_charitable_foundations or https://www.forbes.com/top-charities/list/2/#tab:rank. These will give us about 200 organizations, and we can add more. I suggest then to start with one of these lists and allow admins (like you or someone on your behalf) to add more, later on. And in the meantime, users will only be able to choose from the list we create (and if we choose, we can later let them add their own organizations).

>> things done for 1.1.18
- 'Profiles (Erez Yoeli) —> My Profile'
- Eliminate black outlines everywhere, as in mockups
- 'Record a giving' —> 'record a donation'
- org edit: let anyone edit website and facebook page 
- fix 'add fav org' for user with no favorite organizations
- fix database, set production db (another 18$ per month)
- new feed layout
- privacy of donations (via settings page)

>> things done for 8.1.18
- bottom:
  - remove 'me' at the bottom 
  - remove 'log out' 
  - FAQ at the bottom -> 'about_us'
  - Make match header length
  - about us: as in emails 
- remove 'home' button in top left 
- different icon for landing page 'discover' (magnifying glass)
- 'active tab' should be marked (and then remove the <h1> saying the name of the page)
- remove black line on feed column headers, and settings page input outlines 
- profile page:
  - link from 'fav organizations' to the org page
  - fav orgs and fav causes - no separate header, just one box, and the explanation ('featured org' or 'featured cause' will be right above it), and everything below 'my donations by cause'
- feed columns: make our donations list look like FB page; 
- orgs page - remove the header. 

- fix 'fb refresh' bug: fix involved in a performance regression; suggest still trying.
- donations: add privacy level per all organizations (plus tabs for "by donation" and "by organization"). And make 'non-private' also in 'blue' (match the colors). Private organizations will only show up for that user (in donations list, org page donors list, search results.)
- new search layout: list of causes, list of badges, popular organizations


Done for 15.1.18
- headers in feed - nicefied
- about us page (like https://apptopia.com/about)
- contact us page + sends email
- privacy policy page
- profile page:
  - 'featured cause' similar design to 'featured org', + cause logo
  - featured orgs - FB logo if available
- fb bug

coming up 
- exporting data
- email parsing re search (seems as difficult as I suspected)
- search for UI designer


Done for 19.1.18
- fix privacy bugs
- fix autocomplete bugs
- feed header 
- http://givingprofiles.org/mails_tester. Still need to configure incoming mail receiver, and also our users do not have an email configured. 
- 

Issues for 30.1.18
1. small bug: 'your network' header when scrolling right.
2. fb columns - smaller. 
3. adding new org - try with a dropdown (not autocomplete)

$ filewatcher '**/*.scss' 'scss $FILENAME > $FILENAME.css; echo "created"-$FILENAME; date'

Email Parser Logic:
1. Hold all names in Memory # z3 = $orgs.get_many({},projection: {name:1});
2. On incoming email, go through all names, and find the ones that are INCLUDED in the body of the email. #  z3.select {|d| para.include?(d['name']) }.sort_by {|s| -s['name'].size }[0]['name']