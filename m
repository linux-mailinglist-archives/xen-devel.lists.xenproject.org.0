Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FED649B43
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459162.716833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCT-0002vj-TB; Mon, 12 Dec 2022 09:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459162.716833; Mon, 12 Dec 2022 09:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fCT-0002s7-Px; Mon, 12 Dec 2022 09:34:17 +0000
Received: by outflank-mailman (input) for mailman id 459162;
 Mon, 12 Dec 2022 09:34:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fCS-0002gg-Jx
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:34:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCS-0000mq-5T; Mon, 12 Dec 2022 09:34:16 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fCR-0000rv-U6; Mon, 12 Dec 2022 09:34:16 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=TXtU8//lurM2F5mb2loMu+I4ppYz4X9RYDlyKMl3UM4=; b=ORJPKPifvRkMq8d9gLIT3F7Pxz
	fjJFR3UkHLrbwamlPjl330Mp7n8aJQsq4b/xN8CyxO94N4cJ8QFXwmOC53nY8pcKt1KCuV12prXME
	2hhVdCN/x4qqTdDAv8zqCPpBIQk8TM+WbCxa4ReMKLnfe0O1P0cGjAe1zXZsDZUrV3TY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	ijackson@chiark.greenend.org.uk
Subject: [PATCH 2/8] docs/process: branching-checklist: Remove reference to qemu-ijw.git
Date: Mon, 12 Dec 2022 09:34:04 +0000
Message-Id: <20221212093410.36289-3-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212093410.36289-1-julien@xen.org>
References: <20221212093410.36289-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Per [1], qemu-iwj.git was a clone of QEMU traditional on Ian's computer
for tagging QEMU trad.

The next section will provide tag for the official tree. So remove
the section about qemu-ijw.git.

[1] 25482.10006.140155.984629@chiark.greenend.org.uk

Signed-off-by: Julien Grall <jgrall@amazon.com>
Cc: ijackson@chiark.greenend.org.uk
---
 docs/process/branching-checklist.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/process/branching-checklist.txt b/docs/process/branching-checklist.txt
index 9aac474734c1..b8101dd0e359 100644
--- a/docs/process/branching-checklist.txt
+++ b/docs/process/branching-checklist.txt
@@ -1,9 +1,6 @@
 v=4.1
 ov=4.0
 
-* make branch in qemu-iwj.git
-    git-branch $v-testing master
-
 # make branches in xenbits.xen.org qemus
     ssh xen@xenbits.xen.org
     cd ~/git/qemu-xen.git
-- 
2.38.1


