Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F059265FB1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:41:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiMO-0006sr-P3; Fri, 11 Sep 2020 12:41:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGiMN-0006sF-RY
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:40:59 +0000
X-Inumbo-ID: 53a1ccb8-79e9-46d0-ad57-45f95cbe189b
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53a1ccb8-79e9-46d0-ad57-45f95cbe189b;
 Fri, 11 Sep 2020 12:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3n0ohLD5vGC2tAdR+K+unPc6Jc5i/h6YYF+bO959Yg=;
 b=Os6tkyv6dAhx2bHaABdVn8+s1lCVRWEkWXNhcpffmzird3rGD2b00vuA
 7IE4xRO1cMF/QLIPm44z9FByGxDyK6jtAFx+gLUSrl/3J/ybGKaEJqd2o
 MHKP5qXydGeyHecO5GpZ+BfiQTqxmXtTITWVvatVbq1P0OJ8vyNTepRUH M=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 97ln0Ay0Wi5aYYPYk8+iBUnko0+ut7IiHGtILZqx8FRQnoLiZSuCqD9ryeimyC7unKtPFhjn2X
 aNI+CSd7P+R/tFs+zGRZ7EM42MUYmTgJXhVt5fOaaocw2JAV5NF2SGRmsOUr7ROVHSnBpUpGle
 U3umSmLphRwOlv9H+tyXmEGwiF02FSNYP2Pg1IpZwNDe9C1WE2M7c0n07q19+TqcIxueyTl+Ff
 2SbjE7b5OXztjwpUFdCI4kLaWEJEONbh3ZEkSaDncGwIiFWBusKk/ct0XhdAV+4VyIpVZdkk2N
 HJs=
X-SBRS: 2.7
X-MesageID: 26619472
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26619472"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 7/8] Convert resolving-disagreement.md to rst
Date: Fri, 11 Sep 2020 13:40:08 +0100
Message-ID: <20200911124009.3760032-8-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200911124009.3760032-1-george.dunlap@citrix.com>
References: <20200911124009.3760032-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

communication-practice.rst had an incorrect link; it was listed as
being in resolving-disagreements.md, but actually it was in
code-review-guide.  Convert this to a normal cross-reference.

Convert titles / sections, lists, quotes, doc references and so on as
before.

Convert figure as appropriate.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 source/code-review-guide.rst                  |   1 +
 source/communication-practice.rst             |   6 +-
 source/index.rst                              |   1 +
 ...greement.md => resolving-disagreement.rst} | 109 +++++++++++-------
 4 files changed, 71 insertions(+), 46 deletions(-)
 rename source/{resolving-disagreement.md => resolving-disagreement.rst} (72%)

diff --git a/source/code-review-guide.rst b/source/code-review-guide.rst
index 9c0040e..5a046a2 100644
--- a/source/code-review-guide.rst
+++ b/source/code-review-guide.rst
@@ -276,6 +276,7 @@ thread onto a code-base. Different people use different techniques from using
   addressed
 * A combination of the above
 
+.. _code-review-problematic-patch-review:
 .. _problems:
 
 Problematic Patch Reviews
diff --git a/source/communication-practice.rst b/source/communication-practice.rst
index 3ccc087..70f5b8c 100644
--- a/source/communication-practice.rst
+++ b/source/communication-practice.rst
@@ -385,7 +385,8 @@ A pragmatic approach would be to
   style and minor issues in the review, until the significant flaw is addressed
 
 This saves both the patch author and reviewer(s) time. Note that some
-background is covered in detail in `Problematic Patch Reviews <4_>`_.
+background is covered in detail in
+:ref:`Problematic Patch Reviews <code-review-problematic-patch-review>`.
 
 
 Reviewers: Welcome newcomers
@@ -457,6 +458,8 @@ This section contains common communication issues and provides suggestions on
 how to avoid them and resolve them. These are **general** issues which affect
 **all** online communication. As such, we can only try and do our best.
 
+.. _communication-practice-misunderstandings:
+
 Misunderstandings
 -----------------
 
@@ -569,7 +572,6 @@ how to avoid and resolve issues.
 .. _1: https://youtu.be/ehZvBmrLRwg?t=834
 .. _2: https://en.wikipedia.org/wiki/Foot_binding
 .. _3: https://xenproject.org/developers/governance/#expressingopinion
-.. _4: resolving-disagreement.md#problems
 .. _5: https://www.wired.com/2006/02/the-secret-cause-of-flame-wars/
 .. _6: https://xenproject.org/help/irc/
 .. _8: https://en.wikipedia.org/wiki/Erin_Meyer
diff --git a/source/index.rst b/source/index.rst
index be162cf..c8b45d8 100644
--- a/source/index.rst
+++ b/source/index.rst
@@ -14,6 +14,7 @@ Welcome to XenProject Governance's documentation!
    communication-guide
    code-review-guide
    communication-practice
+   resolving-disagreement
 
 Indices and tables
 ==================
diff --git a/source/resolving-disagreement.md b/source/resolving-disagreement.rst
similarity index 72%
rename from source/resolving-disagreement.md
rename to source/resolving-disagreement.rst
index a635352..28071cf 100644
--- a/source/resolving-disagreement.md
+++ b/source/resolving-disagreement.rst
@@ -1,51 +1,62 @@
-# Resolving Disagreement
+Resolving Disagreement
+**********************
 
 This guide provides Best Practice on resolving disagreement, such as
+
 * Gracefully accept constructive criticism
 * Focus on what is best for the community
 * Resolve differences in opinion effectively
 
-## Theory: Paul Graham's hierarchy of disagreement
+Theory: Paul Graham's hierarchy of disagreement
+===============================================
 
 Paul Graham proposed a **disagreement hierarchy** in a 2008 essay
-**[How to Disagree][1]**, putting types of arguments into a seven-point
+`How to Disagree <1_>`_, putting types of arguments into a seven-point
 hierarchy and observing that *moving up the disagreement hierarchy makes people
 less mean, and will make most of them happier*. Graham also suggested that the
 hierarchy can be thought of as a pyramid, as the highest forms of disagreement
 are rarer.
 
-| ![Graham's Hierarchy of Disagreement][2]                                    |
-| *A representation of Graham's hierarchy of disagreement from [Loudacris][3]
-  modified by [Rocket000][4]*                                                 |
+.. figure:: https://upload.wikimedia.org/wikipedia/commons/a/a3/Graham%27s_Hierarchy_of_Disagreement-en.svg
+   :alt: Graham's Hierarchy of Disagreement
+	 
+   A representation of Graham's hierarchy of disagreement from `Loudacris <3_>`_
+   modified by `Rocket000 <4_>`_
 
 In the context of the Xen Project we strive to **only use the top half** of the
 hierarchy. **Name-calling** and **Ad hominem** arguments are not acceptable
 within the Xen Project.
 
-## Issue: Scope creep
+Issue: Scope creep
+==================
 
 One thing which occasionally happens during code review is that a code reviewer
 asks or appears to ask the author of a patch to implement additional
 functionalities.
 
 This could take for example the form of
-> Do you think it would be useful for the code to do XXX?
-> I can imagine a user wanting to do YYY (and XXX would enable this)
+
+  *Do you think it would be useful for the code to do XXX?*
+  
+  *I can imagine a user wanting to do YYY (and XXX would enable this)*
 
 That potentially adds additional work for the code author, which they may not
 have the time to perform. It is good practice for authors to consider such a
 request in terms of
+
 * Usefulness to the user
 * Code churn, complexity or impact on other system properties
 * Extra time to implement and report back to the reviewer
 
 If you believe that the impact/cost is too high, report back to the reviewer.
 To resolve this, it is advisable to
+
 * Report your findings
 * And then check whether this was merely an interesting suggestion, or something
   the reviewer feels more strongly about
 
 In the latter case, there are typically several common outcomes
+
 * The **author and reviewer agree** that the suggestion should be implemented
 * The **author and reviewer agree** that it may make sense to defer
   implementation
@@ -54,13 +65,16 @@ In the latter case, there are typically several common outcomes
 
 The author of a patch would typically suggest their preferred outcome, for
 example
-> I am not sure it is worth to implement XXX
-> Do you think this could be done as a separate patch in future?
+
+  *I am not sure it is worth to implement XXX*
+  
+  *Do you think this could be done as a separate patch in future?*
 
 In cases, where no agreement can be found, the best approach would be to get an
 independent opinion from another maintainer or the project's leadership team.
 
-## Issue: [Bikeshedding][5]
+Issue: `Bikeshedding <5_>`_
+===========================
 
 Occasionally discussions about unimportant but easy-to-grasp issues can lead to
 prolonged and unproductive discussions. The best way to approach this is to
@@ -73,13 +87,15 @@ review, as you will very quickly get different reviewers providing differing
 opinions. In this case it is best for the author or a reviewer to call out the
 potential bikeshedding issue using something like
 
-> Looks we have a bikeshedding issue here
-> I think we should call a quick vote to settle the issue
+  *Looks we have a bikeshedding issue here*
+  
+  *I think we should call a quick vote to settle the issue*
 
-Our governance provides the mechanisms of [informal votes][6] or
-[lazy voting][7] which lend themselves well to resolve such issues.
+Our governance provides the mechanisms of `informal votes <6_>`_ or
+`lazy voting <7_>`_ which lend themselves well to resolve such issues.
 
-## Issue: Small functional issues
+Issue: Small functional issues
+==============================
 
 The most common area of disagreements which happen in code reviews, are
 differing opinions on whether small functional issues in a patch series have to
@@ -92,6 +108,7 @@ To explain this better, I am going to use the analogy of some building work that
 has been performed at your house. Let's say that you have a new bathroom
 installed. Before paying your builder the last installment, you perform an
 inspection and you find issues such as
+
 * The seals around the bathtub are not perfectly even
 * When you open the tap, the plumbing initially makes some loud noise
 * The shower mixer has been installed the wrong way around
@@ -106,13 +123,14 @@ whether your builder had committed to the level of quality you were expecting.
 Similar situations happen in code reviews very frequently and can lead to a long
 discussion before it can be resolved. The most important thing is to
 **identify** a disagreement as such early and then call it out. Tips on how to
-do this, can be found [here][8].
+do this, can be found :doc:`here <communication-practice>`.
 
 At this point, you will understand why you have the disagreement, but not
 necessarily agreement on how to move forward. An easy fix would be to agree to
 submit the change as it is and fix it in future. In a corporate software
 engineering environment this is the most likely outcome, but in open source
 communities additional concerns have to be considered.
+
 * Code reviewers frequently have been in this situation before with the most
   common outcome that the issue is then never fixed. By accepting the change,
   the reviewers have no leverage to fix the issue and may have to spend effort
@@ -133,7 +151,8 @@ the end of the day, the solution should focus on what is best for the community,
 which may mean asking for an independent opinion as outlined in the next
 section.
 
-## Issue: Multiple ways to solve a problem
+Issue: Multiple ways to solve a problem
+=======================================
 
 Frequently it is possible that a problem can be solved in multiple ways and it
 is not always obvious which one is best. Code reviewers tend to follow their
@@ -146,43 +165,45 @@ even  if they could be considered style issues, trusting the experience of the
 code reviewer. Similarly, we ask code reviewers to let the contributor have the
 freedom of implementation choices, where they do not have a downside.
 
-We do not always succeed in this, as such it is important to **identify** such a
-situation and then call it out as outlined [here][8].
+We do not always succeed in this, as such it is important to
+**identify** such a situation and then call it out as outlined
+:ref:`here <communication-practice-misunderstandings>`.
 
-## Resolution: Asking for an independent opinion
+Resolution: Asking for an independent opinion
+=============================================
 
 Most disagreements can be settled by
+
 * Asking another maintainer or committer to provide an independent opinion on
   the specific issue in public to help resolve it
 * Failing this an issue can be escalated to the project leadership team, which
   is expected to act as referee and make a decision on behalf of the community
 
 If you feel uncomfortable with this approach, you may also contact
-mediation@xenproject.org to get advice. See our [Communication Guide][9]
+mediation@xenproject.org to get advice. See our :doc:`Communication Guide <communication-guide>`
 for more information.
 
-## Decision making and conflict resolution in our governance
+Decision making and conflict resolution in our governance
+=========================================================
 
-Our [governance][A] contains several proven mechanisms to help with decision
+Our `governance <A_>`_ contains several proven mechanisms to help with decision
 making and conflict resolution.
 
 See
-* [Expressing agreement and disagreement][B]
-* [Lazy consensus / Lazy voting][7]
-* [Informal votes or surveys][6]
-* [Leadership team decisions][C]
-* [Conflict resolution][D]
-
-[1]: http://www.paulgraham.com/disagree.html
-[2]: https://upload.wikimedia.org/wikipedia/commons/a/a3/Graham%27s_Hierarchy_of_Disagreement-en.svg
-[3]: https://www.createdebate.com/user/viewprofile/Loudacris
-[4]: https://en.wikipedia.org/wiki/User:Rocket000
-[5]: https://en.wiktionary.org/wiki/bikeshedding
-[6]: https://xenproject.org/developers/governance/#informal-votes-or-surveys
-[7]: https://xenproject.org/developers/governance/#lazyconsensus
-[8]: communication-practice.md#Misunderstandings
-[9]: communication-guide.md
-[A]: https://xenproject.org/developers/governance/#decisions
-[B]: https://xenproject.org/developers/governance/#expressingopinion
-[C]: https://xenproject.org/developers/governance/#leadership
-[D]: https://xenproject.org/developers/governance/#conflict
+
+* `Expressing agreement and disagreement <B_>`_
+* `Lazy consensus / Lazy voting <7_>`_
+* `Informal votes or surveys <6_>`_
+* `Leadership team decisions <C_>`_
+* `Conflict resolution <D_>`_
+
+.. _1: http://www.paulgraham.com/disagree.html
+.. _3: https://www.createdebate.com/user/viewprofile/Loudacris
+.. _4: https://en.wikipedia.org/wiki/User:Rocket000
+.. _5: https://en.wiktionary.org/wiki/bikeshedding
+.. _6: https://xenproject.org/developers/governance/#informal-votes-or-surveys
+.. _7: https://xenproject.org/developers/governance/#lazyconsensus
+.. _A: https://xenproject.org/developers/governance/#decisions
+.. _B: https://xenproject.org/developers/governance/#expressingopinion
+.. _C: https://xenproject.org/developers/governance/#leadership
+.. _D: https://xenproject.org/developers/governance/#conflict
-- 
2.24.3 (Apple Git-128)


