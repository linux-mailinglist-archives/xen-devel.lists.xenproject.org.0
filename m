Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 674B4347DBA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 17:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101082.193039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6QI-0007xB-D9; Wed, 24 Mar 2021 16:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101082.193039; Wed, 24 Mar 2021 16:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP6QI-0007wI-7z; Wed, 24 Mar 2021 16:31:58 +0000
Received: by outflank-mailman (input) for mailman id 101082;
 Wed, 24 Mar 2021 16:31:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6QG-0007vm-OV
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:31:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6QG-0005JX-Nh
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:31:56 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lP6QG-00026L-Lu
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 16:31:56 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lP6QE-0005VL-RD; Wed, 24 Mar 2021 16:31:55 +0000
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
	bh=I7a/KqTgUlS2a+YtME8Q5NSlV/CLAv/DaCI9qim66Vg=; b=IykuV8s2rBp5kGMy+ltQdt4qkT
	3pPcXGBrMcZocLRlGB9dsbb+g0Dmnfd69wA3pJEJGDu6KKvEj9AeCTjwTQqX4xrVGL6anzRQej/ax
	zoevX7HaTm2bxAMKP5tkVWhOZTovyHutnn07OaZ4tNOEQcQXIcahgwtvzmWZo+XfOoUk=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
Subject: [PATCH for-4.15 2/2] CHANGELOG: Correct sub-section headings
Date: Wed, 24 Mar 2021 16:31:45 +0000
Message-Id: <20210324163145.9217-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324163145.9217-1-iwj@xenproject.org>
References: <20210324163145.9217-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 CHANGELOG.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c407f6bb2f..07f240b6ab 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,12 +6,12 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
-## Added / support upgraded
+### Added / support upgraded
  - ARM IOREQ servers (device emulation etc.) (Tech Preview)
  - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
  - ARM SMMUv3 (Tech Preview)
 
-## Removed / support downgraded
+### Removed / support downgraded
 
  - qemu-xen-traditional as host process device model, now "No security
    support, not recommended".  (Use as stub domain device model is still
-- 
2.20.1


