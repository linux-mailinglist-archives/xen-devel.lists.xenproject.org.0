Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E1D37921B
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 17:07:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125321.235910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg7VQ-0008Ba-6H; Mon, 10 May 2021 15:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125321.235910; Mon, 10 May 2021 15:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg7VQ-000893-2i; Mon, 10 May 2021 15:07:36 +0000
Received: by outflank-mailman (input) for mailman id 125321;
 Mon, 10 May 2021 15:07:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lg7VO-00088x-DG
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 15:07:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg7VN-0007Zf-59; Mon, 10 May 2021 15:07:33 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lg7VM-0000KU-S6; Mon, 10 May 2021 15:07:33 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=GjXwukIvD8kbHiXk9G8DBtnyyL6OQFNZ/+Pgap0hRLY=; b=R8whYJgva8vwlgzUNJSnA09g6P
	+wvvrNmPM8K3Ns7z6V8iYypJclaFPIhJd241kxe4kQ/rwOnWB1PNFkgFsoYnzvX5Zx+vCybBlSt+f
	S6qjyV0dzVw4fSv+s1Hm9twIsR5trnI9y5eAA60urvtlPlpQtjEyQEAt38QGI7Fg8t8Y=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/xenstore: Fix indentation in the header of xenstored_control.c
Date: Mon, 10 May 2021 16:07:28 +0100
Message-Id: <20210510150728.6263-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Commit e867af081d94 "tools/xenstore: save new binary for live update"
seemed to have spuriously changed the indentation of the first line of
the copyright header.

The previous indentation is re-instated so all the lines are indented
the same.

Reported-by: Bjoern Doebel <doebel@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 tools/xenstore/xenstored_control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstored_control.c
index 8e470f2b2056..52d4817679fe 100644
--- a/tools/xenstore/xenstored_control.c
+++ b/tools/xenstore/xenstored_control.c
@@ -1,5 +1,5 @@
 /*
-Interactive commands for Xen Store Daemon.
+    Interactive commands for Xen Store Daemon.
     Copyright (C) 2017 Juergen Gross, SUSE Linux GmbH
 
     This program is free software; you can redistribute it and/or modify
-- 
2.17.1


