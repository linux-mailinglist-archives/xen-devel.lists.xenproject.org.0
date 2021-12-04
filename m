Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B532546880D
	for <lists+xen-devel@lfdr.de>; Sat,  4 Dec 2021 23:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238189.412830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtdMK-0005Ky-QV; Sat, 04 Dec 2021 22:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238189.412830; Sat, 04 Dec 2021 22:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtdMK-0005Hy-Kw; Sat, 04 Dec 2021 22:18:20 +0000
Received: by outflank-mailman (input) for mailman id 238189;
 Sat, 04 Dec 2021 22:18:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mtdMJ-0005Hs-78
 for xen-devel@lists.xenproject.org; Sat, 04 Dec 2021 22:18:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mtdMJ-0000YH-5U
 for xen-devel@lists.xenproject.org; Sat, 04 Dec 2021 22:18:19 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <ijackson@chiark.greenend.org.uk>) id 1mtdMJ-00068d-4T
 for xen-devel@lists.xenproject.org; Sat, 04 Dec 2021 22:18:19 +0000
Received: from [172.18.45.5] (helo=zealot.relativity.greenend.org.uk)
 by mariner.uk.xensource.com with esmtp (Exim 4.89)
 (envelope-from <ijackson@chiark.greenend.org.uk>)
 id 1mtdLz-0002Uc-CH; Sat, 04 Dec 2021 22:17:59 +0000
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
	bh=HflXVQd4U/EunfNUxkFSZ7aNxu449XTon/iisxA5kSg=; b=IfBirCfKrBgQ6muHT7ufulyYUm
	R7PMTmYpFnynCXibHv+J8u0VZtv65Z5xIXAURdPBzp1lXtYk7vccZU2qs+Ay5AcwstUvfRS6LCzkU
	NHJqd8sDGGrSYZ5ZQo1+/vRxCbMLdqGRIP3/AcvxufGdzyh4mPM7Olqp59/+VQPDfUQQ=;
From: Ian Jackson <iwj@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>
Subject: [OSSTEST PATCH] production-config: renumbering the test lab
Date: Sat,  4 Dec 2021 22:17:53 +0000
Message-Id: <20211204221753.2222-1-iwj@xenproject.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Our dhcp pool exhausted.  I am going to force push this.

Signed-off-by: Ian Jackson <iwj@xenproject.org>
---
 production-config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/production-config b/production-config
index 9a4054445..023b81622 100644
--- a/production-config
+++ b/production-config
@@ -27,7 +27,7 @@ HostDB_Executive_NoConfigDB 1
 Include /root/osstest-hosts-config
 
 DnsDomain test-lab.xenproject.org
-NetNameservers 172.16.144.4
+NetNameservers 10.149.64.4
 
 OwnerDaemonHost db
 QueueDaemonHost osstest
-- 
2.20.1


