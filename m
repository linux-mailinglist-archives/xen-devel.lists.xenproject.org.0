Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332918A1DE1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 20:20:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704120.1100295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruz2M-000503-VX; Thu, 11 Apr 2024 18:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704120.1100295; Thu, 11 Apr 2024 18:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruz2M-0004xe-RR; Thu, 11 Apr 2024 18:20:38 +0000
Received: by outflank-mailman (input) for mailman id 704120;
 Thu, 11 Apr 2024 18:20:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SAdS=LQ=solinno.co.uk=leigh@srs-se1.protection.inumbo.net>)
 id 1ruz2L-0004iO-D4
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 18:20:37 +0000
Received: from doppler.solinno.uk (doppler.solinno.uk [81.2.106.178])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 317080e7-f830-11ee-b908-491648fe20b8;
 Thu, 11 Apr 2024 20:20:36 +0200 (CEST)
Received: from folly.solinno.co.uk (folly.dyn.solinno.co.uk [192.168.2.135])
 by doppler.solinno.uk (Postfix) with ESMTPSA id 84A458009F;
 Thu, 11 Apr 2024 19:20:36 +0100 (BST)
Received: by folly.solinno.co.uk (Postfix, from userid 1000)
 id 61B7D2017C; Thu, 11 Apr 2024 19:20:36 +0100 (BST)
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
X-Inumbo-ID: 317080e7-f830-11ee-b908-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=solinno.co.uk;
	s=mail; t=1712859636;
	bh=TQCyOQsmoNABjx0+Ku+ZmhWfhTJA+iLoY6x/lfQL2DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0g0vFXlmNGfjpysAChqtnhKbK6v/fMMQC64t35xhu/FaB+6pCro2HsRiMW2NQv7S9
	 5UyABXkSej5HZ5EOpzW7PBqZb0MhTXv5wOwuYc9WMyb20Epl87/WToJsyD/RP1jQWO
	 I1S+Ld8JPFut0C5z1fCpzbHLQA3scMSIq2ozpuOU=
From: leigh@solinno.co.uk
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	slack@rabbit.lu,
	Leigh Brown <leigh@solinno.co.uk>
Subject: [PATCH v3 3/4] tools/misc: Add xenwatchdogd.c copyright notice
Date: Thu, 11 Apr 2024 19:20:22 +0100
Message-Id: <20240411182023.56309-4-leigh@solinno.co.uk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240411182023.56309-1-leigh@solinno.co.uk>
References: <20240411182023.56309-1-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leigh Brown <leigh@solinno.co.uk>

Add copyright notice and description of the program.

Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
---
 tools/misc/xenwatchdogd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/misc/xenwatchdogd.c b/tools/misc/xenwatchdogd.c
index a16d1efc13..2884ca6ca9 100644
--- a/tools/misc/xenwatchdogd.c
+++ b/tools/misc/xenwatchdogd.c
@@ -1,3 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xenwatchdogd.c
+ *
+ * Watchdog based on Xen hypercall watchdog interface.
+ *
+ * Copyright 2010 Citrix Ltd
+ * Copyright 2024 Leigh Brown <leigh@solinno.co.uk>
+ *
+ */
 
 #include <err.h>
 #include <limits.h>
-- 
2.39.2


