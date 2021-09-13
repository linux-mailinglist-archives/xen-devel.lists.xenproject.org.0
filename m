Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB433409948
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 18:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185808.334555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPork-0001di-5w; Mon, 13 Sep 2021 16:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185808.334555; Mon, 13 Sep 2021 16:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPorj-0001YY-VA; Mon, 13 Sep 2021 16:31:31 +0000
Received: by outflank-mailman (input) for mailman id 185808;
 Mon, 13 Sep 2021 16:31:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPorh-0001Nz-VN
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPorh-00013W-UZ
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:29 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mPorh-0006uF-TX
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 16:31:29 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mPorf-00038U-W4; Mon, 13 Sep 2021 17:31:28 +0100
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
	bh=2KrAnSQzk3ed/sh0BW4PwuT+8cM48+hczIyiE6a28KY=; b=trh+PbrGGxpGlZ5YhZtpwpbati
	UUkcfTinh8yQlSLWKJl9d/Z7R17YMwD9jPKhdCXXvhP+VLh8pL1WTsz7lCNid41iSnojn6HpWgzC3
	arz6T6lfu337P567eb5cHuxbbxQ0XeGd8H/GM3XefqAQ7EV9WCmbutZECZBlPC8kIJKE=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH 3/5] mg-schema-test-database: Fix an error message
Date: Mon, 13 Sep 2021 17:31:13 +0100
Message-Id: <20210913163115.12749-3-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210913163115.12749-1-iwj@xenproject.org>
References: <20210913163115.12749-1-iwj@xenproject.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 mg-schema-test-database | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mg-schema-test-database b/mg-schema-test-database
index eae5d97e..052a3577 100755
--- a/mg-schema-test-database
+++ b/mg-schema-test-database
@@ -283,6 +283,7 @@ create)
 	done
 
 	if [ "x$tasks" = x ]; then
+		arg='<based on username>'
 		moretasks error					\
 			"WHERE type = 'static'
 			   AND refkey = :'refkey'"		\
-- 
2.20.1


