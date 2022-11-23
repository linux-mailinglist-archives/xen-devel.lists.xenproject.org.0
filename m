Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EC9634E8F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 05:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447381.703554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxgzE-0008WR-Cq; Wed, 23 Nov 2022 04:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447381.703554; Wed, 23 Nov 2022 04:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxgzE-0008TS-9x; Wed, 23 Nov 2022 04:03:48 +0000
Received: by outflank-mailman (input) for mailman id 447381;
 Wed, 23 Nov 2022 04:03:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYU+=3X=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oxgzC-0008AS-Bx
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 04:03:46 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d341c5b7-6ae3-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 05:03:45 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 655A71477;
 Tue, 22 Nov 2022 20:03:51 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8CB23F587;
 Tue, 22 Nov 2022 20:03:42 -0800 (PST)
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
X-Inumbo-ID: d341c5b7-6ae3-11ed-8fd2-01056ac49cbb
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v4 3/3] CHANGELOG: Start new "unstable" section
Date: Wed, 23 Nov 2022 12:03:15 +0800
Message-Id: <20221123040315.1480112-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123040315.1480112-1-Henry.Wang@arm.com>
References: <20221123040315.1480112-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v3 -> v4:
- No change.
v2 -> v3:
- Take the opportunity to also adjust the 4.17 entry since this
  patch will be applied only after branching.
- Add 4.17 release date.
- Drop Julien's acked-by because of the content change.
v1 -> v2:
- Add Julien's Acked-by.
---
 CHANGELOG.md | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index b315d59259..956b758e6b 100644
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


