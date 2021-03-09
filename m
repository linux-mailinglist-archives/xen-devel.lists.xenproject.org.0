Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA533290E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:50:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95515.180344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdge-00040c-GJ; Tue, 09 Mar 2021 14:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95515.180344; Tue, 09 Mar 2021 14:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdge-0003zt-Ad; Tue, 09 Mar 2021 14:50:16 +0000
Received: by outflank-mailman (input) for mailman id 95515;
 Tue, 09 Mar 2021 14:50:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lJdgc-0003zG-O8
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:50:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lJdgc-0000wF-NI
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:50:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lJdgc-00052f-Lh
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:50:14 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lJdga-0003Go-PW; Tue, 09 Mar 2021 14:50:12 +0000
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
	bh=9urRyAwbdbWhet5GvH1eHc+/+QWf8khOs5ffLcTY6lE=; b=lU43AgN/1k6/Om7AycIyU2l1DZ
	B6tTYTX2/mVatfWBrZFYKJmRgqblYlXMK8DE65VI9ElOwZ4/Ioi/5ziPAN/CmevlXE/596PzLyAP4
	UT7T447J+dryitIIZ2jvThOHVp7ALpNqeQRh3uGYLqAc9+T0iAbnLvUaJiEwNBEJNBHA=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 4.15 1/3] MAINTAINERS: Make myself the owner of the changelog
Date: Tue,  9 Mar 2021 14:50:00 +0000
Message-Id: <20210309145002.30359-2-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309145002.30359-1-iwj@xenproject.org>
References: <20210309145002.30359-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
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


