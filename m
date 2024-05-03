Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E98BAA67
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 11:59:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716316.1118423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2pgt-0002Gi-MG; Fri, 03 May 2024 09:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716316.1118423; Fri, 03 May 2024 09:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2pgt-0002EG-IT; Fri, 03 May 2024 09:58:55 +0000
Received: by outflank-mailman (input) for mailman id 716316;
 Fri, 03 May 2024 09:58:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IauD=MG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s2pgs-0002BX-Oq
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 09:58:54 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bef5dcdc-0933-11ef-b4bb-af5377834399;
 Fri, 03 May 2024 11:58:52 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-36-52-167.retail.telecomitalia.it [79.36.52.167])
 by support.bugseng.com (Postfix) with ESMTPSA id EEE5F4EE074A;
 Fri,  3 May 2024 11:58:51 +0200 (CEST)
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
X-Inumbo-ID: bef5dcdc-0933-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH 1/2] docs/misra: add Terms & Definitions section to rules.rst
Date: Fri,  3 May 2024 11:58:43 +0200
Message-Id: <05d9d4b4319f28d602b7366f2964c451a3a50ce3.1714727807.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714727807.git.federico.serafini@bugseng.com>
References: <cover.1714727807.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a section for terms and definitions used by MISRA but expressed
in terms of the C specification.

Add a definition of "switch clause" to the newly-introduced section.

Link the first use of the term "switch clause" in the document to its
definition.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Jan you were not completely satisfied by the definition but I didn't find
a better one.
---
 docs/misra/rules.rst | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index b7b447e152..d3b70fdf04 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -489,8 +489,7 @@ maintainers if you want to suggest a change.
 
    * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
      - Required
-     - An unconditional break statement shall terminate every
-       switch-clause
+     - An unconditional break statement shall terminate every switch-clause_
      - In addition to break, also other unconditional flow control statements
        such as continue, return, goto are allowed.
 
@@ -712,3 +711,14 @@ maintainers if you want to suggest a change.
      - The value of a pointer to a FILE shall not be used after the associated
        stream has been closed
      -
+
+Terms & Definitions
+-------------------
+
+.. _switch-clause:
+
+A *switch clause* can be defined as:
+"the non-empty list of statements which follows a non-empty list of
+case/default labels".
+A formal definition is available within the amplification of MISRA C:2012
+Rule 16.1.
-- 
2.34.1


