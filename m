Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B27C633B4E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 12:27:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447081.702985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxRQy-0007un-Ft; Tue, 22 Nov 2022 11:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447081.702985; Tue, 22 Nov 2022 11:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxRQy-0007rI-9e; Tue, 22 Nov 2022 11:27:24 +0000
Received: by outflank-mailman (input) for mailman id 447081;
 Tue, 22 Nov 2022 11:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPg5=3W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxRQw-0006t6-Sr
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 11:27:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a183aa65-6a58-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 12:27:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C76CD1480;
 Tue, 22 Nov 2022 03:27:27 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 782973F73B;
 Tue, 22 Nov 2022 03:27:19 -0800 (PST)
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
X-Inumbo-ID: a183aa65-6a58-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 3/3] CHANGELOG: Start new "unstable" section
Date: Tue, 22 Nov 2022 19:26:23 +0800
Message-Id: <20221122112623.1441905-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122112623.1441905-1-Henry.Wang@arm.com>
References: <20221122112623.1441905-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v2 -> v3:
- Take the opportunity to also adjust the 4.17 entry since this
  patch will be applied only after branching.
- Add 4.17 release date.
- Drop Julien's Acked-by because of the change of the patch.
v1 -> v2:
- Add Julien's Acked-by.
---
 CHANGELOG.md | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5ef507a49c..e2fb1974d6 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,7 +4,9 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
-## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging)
+## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
+## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-??
 
 ### Changed
  - On x86 "vga=current" can now be used together with GrUB2's gfxpayload setting. Note that
-- 
2.25.1


