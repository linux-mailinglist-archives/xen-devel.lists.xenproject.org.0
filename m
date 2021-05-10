Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B1377E61
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124962.235273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Tn-00013Y-3S; Mon, 10 May 2021 08:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124962.235273; Mon, 10 May 2021 08:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Tm-00011E-Vv; Mon, 10 May 2021 08:41:30 +0000
Received: by outflank-mailman (input) for mailman id 124962;
 Mon, 10 May 2021 08:41:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jR2S=KF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lg1Tl-0000ei-RX
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:41:29 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 72a2a2b6-1ef0-48e9-b93f-c0a4888d172f;
 Mon, 10 May 2021 08:41:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7828106F;
 Mon, 10 May 2021 01:41:19 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6041E3F719;
 Mon, 10 May 2021 01:41:18 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 72a2a2b6-1ef0-48e9-b93f-c0a4888d172f
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 3/9] docs: add doxygen templates
Date: Mon, 10 May 2021 09:40:59 +0100
Message-Id: <20210510084105.17108-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510084105.17108-1-luca.fancellu@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>

Add doxygen templates for the doxygen documentation.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
 docs/xen-doxygen/customdoxygen.css | 36 +++++++++++++++++++
 docs/xen-doxygen/footer.html       | 21 +++++++++++
 docs/xen-doxygen/header.html       | 56 ++++++++++++++++++++++++++++++
 docs/xen-doxygen/mainpage.md       |  5 +++
 4 files changed, 118 insertions(+)
 create mode 100644 docs/xen-doxygen/customdoxygen.css
 create mode 100644 docs/xen-doxygen/footer.html
 create mode 100644 docs/xen-doxygen/header.html
 create mode 100644 docs/xen-doxygen/mainpage.md

diff --git a/docs/xen-doxygen/customdoxygen.css b/docs/xen-doxygen/customdoxygen.css
new file mode 100644
index 0000000000..4735e41cf5
--- /dev/null
+++ b/docs/xen-doxygen/customdoxygen.css
@@ -0,0 +1,36 @@
+/* Custom CSS for Doxygen-generated HTML
+ * Copyright (c) 2015 Intel Corporation
+ * SPDX-License-Identifier: Apache-2.0
+ */
+
+code {
+  font-family: Monaco,Menlo,Consolas,"Courier New",monospace;
+  background-color: #D8D8D8;
+  padding: 0 0.25em 0 0.25em;
+}
+
+pre.fragment {
+  display: block;
+  font-family: Monaco,Menlo,Consolas,"Courier New",monospace;
+  padding: 1rem;
+  word-break: break-all;
+  word-wrap: break-word;
+  white-space: pre;
+  background-color: #D8D8D8;
+}
+
+#projectlogo
+{
+  vertical-align: middle;
+}
+
+#projectname
+{
+  font: 200% Tahoma, Arial,sans-serif;
+  color: #3D578C;
+}
+
+#projectbrief
+{
+  color: #3D578C;
+}
diff --git a/docs/xen-doxygen/footer.html b/docs/xen-doxygen/footer.html
new file mode 100644
index 0000000000..a24bf2b9b4
--- /dev/null
+++ b/docs/xen-doxygen/footer.html
@@ -0,0 +1,21 @@
+<!-- HTML footer for doxygen 1.8.13-->
+<!-- start footer part -->
+<!--BEGIN GENERATE_TREEVIEW-->
+<div id="nav-path" class="navpath"><!-- id is needed for treeview function! -->
+  <ul>
+    $navpath
+    <li class="footer">$generatedby
+    <a href="http://www.doxygen.org/index.html">
+    <img class="footer" src="$relpath^doxygen.png" alt="doxygen"/></a> $doxygenversion </li>
+  </ul>
+</div>
+<!--END GENERATE_TREEVIEW-->
+<!--BEGIN !GENERATE_TREEVIEW-->
+<hr class="footer"/><address class="footer"><small>
+$generatedby &#160;<a href="http://www.doxygen.org/index.html">
+<img class="footer" src="$relpath^doxygen.png" alt="doxygen"/>
+</a> $doxygenversion
+</small></address>
+<!--END !GENERATE_TREEVIEW-->
+</body>
+</html>
diff --git a/docs/xen-doxygen/header.html b/docs/xen-doxygen/header.html
new file mode 100644
index 0000000000..83ac2f1835
--- /dev/null
+++ b/docs/xen-doxygen/header.html
@@ -0,0 +1,56 @@
+<!-- HTML header for doxygen 1.8.13-->
+<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
+<html xmlns="http://www.w3.org/1999/xhtml">
+<head>
+<meta http-equiv="Content-Type" content="text/xhtml;charset=UTF-8"/>
+<meta http-equiv="X-UA-Compatible" content="IE=9"/>
+<meta name="generator" content="Doxygen $doxygenversion"/>
+<meta name="viewport" content="width=device-width, initial-scale=1"/>
+<!--BEGIN PROJECT_NAME--><title>$projectname: $title</title><!--END PROJECT_NAME-->
+<!--BEGIN !PROJECT_NAME--><title>$title</title><!--END !PROJECT_NAME-->
+<link href="$relpath^tabs.css" rel="stylesheet" type="text/css"/>
+<script type="text/javascript" src="$relpath^jquery.js"></script>
+<script type="text/javascript" src="$relpath^dynsections.js"></script>
+$treeview
+$search
+$mathjax
+<link href="$relpath^$stylesheet" rel="stylesheet" type="text/css" />
+$extrastylesheet
+</head>
+<body>
+<div id="top"><!-- do not remove this div, it is closed by doxygen! -->
+
+<!--BEGIN TITLEAREA-->
+<div id="titlearea">
+<table cellspacing="0" cellpadding="0">
+ <tbody>
+ <tr style="height: 56px;">
+  <!--BEGIN PROJECT_LOGO-->
+  <td id="projectlogo"><img alt="Logo" src="$relpath^$projectlogo"/></td>
+  <!--END PROJECT_LOGO-->
+  <!--BEGIN PROJECT_NAME-->
+  <td id="projectalign" style="padding-left: 1em;">
+   <div id="projectname">$projectname
+   <!--BEGIN PROJECT_NUMBER-->&#160;<span id="projectnumber">$projectnumber</span><!--END PROJECT_NUMBER-->
+   </div>
+   <!--BEGIN PROJECT_BRIEF--><div id="projectbrief">$projectbrief</div><!--END PROJECT_BRIEF-->
+  </td>
+  <!--END PROJECT_NAME-->
+  <!--BEGIN !PROJECT_NAME-->
+   <!--BEGIN PROJECT_BRIEF-->
+    <td style="padding-left: 0.5em;">
+    <div id="projectbrief">$projectbrief</div>
+    </td>
+   <!--END PROJECT_BRIEF-->
+  <!--END !PROJECT_NAME-->
+  <!--BEGIN DISABLE_INDEX-->
+   <!--BEGIN SEARCHENGINE-->
+   <td>$searchbox</td>
+   <!--END SEARCHENGINE-->
+  <!--END DISABLE_INDEX-->
+ </tr>
+ </tbody>
+</table>
+</div>
+<!--END TITLEAREA-->
+<!-- end header part -->
diff --git a/docs/xen-doxygen/mainpage.md b/docs/xen-doxygen/mainpage.md
new file mode 100644
index 0000000000..ff548b87fc
--- /dev/null
+++ b/docs/xen-doxygen/mainpage.md
@@ -0,0 +1,5 @@
+# API Documentation   {#index}
+
+## Introduction
+
+## Licensing
-- 
2.17.1


