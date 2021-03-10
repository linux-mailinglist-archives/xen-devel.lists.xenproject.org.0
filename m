Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DA73342D3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 17:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96209.181850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1US-0005BZ-DB; Wed, 10 Mar 2021 16:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96209.181850; Wed, 10 Mar 2021 16:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1US-0005Ak-4A; Wed, 10 Mar 2021 16:15:16 +0000
Received: by outflank-mailman (input) for mailman id 96209;
 Wed, 10 Mar 2021 16:15:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UQ-00059X-Hf
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UQ-0005wG-FN
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UQ-0008JI-EI
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lK1UO-0006gF-Od; Wed, 10 Mar 2021 16:15:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=vhXuS3XbXLBnWlFAX24yLmDEtAJAC8XTjgPOj84rBTM=; b=679iH7cwKo7MHsNGhraNhof2sr
	K3kEFYmTj+vOSUqvURfToErLxbiVcivDTSNps1qegmtqxz9O6M79x3OjkmjX2FSCsoFSe4neaohsl
	gQWvZPHCFCixu+GnqFtRneUbsVl4CSdqtLrTqgaW+LAFGXhfrqpFadYGpGZ5FLY4I4NE=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
Subject: [PATCH 4.15 v2 2/3] CHANGELOG.md: Add sections for 4.14 (belated) and 4.15 (prospective)
Date: Wed, 10 Mar 2021 16:15:00 +0000
Message-Id: <20210310161501.13680-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310161501.13680-1-iwj@xenproject.org>
References: <20210310161501.13680-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

And update the release technician checklist to mention to edit it.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 CHANGELOG.md                                  | 4 +++-
 docs/process/release-technician-checklist.txt | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 5c3d3c791d..6805f9b7d4 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,7 +4,9 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
-## [Unreleased](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog)
+## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
+
+## [4.14.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.14.0) - 2020-07-23
 
 ### Added
  - This file and MAINTAINERS entry.
diff --git a/docs/process/release-technician-checklist.txt b/docs/process/release-technician-checklist.txt
index 7ed2636a12..880630c1ed 100644
--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -56,6 +56,8 @@ t=RELEASE-$r
 * change SUPPORT.md heading version number; -unstable or -rc tag
 *     (empty in stable branches after .0 release).
 * SUPPORT.md: insert correct version number in release-notes link
+* CHANGELOG.md: set section heading to delete UNRELEASED and add date;
+#               in unstable branches set to X.Y.0 and RELEASE-X.YY.0
 * change xen-unstable xen/Makefile XEN_EXTRAVERSION
 # if main version number has changed (eg 4.7 -> 4.8) rerun ./autogen.sh
 * rerun ./autogen.sh to update version number in configure
-- 
2.20.1


