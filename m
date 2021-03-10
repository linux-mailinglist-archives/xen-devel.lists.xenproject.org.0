Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65443342D2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 17:15:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96210.181862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1US-0005CO-QT; Wed, 10 Mar 2021 16:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96210.181862; Wed, 10 Mar 2021 16:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1US-0005BO-Ip; Wed, 10 Mar 2021 16:15:16 +0000
Received: by outflank-mailman (input) for mailman id 96210;
 Wed, 10 Mar 2021 16:15:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UR-00059c-0m
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UR-0005wJ-02
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:15 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UQ-0008JW-Tn
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lK1UO-0006gF-WD; Wed, 10 Mar 2021 16:15:13 +0000
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
	bh=NIQS8n+dtoRd9CTPhezV8eAtZRwcQ0FPCXvOOG2r64Q=; b=haXvJxUnqJvxbiHSQ5uWSphx6p
	I6jFlr9/pcObEIs5X69qtuVC1drA1x6cZLMvTrnCvi376vEQTMbaNesk+1rOhSDjs5WamZkDjSwtG
	LqpPMWc0Nqsu0aHC2QcbWq7Xpbb3mN14udoobitu0ABNtG1ta6nk2xKmioBmmXQVugh0=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org
Subject: [PATCH 4.15 v2 3/3] CHANGELOG.md: Glean some information from SUPPORT.md
Date: Wed, 10 Mar 2021 16:15:01 +0000
Message-Id: <20210310161501.13680-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310161501.13680-1-iwj@xenproject.org>
References: <20210310161501.13680-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 CHANGELOG.md | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 6805f9b7d4..c407f6bb2f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -6,6 +6,17 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
 ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
 
+## Added / support upgraded
+ - ARM IOREQ servers (device emulation etc.) (Tech Preview)
+ - Renesas IPMMU-VMSA (Supported, not security supported; was Tech Preview)
+ - ARM SMMUv3 (Tech Preview)
+
+## Removed / support downgraded
+
+ - qemu-xen-traditional as host process device model, now "No security
+   support, not recommended".  (Use as stub domain device model is still
+   supported - see SUPPORT.md.)
+
 ## [4.14.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.14.0) - 2020-07-23
 
 ### Added
-- 
2.20.1


