Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1CF62B252
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 05:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444154.699072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovA1U-0001q6-5H; Wed, 16 Nov 2022 04:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444154.699072; Wed, 16 Nov 2022 04:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovA1U-0001oS-22; Wed, 16 Nov 2022 04:27:40 +0000
Received: by outflank-mailman (input) for mailman id 444154;
 Wed, 16 Nov 2022 04:27:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po/4=3Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ovA1S-0001PM-9V
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 04:27:38 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ff630800-6566-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 05:27:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BBD513D5;
 Tue, 15 Nov 2022 20:27:42 -0800 (PST)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A4B523F663;
 Tue, 15 Nov 2022 20:27:34 -0800 (PST)
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
X-Inumbo-ID: ff630800-6566-11ed-91b6-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 3/3] CHANGELOG: Start new "unstable" section
Date: Wed, 16 Nov 2022 04:26:34 +0000
Message-Id: <20221116042634.50948-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221116042634.50948-1-Henry.Wang@arm.com>
References: <20221116042634.50948-1-Henry.Wang@arm.com>

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v1 -> v2:
- Add Julien's Acked-by.
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7418fc9326..014652a63b 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -4,6 +4,8 @@ Notable changes to Xen will be documented in this file.
 
 The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 
+## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
+
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2022-11-??
 
 ### Changed
-- 
2.17.1


