Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339D812D404
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 20:37:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1im0oF-0004ZW-Ge; Mon, 30 Dec 2019 19:34:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dA5B=2U=xenproject.org=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1im0oE-0004Z7-4x
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 19:34:34 +0000
X-Inumbo-ID: 1f9f1c0a-2b3b-11ea-88e7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f9f1c0a-2b3b-11ea-88e7-bc764e2007e4;
 Mon, 30 Dec 2019 19:32:32 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1im0mD-0003Tq-IT; Mon, 30 Dec 2019 19:32:29 +0000
Received: from localhost ([127.0.0.1] helo=MacBook-Pro-2.Home)
 by xenbits.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <lars.kurth@xenproject.org>)
 id 1im0mD-0007YU-Bu; Mon, 30 Dec 2019 19:32:29 +0000
From: Lars Kurth <lars.kurth@xenproject.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Dec 2019 19:32:16 +0000
Message-Id: <e2ebacd20a0e33967ccf02918505c8a8cedc95ab.1577733361.git.lars.kurth@citrix.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <cover.1577733361.git.lars.kurth@citrix.com>
References: <cover.1577733361.git.lars.kurth@citrix.com>
MIME-Version: 1.0
In-Reply-To: <cover.1577733361.git.lars.kurth@citrix.com>
References: <cover.1577733361.git.lars.kurth@citrix.com>
Subject: [Xen-devel] [PATCH v4 4/7] Add Communication Guide
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============0110528707075244787=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0110528707075244787==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

From: Lars Kurth <lars.kurth@citrix.com>

This document is a portal page that lays out our gold standard,
best practices for some common situations and mechanisms to help
resolve issues that can have a negative effect on our community.

Detail is covered in subsequent documents

Changes since v3
- Also changes the TODO in code-of-conduct.md which had been lost
  in v2

Changes since v2 (introduced in v2)
- Make lines break at 80 characters

Signed-off-by: Lars Kurth <lars.kurth@citrix.com>
---
Cc: minios-devel@lists.xenproject.org
Cc: xen-api@lists.xenproject.org
Cc: win-pv-devel@lists.xenproject.org
Cc: mirageos-devel@lists.xenproject.org
Cc: committers@xenproject.org
---
 code-of-conduct.md     |  4 +--
 communication-guide.md | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 2 deletions(-)
 create mode 100644 communication-guide.md

diff --git a/code-of-conduct.md b/code-of-conduct.md
index 7c29a4f..a6080cd 100644
--- a/code-of-conduct.md
+++ b/code-of-conduct.md
@@ -14,7 +14,7 @@ personal appearance, race, religion, or sexual identity and orientation.
 We believe that a Code of Conduct can help create a harassment-free environment,
 but is not sufficient to create a welcoming environment on its own: guidance on
 creating a welcoming environment, how to communicate in an effective and
-friendly way, etc. can be found [here][guidance].
+friendly way, etc. can be found [here][guidance]].
 
 Examples of unacceptable behavior by participants include:
 
@@ -85,7 +85,7 @@ version 1.4, available at
 https://www.contributor-covenant.org/version/1/4/code-of-conduct.html
 
 [homepage]: https://www.contributor-covenant.org
-[guidance]: TODO-INSERT-URL
+[guidance]: communication-guide.md
 
 For answers to common questions about this code of conduct, see
 https://www.contributor-covenant.org/faq
diff --git a/communication-guide.md b/communication-guide.md
new file mode 100644
index 0000000..153b100
--- /dev/null
+++ b/communication-guide.md
@@ -0,0 +1,67 @@
+# Communication Guide
+
+We believe that our [Code of Conduct](code-of-conduct.md) can help create a
+harassment-free environment, but is not sufficient to create a welcoming
+environment on its own. We can all make mistakes: when we do, we take
+responsibility for them and try to improve.
+
+This document lays out our gold standard, best practices for some common
+situations and mechanisms to help resolve issues that can have a
+negative effect on our community.
+
+## Goal
+
+We want a productive, welcoming and agile community that can welcome new
+ideas in a complex technical field which is able to reflect on and improve how
+we work.
+
+## Communication & Handling Differences in Opinions
+
+Examples of behavior that contributes to creating a positive environment
+include:
+* Use welcoming and inclusive language
+* Keep discussions technical and actionable
+* Be respectful of differing viewpoints and experiences
+* Be aware of your own and counterpart’s communication style and culture
+* Gracefully accept constructive criticism
+* Focus on what is best for the community
+* Show empathy towards other community members
+* Resolve differences in opinion effectively
+
+## Getting Help
+
+When developing code collaboratively, technical discussion and disagreements
+are unavoidable. Our contributors come from different countries and cultures,
+are driven by different goals and take pride in their work and in their point
+of view. This invariably can lead to lengthy and unproductive debate,
+followed by indecision, sometimes this can impact working relationships
+or lead to other issues that can have a negative effect on our community.
+
+To minimize such issue, we provide a 3-stage process
+* Self-help as outlined in this document
+* Ability to ask for an independent opinion or help in private
+* Mediation between parties which disagree. In this case a neutral community
+  member assists the disputing parties resolve the issues or will work with the
+  parties such that they can improve future interactions.
+
+If you need and independent opinion or help, feel free to contact
+mediation@xenproject.org. The team behind mediation@ is made up of the
+same community members as those listed in the Conduct Team: see
+[Code of Conduct](code-of-conduct.md). In addition, team members are obligated
+to maintain confidentiality with regard discussions that take place. If you
+have concerns about any of the members of the mediation@ alias, you are
+welcome to contact precisely the team member(s) of your choice. In this case,
+please make certain that you highlight the nature of a request by making sure
+that either help or mediation is mentioned in the e-mail subject or body.
+
+## Specific Topics and Best Practice
+
+* [Code Review Guide](code-review-guide.md):
+  Essential reading for code reviewers and contributors
+* [Communication Best Practice](communication-practice.md):
+  This guide covers communication guidelines for code reviewers and authors.
+  It should help you create self-awareness, anticipate, avoid  and help resolve
+  communication issues.
+* [Resolving Disagreement](resolving-disagreement.md):
+  This guide lays out common situations that can lead to dead-lock and shows
+  common patterns on how to avoid and resolve issues.
-- 
2.13.0



--===============0110528707075244787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0110528707075244787==--
