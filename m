Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ADC3342D0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 17:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96208.181841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1UR-0005Ao-Vj; Wed, 10 Mar 2021 16:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96208.181841; Wed, 10 Mar 2021 16:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1UR-0005A8-Qm; Wed, 10 Mar 2021 16:15:15 +0000
Received: by outflank-mailman (input) for mailman id 96208;
 Wed, 10 Mar 2021 16:15:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UQ-00059S-9I
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UQ-0005wD-8d
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lK1UQ-0008JB-7Z
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:15:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lK1UO-0006gF-Fg; Wed, 10 Mar 2021 16:15:12 +0000
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
	bh=Xz3cxnkF07Qng2n8VUDnLR8Ky1qeiWhKzCYO1xe9ic8=; b=4w0jrIfM8g3I3iFCyocUwQq30B
	nGcApzBNDWd9czF4TILDfXq7ITc5rfZQ+r9efASGJCIKLSQVaiUhvnooWWEMR6SezfT1rHGlLYFm0
	foygdPYX9YSGyDlT9gBM9nB8qRHtt4YBx5Oqz27oJsrQIuyDf8cEMMtP58+vRJoHqy6k=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 4.15 v2 1/3] MAINTAINERS: Make myself the owner of the changelog
Date: Wed, 10 Mar 2021 16:14:59 +0000
Message-Id: <20210310161501.13680-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310161501.13680-1-iwj@xenproject.org>
References: <20210310161501.13680-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a5c481543..6a7fa8717e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -256,7 +256,7 @@ S:	Supported
 F:	xen/drivers/passthrough/arm/smmu-v3.c
 
 Change Log
-M:	Paul Durrant <paul@xen.org>
+M:	Ian Jackson <iwj@xenproject.org>
 R:	Community Manager <community.manager@xenproject.org>
 S:	Maintained
 F:	CHANGELOG.md
-- 
2.20.1


