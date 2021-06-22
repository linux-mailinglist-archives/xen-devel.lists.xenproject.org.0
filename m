Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6C23B02A1
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 13:21:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145816.268197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lveSd-0004xm-8C; Tue, 22 Jun 2021 11:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145816.268197; Tue, 22 Jun 2021 11:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lveSd-0004w0-5E; Tue, 22 Jun 2021 11:20:55 +0000
Received: by outflank-mailman (input) for mailman id 145816;
 Tue, 22 Jun 2021 11:20:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lveSb-0004vt-IS
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 11:20:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lveSa-0001Ix-LN
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 11:20:52 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1lveSa-0007Io-KJ
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 11:20:52 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1lveSY-0003Uk-F5; Tue, 22 Jun 2021 12:20:50 +0100
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
	bh=Dy3EzjPU+kw34U/+oCRxwKhnKvTKMSWBReFgmFJ5pwA=; b=eC/61ZkTuHlp0e37NDJudS0JFy
	ciZAFhlEZpbit87I7U9rU9BQgnLr3RqsPHMuJJExYM3ZyKEeiBO2FARPQINpHImQEZ1pFoqHjW2Nv
	SmSG38DQkjF9Q3JhveCDfoIKyJPrK5D8rd0tsS5QXCW2kboWhJyDcfbYYwkyyHy3Rmws=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH] di-version update
Date: Tue, 22 Jun 2021 12:20:43 +0100
Message-Id: <20210622112043.18794-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 production-config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/production-config b/production-config
index bc658006..9a405444 100644
--- a/production-config
+++ b/production-config
@@ -91,7 +91,7 @@ TftpNetbootGroup osstest
 TftpDiVersion_wheezy 2016-06-08
 TftpDiVersion_jessie 2018-06-26
 TftpDiVersion_stretch 2020-09-24
-TftpDiVersion_buster 2021-02-10
+TftpDiVersion_buster 2021-06-22
 
 DebianMirror_buster_armhf http://snapshot.debian.org/archive/debian/20210124T203726Z/
 
-- 
2.20.1


