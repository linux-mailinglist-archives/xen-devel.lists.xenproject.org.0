Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA0A409949
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 18:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185809.334565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPork-0001sh-Mi; Mon, 13 Sep 2021 16:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185809.334565; Mon, 13 Sep 2021 16:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPork-0001iN-FZ; Mon, 13 Sep 2021 16:31:32 +0000
Received: by outflank-mailman (input) for mailman id 185809;
 Mon, 13 Sep 2021 16:31:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPori-0001O5-9W
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPori-00013a-8f
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:30 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPori-0006uT-7i
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:30 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mPorg-00038U-FS; Mon, 13 Sep 2021 17:31:28 +0100
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
	bh=sMavJ2/0+irHymF2bsrF77nW/ZVjI3FTaIZlspuZ0SU=; b=2NgfaoTIp28ifDBzrUtVKoCwmU
	qIsL6swcpRYoOdN89o5O6oR0SgywU0lZ2X3H9ckPvtEYxInOv12vHcyVptY1hgwOGuAbGklToG9YF
	QvQHVuqX17+ijTTXffppRFshkkgwp4yTBS0Lr+uFPqaEHsglRzVse28AifmA0LiP0DGs=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 4/5] mg-schema-test-database: Add a missing backslash
Date: Mon, 13 Sep 2021 17:31:14 +0100
Message-Id: <20210913163115.12749-4-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913163115.12749-1-iwj@xenproject.org>
References: <20210913163115.12749-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-test-database | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mg-schema-test-database b/mg-schema-test-database
index 052a3577..b185e8b9 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -285,7 +285,7 @@ create)
 	if [ "x$tasks" = x ]; then
 		arg='<based on username>'
 		moretasks error					\
-			"WHERE type = 'static'
+			"WHERE type = 'static'			\
 			   AND refkey = :'refkey'"		\
 			-v refkey="${username}@$(uname -n)"
 	fi
-- 
2.20.1


