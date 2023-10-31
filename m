Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B567DCFA1
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:50:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625850.975578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxq3x-0002yX-QW; Tue, 31 Oct 2023 14:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625850.975578; Tue, 31 Oct 2023 14:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxq3x-0002vC-N6; Tue, 31 Oct 2023 14:49:49 +0000
Received: by outflank-mailman (input) for mailman id 625850;
 Tue, 31 Oct 2023 14:49:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxST=GN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qxq3w-0002NZ-0n
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:49:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bc52d934-77fc-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 15:49:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73DBB2F4;
 Tue, 31 Oct 2023 07:50:28 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C5BFC3F738;
 Tue, 31 Oct 2023 07:49:42 -0700 (PDT)
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
X-Inumbo-ID: bc52d934-77fc-11ee-98d6-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v5 2/2] CHANGELOG.md: Start new "unstable" section
Date: Tue, 31 Oct 2023 22:49:25 +0800
Message-Id: <20231031144925.2416266-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031144925.2416266-1-Henry.Wang@arm.com>
References: <20231031144925.2416266-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v5:
- Rebase on previous patches.
---
 CHANGELOG.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 94dbd83894..cbdc9bceac 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,14 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [unstable UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
+### Changed
+
+### Added
+
+### Removed
+
 ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-11-16
 
 ### Changed
-- 
2.25.1


