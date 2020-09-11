Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBB265FAC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 14:40:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGiM6-0006i3-1S; Fri, 11 Sep 2020 12:40:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vrAB=CU=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kGiM3-0006hW-Oh
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 12:40:39 +0000
X-Inumbo-ID: 12abceb6-0e6e-4b53-ac42-e0f20e5d1a1d
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12abceb6-0e6e-4b53-ac42-e0f20e5d1a1d;
 Fri, 11 Sep 2020 12:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599828038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RIW8Kp6bukJ8jfRLiJqZntK27guAQKQDcsKbEPOP7X4=;
 b=ATBOOC6zo5XO0en1fJo6hX3MzfD+iYJUpJAG+hY1Db+27RLcE4a5Yl9g
 N88TeCXrx9ef6jJmJIfAfYzSNdsQzkn+x0FuJ/RxlRoNmZJNwlMnJYTKL
 Ubl+HTRTO2SHV5qrGG2KmPBiqaADRf/fvUBvZ6bbIJ2l0WvnbbZupBhDG o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GusAqBLP2hOZp55ijHdwqeBCR6JkxGGBvdGz4GE9Q2NbNgQQHFiVy+Sllo9C1SGV3lUkQfIvtd
 tN7snmpk2ZLmfERCBg6ovz+7cFxm46U9KLnrbH7A2c79FnUgLFLqwlYAx+ZNEB/95kp/GtGEtg
 QT5YpsjHAyYVadV9PmHyPhIoq3fYA+TU8UYxVNSgFw1RRUfkryba6RwpuGe2pAHICKsr99YNMN
 AKZjF745d960coYYEXd4XfpXePSxc4gkdXV7le8V38pFgFn0u81lhhYERxcbeCzxnBLEE9a3Dv
 ApM=
X-SBRS: 2.7
X-MesageID: 26789697
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,415,1592884800"; d="scan'208";a="26789697"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 3/8] Convert code-of-conduct to rst
Date: Fri, 11 Sep 2020 13:40:04 +0100
Message-ID: <20200911124009.3760032-4-george.dunlap@citrix.com>
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

Underline section titles.

Convert links to RST-style links.  NB that the Communication Guide
link won't work ATM; this will be fixed when we convert that document
to RST.

Adjust the formatting for the list so that it's converted properly.

A couple of clean-ups:

* Expand the label for communication guidance, and convert the link to
the project governance to a named reference rather than an "embedded"
URI.

* Move all hyperlink targets to the bottom of the article, and put
  them in the order they're linked.

No changes to the text.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
 ...code-of-conduct.md => code-of-conduct.rst} | 39 ++++++++++++-------
 source/conf.py                                |  2 +-
 source/index.rst                              |  1 +
 3 files changed, 27 insertions(+), 15 deletions(-)
 rename source/{code-of-conduct.md => code-of-conduct.rst} (83%)

diff --git a/source/code-of-conduct.md b/source/code-of-conduct.rst
similarity index 83%
rename from source/code-of-conduct.md
rename to source/code-of-conduct.rst
index a6080cd..81efe04 100644
--- a/source/code-of-conduct.md
+++ b/source/code-of-conduct.rst
@@ -1,6 +1,8 @@
-# Xen Project Code of Conduct
+Xen Project Code of Conduct
+***************************
 
-## Our Pledge
+Our Pledge
+==========
 
 In the interest of fostering an open and welcoming environment, we as
 contributors and maintainers pledge to make participation in our project and
@@ -9,12 +11,13 @@ size, disability, ethnicity, sex characteristics, gender identity and
 expression, level of experience, education, socio-economic status, nationality,
 personal appearance, race, religion, or sexual identity and orientation.
 
-## Our Standards
+Our Standards
+=============
 
 We believe that a Code of Conduct can help create a harassment-free environment,
 but is not sufficient to create a welcoming environment on its own: guidance on
 creating a welcoming environment, how to communicate in an effective and
-friendly way, etc. can be found [here][guidance]].
+friendly way, etc. can be found `here <Communication Guidance_>`_.
 
 Examples of unacceptable behavior by participants include:
 
@@ -27,7 +30,8 @@ Examples of unacceptable behavior by participants include:
 * Other conduct which could reasonably be considered inappropriate in a
   professional setting
 
-## Our Responsibilities
+Our Responsibilities
+====================
 
 Project leadership team members are responsible for clarifying the standards of
 acceptable behavior and are expected to take appropriate and fair corrective
@@ -39,7 +43,8 @@ contributions that are not aligned to this Code of Conduct, or to ban
 temporarily or permanently any contributor for other behaviors that they deem
 inappropriate, threatening, offensive, or harmful.
 
-## Scope
+Scope
+=====
 
 This Code of Conduct applies within all project spaces of all sub-projects,
 and it also applies when an individual is representing the project or its
@@ -49,7 +54,8 @@ media account, or acting as an appointed representative at an online or offline
 event. Representation of a project may be further defined and clarified by the
 project leadership.
 
-## What to do if you witness or are subject to unacceptable behavior
+What to do if you witness or are subject to unacceptable behavior
+=================================================================
 
 Instances of abusive, harassing, or otherwise unacceptable behavior may be
 reported by contacting Conduct Team members at conduct@xenproject.org. All
@@ -67,25 +73,30 @@ Project leadership team members who do not follow or enforce the Code of Conduct
 in good faith may face temporary or permanent repercussions as determined by
 other members of the project's leadership.
 
-## Conduct Team members
+Conduct Team members
+====================
+
 Conduct Team members are project leadership team members from any
 sub-project. The current list of Conduct Team members is:
+
 * Lars Kurth <lars dot kurth at xenproject dot org>
 * George Dunlap <george dot dunlap at citrix dot com>
 * Ian Jackson <ian dot jackson at citrix dot com>
 
 Conduct Team members are changed by proposing a change to this document,
 posted on all sub-project lists, followed by a formal global vote as outlined
-[here]: https://xenproject.org/developers/governance/#project-decisions
+`here <Project Governance_>`_.
 
-## Attribution
+Attribution
+===========
 
-This Code of Conduct is adapted from the [Contributor Covenant][homepage],
+This Code of Conduct is adapted from the `Contributor Covenant`_,
 version 1.4, available at
 https://www.contributor-covenant.org/version/1/4/code-of-conduct.html
 
-[homepage]: https://www.contributor-covenant.org
-[guidance]: communication-guide.md
-
 For answers to common questions about this code of conduct, see
 https://www.contributor-covenant.org/faq
+
+.. _Communication Guidance: communication-guide.md
+.. _Project Governance: https://xenproject.org/developers/governance/#project-decisions
+.. _Contributor Covenant: https://www.contributor-covenant.org
diff --git a/source/conf.py b/source/conf.py
index 7b99910..85bcedb 100644
--- a/source/conf.py
+++ b/source/conf.py
@@ -49,4 +49,4 @@ html_theme = 'alabaster'
 # Add any paths that contain custom static files (such as style sheets) here,
 # relative to this directory. They are copied after the builtin static files,
 # so a file named "default.css" will overwrite the builtin "default.css".
-html_static_path = ['_static']
\ No newline at end of file
+html_static_path = ['_static']
diff --git a/source/index.rst b/source/index.rst
index 99cb386..079c02e 100644
--- a/source/index.rst
+++ b/source/index.rst
@@ -10,6 +10,7 @@ Welcome to XenProject Governance's documentation!
    :maxdepth: 2
    :caption: Contents:
 
+   code-of-conduct
 
 Indices and tables
 ==================
-- 
2.24.3 (Apple Git-128)


