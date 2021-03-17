Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECBE33F004
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 13:09:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98683.187308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUyy-0006zD-61; Wed, 17 Mar 2021 12:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98683.187308; Wed, 17 Mar 2021 12:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUyy-0006yo-2s; Wed, 17 Mar 2021 12:09:00 +0000
Received: by outflank-mailman (input) for mailman id 98683;
 Wed, 17 Mar 2021 12:08:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lMUyw-0006yj-4o
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 12:08:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUyv-0005V6-RG; Wed, 17 Mar 2021 12:08:57 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lMUyv-0002OV-DZ; Wed, 17 Mar 2021 12:08:57 +0000
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
	bh=UuGE2Hn38TCab/AUY1GqL3H5+H9JAMYDF0NMkEX8SvE=; b=Z/q+JX2J84npfzeRCHCQ+rDUEL
	8ikB4sEzXKcf5VJREUYIAkz7WyIf6dYRNv8T+nijx8VBjjTPyf0b8QdIdE60gMuMmEY/4eT8dyFA/
	eA1qbeV95WTfjLQCXgrvoSV+wK/lwgmhB70eekaiTuCC9fWil7qrBRZokQaqZqyRG3ac=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 v3] SUPPORT.MD: Mark LiveUpdate of C/OCaml XenStored daemon as Tech Preview
Date: Wed, 17 Mar 2021 12:08:54 +0000
Message-Id: <20210317120854.19903-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Support to liveupdate C/OCaml XenStored daemon was added during the
4.15 development cycle. Add two new sections in SUPPORT.MD to explain
what is the support state.

For now, it is a tech preview.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

CC: Juergen Gross <jgross@suse.com>

    Changes in v3:
        - Add a section of OCaml XenStored

    Changes in v2:
        - Clarify this is only supported for the daemon version
        - Fix typoes
---
 SUPPORT.md | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/SUPPORT.md b/SUPPORT.md
index 7db4568f1a0f..1021a24801dc 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -177,6 +177,14 @@ Support for running qemu-xen device model in a linux stubdomain.
 
     Status: Tech Preview
 
+## Liveupdate of C XenStored daemon
+
+    Status: Tech Preview
+
+## Liveupdate of OCaml XenStored daemon
+
+    Status: Tech Preview
+
 ## Toolstack/3rd party
 
 ### libvirt driver for xl
-- 
2.17.1


