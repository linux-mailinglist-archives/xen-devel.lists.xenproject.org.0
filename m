Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CA4316CE1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 18:36:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83679.156368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tPr-0006Gi-RM; Wed, 10 Feb 2021 17:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83679.156368; Wed, 10 Feb 2021 17:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tPr-0006GI-M5; Wed, 10 Feb 2021 17:36:39 +0000
Received: by outflank-mailman (input) for mailman id 83679;
 Wed, 10 Feb 2021 17:36:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9tPq-0006G3-6R
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:36:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9tPq-0006Tt-5Q
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:36:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1l9tPq-0007oM-3j
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:36:38 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1l9tPo-0000Wv-8E; Wed, 10 Feb 2021 17:36:36 +0000
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
	Message-Id:Date:Subject:Cc:To:From;
	bh=hTYRoXTtZNmKydjwm79mBnW5f0OPODS85lQ5MlQDIf4=; b=hcN4jAvhDIvSKyYRRJQVHy3I6T
	ra828/KRGRF8wQ3xD1V8Vc5r7Y1S25Qn5f4qpTeQ8WWqt5n2zBpfKljo8FcweCSJV8BXv8GPVBh7U
	wi+gahWRoem5PNV54Gd9rBT6xcotsDP6+egX/YzmsldknaruBidhvGoknNARj76MWOIQ=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [OSSTEST PATCH 1/3] production-config: Rewind buster armhf snapshot to 2021-01-124
Date: Wed, 10 Feb 2021 17:36:27 +0000
Message-Id: <20210210173629.4788-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems that XXXX

CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 production-config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/production-config b/production-config
index f783af3c..d89257e5 100644
--- a/production-config
+++ b/production-config
@@ -93,7 +93,7 @@ TftpDiVersion_jessie 2018-06-26
 TftpDiVersion_stretch 2020-09-24
 TftpDiVersion_buster 2021-02-09
 
-DebianMirror_buster_armhf http://snapshot.debian.org/archive/debian/20210201T024125Z/
+DebianMirror_buster_armhf http://snapshot.debian.org/archive/debian/20210124T203726Z/
 
 DebianSnapshotBackports_jessie http://snapshot.debian.org/archive/debian/20190206T211314Z/
 
-- 
2.20.1


