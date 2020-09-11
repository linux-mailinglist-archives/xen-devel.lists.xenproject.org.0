Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C459265FB0
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:41:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiMM-0006r2-Fo; Fri, 11 Sep 2020 12:40:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGiML-0006qe-JM
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:40:57 +0000
X-Inumbo-ID: b4de2033-e08c-4e7d-b2e9-73afb4043777
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4de2033-e08c-4e7d-b2e9-73afb4043777;
 Fri, 11 Sep 2020 12:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4TkW6rJdQqC67Ko9BJB8hryxF+queuUvVaaUxYxxmc=;
 b=AXTpEKoawqxIjBn5ZemMPwbW0kKsqiRIW+0+ZQnc5mit1lswRJa0GYWB
 TE8HSH8P+n4MzJmjcPaoIlMfA8pY6PQDaOulq8itXHKaWNCXaZ2Y1ZVT2
 LRoqGheHsPGyGFPd6uBg6TgOH3YhF/vZ4XKnuRmALfhqPJs6bfRPKrLdf Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: nE/V+3M4oA58AgeCpfuVZP3O/z+lYe5CAFF60fw/KZoo6lLU2kK7IJu+lvHBIM7hW+UJpffTjH
 V1mSuoAu4111FxgHHIXOsaYST9WWK+WZa1Qh4Ph868GEzZwNYvgoG5GTMvGgC7RZeRxImzpFCR
 qcPhq3EzsbPqSAj/RKiyMs5Gi0JGEddv8/4pwxyYH6gIKHrKRx+/Lk2bXHuvZlj23Jha5sRcxk
 PY+sLYxCjvIoPtA9tVHc1uofvl4iUIn80B22Y69AAcZFoBUeOwGU8cEoAOlhRlHkAsXarBtrmQ
 G0k=
X-SBRS: 2.7
X-MesageID: 26619471
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26619471"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 4/8] Convert communication-guide.md to rst
Date: Fri, 11 Sep 2020 13:40:05 +0100
Message-ID: <20200911124009.3760032-5-george.dunlap@citrix.com>
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

Convert headers and add necessary spaces to recognize lists.

Use the :doc: tag to cross-reference documents.  NB that this will
throw warnings for the documents not yet converted.

No textual changes.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 source/code-of-conduct.rst                    |  4 +--
 ...ation-guide.md => communication-guide.rst} | 27 ++++++++++++-------
 source/index.rst                              |  1 +
 3 files changed, 20 insertions(+), 12 deletions(-)
 rename source/{communication-guide.md => communication-guide.rst} (82%)

diff --git a/source/code-of-conduct.rst b/source/code-of-conduct.rst
index 81efe04..e2cdb4e 100644
--- a/source/code-of-conduct.rst
+++ b/source/code-of-conduct.rst
@@ -17,7 +17,7 @@ Our Standards
 We believe that a Code of Conduct can help create a harassment-free environment,
 but is not sufficient to create a welcoming environment on its own: guidance on
 creating a welcoming environment, how to communicate in an effective and
-friendly way, etc. can be found `here <Communication Guidance_>`_.
+friendly way, etc. can be found :doc:`here <communication-guide>`.
 
 Examples of unacceptable behavior by participants include:
 
@@ -97,6 +97,6 @@ https://www.contributor-covenant.org/version/1/4/code-of-conduct.html
 For answers to common questions about this code of conduct, see
 https://www.contributor-covenant.org/faq
 
-.. _Communication Guidance: communication-guide.md
+.. _Communication Guide: communication-guide.html
 .. _Project Governance: https://xenproject.org/developers/governance/#project-decisions
 .. _Contributor Covenant: https://www.contributor-covenant.org
diff --git a/source/communication-guide.md b/source/communication-guide.rst
similarity index 82%
rename from source/communication-guide.md
rename to source/communication-guide.rst
index 153b100..f212c7f 100644
--- a/source/communication-guide.md
+++ b/source/communication-guide.rst
@@ -1,6 +1,7 @@
-# Communication Guide
+Communication Guide
+*******************
 
-We believe that our [Code of Conduct](code-of-conduct.md) can help create a
+We believe that our :doc:`Code of Conduct <code-of-conduct>` can help create a
 harassment-free environment, but is not sufficient to create a welcoming
 environment on its own. We can all make mistakes: when we do, we take
 responsibility for them and try to improve.
@@ -9,16 +10,19 @@ This document lays out our gold standard, best practices for some common
 situations and mechanisms to help resolve issues that can have a
 negative effect on our community.
 
-## Goal
+Goal
+====
 
 We want a productive, welcoming and agile community that can welcome new
 ideas in a complex technical field which is able to reflect on and improve how
 we work.
 
-## Communication & Handling Differences in Opinions
+Communication & Handling Differences in Opinions
+================================================
 
 Examples of behavior that contributes to creating a positive environment
 include:
+
 * Use welcoming and inclusive language
 * Keep discussions technical and actionable
 * Be respectful of differing viewpoints and experiences
@@ -28,7 +32,8 @@ include:
 * Show empathy towards other community members
 * Resolve differences in opinion effectively
 
-## Getting Help
+Getting Help
+============
 
 When developing code collaboratively, technical discussion and disagreements
 are unavoidable. Our contributors come from different countries and cultures,
@@ -38,6 +43,7 @@ followed by indecision, sometimes this can impact working relationships
 or lead to other issues that can have a negative effect on our community.
 
 To minimize such issue, we provide a 3-stage process
+
 * Self-help as outlined in this document
 * Ability to ask for an independent opinion or help in private
 * Mediation between parties which disagree. In this case a neutral community
@@ -47,21 +53,22 @@ To minimize such issue, we provide a 3-stage process
 If you need and independent opinion or help, feel free to contact
 mediation@xenproject.org. The team behind mediation@ is made up of the
 same community members as those listed in the Conduct Team: see
-[Code of Conduct](code-of-conduct.md). In addition, team members are obligated
+:doc:`Code of Conduct <code-of-conduct>`. In addition, team members are obligated
 to maintain confidentiality with regard discussions that take place. If you
 have concerns about any of the members of the mediation@ alias, you are
 welcome to contact precisely the team member(s) of your choice. In this case,
 please make certain that you highlight the nature of a request by making sure
 that either help or mediation is mentioned in the e-mail subject or body.
 
-## Specific Topics and Best Practice
+Specific Topics and Best Practice
+=================================
 
-* [Code Review Guide](code-review-guide.md):
+* :doc:`Code Review Guide <code-review-guide>`:
   Essential reading for code reviewers and contributors
-* [Communication Best Practice](communication-practice.md):
+* :doc:`Communication Best Practice <communication-practice>`:
   This guide covers communication guidelines for code reviewers and authors.
   It should help you create self-awareness, anticipate, avoid  and help resolve
   communication issues.
-* [Resolving Disagreement](resolving-disagreement.md):
+* :doc:`Resolving Disagreement <resolving-disagreement>`:
   This guide lays out common situations that can lead to dead-lock and shows
   common patterns on how to avoid and resolve issues.
diff --git a/source/index.rst b/source/index.rst
index 079c02e..e0139fa 100644
--- a/source/index.rst
+++ b/source/index.rst
@@ -11,6 +11,7 @@ Welcome to XenProject Governance's documentation!
    :caption: Contents:
 
    code-of-conduct
+   communication-guide
 
 Indices and tables
 ==================
-- 
2.24.3 (Apple Git-128)


