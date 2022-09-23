Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAC55E7901
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 13:03:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410731.653876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgSY-0002ES-No; Fri, 23 Sep 2022 11:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410731.653876; Fri, 23 Sep 2022 11:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obgSY-0002BY-Kl; Fri, 23 Sep 2022 11:03:06 +0000
Received: by outflank-mailman (input) for mailman id 410731;
 Fri, 23 Sep 2022 11:03:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQMd=Z2=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1obgSY-0001gy-0J
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 11:03:06 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4c1fb3b8-3b2f-11ed-9647-05401a9f4f97;
 Fri, 23 Sep 2022 13:03:04 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7ABF139F;
 Fri, 23 Sep 2022 04:03:10 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 308523F73D;
 Fri, 23 Sep 2022 04:03:03 -0700 (PDT)
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
X-Inumbo-ID: 4c1fb3b8-3b2f-11ed-9647-05401a9f4f97
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] xen: Add static event channel in SUPPORT.md on ARM
Date: Fri, 23 Sep 2022 12:02:17 +0100
Message-Id: <02a4499694dec9fd48791a2d0c24a0d450b907ac.1663928523.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663928523.git.rahul.singh@arm.com>
References: <cover.1663928523.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Static event channel support is tech preview, which shall be documented
in SUPPORT.md

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 SUPPORT.md | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 8ebd63ad82..29f74ac506 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -922,6 +922,13 @@ bootscrub=off are passed as Xen command line parameters. (Memory should
 be scrubbed with bootscrub=idle.) No XSAs will be issues due to
 unscrubbed memory.
 
+## Static Event Channel
+
+Allow to setup the static event channel on dom0less system, enabling domains
+to send/receive notifications.
+
+    Status, ARM: Tech Preview
+
 # Format and definitions
 
 This file contains prose, and machine-readable fragments.
-- 
2.25.1


